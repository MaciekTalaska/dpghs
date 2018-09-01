module Main where

import Lib
import Data.List
import Data.Maybe

findIndexToSplit :: (a -> Bool) -> [a] -> Int
findIndexToSplit p line = fromMaybe (-1) (findIndex p line) +1

extract :: [Char] -> [Char]
extract line = snd (splitAt (findIndexToSplit (=='\t') line) line)

createRepository :: [[Char]] -> [[Char]]
createRepository ls = map extract ls
 
main :: IO ()
main = do
  contents <- readFile "diceware-en.txt"
  let ls = lines contents
  -- let first_word = extract (head ls)
  let ws = createRepository ls
  print "first 10 words: "
  print (take 10 ws)
