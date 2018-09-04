module Main where

import Repository
import Crypto

-- Passwords
generatePassword :: (Num a, Enum a) => a -> [b] -> IO [b]
generatePassword size wlist = do
  password <- mapM (\_ -> getRandomElement wlist) [1..size]
  return password

-- Utils?
printMessageAndValue :: (Show a1, Show a2) => a1 -> a2 -> IO ()
printMessageAndValue title password = do
  print title
  print password

printPassword :: (Num a, Enum a) => FilePath -> a -> IO ()
printPassword filename passwordLength = do
  ws <- createRepository filename
  password <- generatePassword passwordLength ws
  printMessageAndValue "generated password: " password

main :: IO ()
main = do
  printPassword "diceware-en.txt" 5
  printPassword "diceware-pl.txt" 5
  printPassword "diceware-fi.txt" 5
  printPassword "diceware-mi.txt" 5
