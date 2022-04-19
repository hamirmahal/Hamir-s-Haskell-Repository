import Data.Char
import Data.Function
import Data.List

{-
ghc -o main main.hs && ./main
ghc -o main main.hs && ./main > main.hs.output.txt
-}

gitHubResponseString :: String
gitHubResponseString = "device_code=f57537be76960aed42752846abd2602bc0bb49d5&expires_in=899&interval=5&user_code=B395-3C7A&verification_uri=https%3A%2F%2Fgithub.com%2Flogin%2Fdevice"

ampersands :: Char -> Bool
ampersands c = c == '&'

stringArrayWithAmpersands :: [ String ]
stringArrayWithAmpersands = groupBy ((==) `on` ampersands) gitHubResponseString

stringArrayWithoutAmpersands :: [ String ]
stringArrayWithoutAmpersands = filter (not . any ampersands) stringArrayWithAmpersands

main = print stringArrayWithoutAmpersands