module Main where

import Lib
import Data.List
import Data.Maybe
import System.Random

findIndexToSplit :: (a -> Bool) -> [a] -> Int
findIndexToSplit p line = fromMaybe (-1) (findIndex p line) +1

extract :: [Char] -> [Char]
extract line = snd (splitAt (findIndexToSplit (=='\t') line) line)

createRepository :: [[Char]] -> [[Char]]
createRepository ls = map extract ls

getRandomElement :: [b] -> IO b
getRandomElement ls = (randomRIO (0, length ls)) >>= \x -> return $ ls !! x

main :: IO ()
main = do
  contents <- readFile "diceware-en.txt"
  let ls = lines contents
  let ws = createRepository ls
  word <- getRandomElement ws
  print "random word: "
  print word
