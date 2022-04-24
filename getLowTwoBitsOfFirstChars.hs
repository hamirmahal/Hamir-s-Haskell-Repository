import Data.Bits ( Bits((.&.)) )

{-
runhaskell getLowTwoBitsOfFirstChars.hs | tee getLowTwoBitsOfFirstChars.output.txt
ghc --make getLowTwoBitsOfFirstChars.hs && ./getLowTwoBitsOfFirstChars | tee getLowTwoBitsOfFirstChars.output.txt
-}

main :: IO ()
main = do
  contents <- readFile "getLowTwoBitsOfFirstChars.input.txt"
  let wordsContents = words contents
  let arrayOfCharacters = map head wordsContents
  let arrayOfInts = map fromEnum arrayOfCharacters
  let lowTwoBitsOfFirstCharacterOfEachWord = map (.&. 3) arrayOfInts
  mapM_ print lowTwoBitsOfFirstCharacterOfEachWord
