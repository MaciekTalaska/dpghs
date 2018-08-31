module Main where

import Lib

main :: IO ()
main = do
  contents <- readFile "diceware-en.txt"
  let ls = lines contents
  print (take 10 ls)
