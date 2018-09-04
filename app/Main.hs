module Main where

import Utils

main :: IO ()
main = do
  printPassword "diceware-en.txt" 5
  printPassword "diceware-pl.txt" 5
  printPassword "diceware-fi.txt" 5
  printPassword "diceware-mi.txt" 5
