module Main where

import Lib
import Data.List
import Data.Maybe

extract :: [Char] -> [Char]
extract line = snd (splitAt ((fromMaybe (-1) (findIndex (=='\t') line )) + 1) line)
 
main :: IO ()
main = do
  contents <- readFile "diceware-en.txt"
  let ls = lines contents
  let first_word = extract (head ls)
  print "first word: "
  print first_word 
