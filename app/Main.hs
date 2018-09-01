module Main where

import Lib
import Data.List
import Data.Maybe

findIndexToSplit :: (a -> Bool) -> [a] -> Int
findIndexToSplit p line = fromMaybe (-1) (findIndex p line) +1

extract :: [Char] -> [Char]
extract line = snd (splitAt (findIndexToSplit (=='\t') line) line)
-- extract line = snd (splitAt ((fromMaybe (-1) (findIndex (=='\t') line )) + 1) line)
 
main :: IO ()
main = do
  contents <- readFile "diceware-en.txt"
  let ls = lines contents
  let first_word = extract (head ls)
  print "first word: "
  print first_word 
