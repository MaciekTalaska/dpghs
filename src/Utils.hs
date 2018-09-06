module Utils
  ( printMessageAndValue,
    printPassword,
    createPasswordFromDicewareList,
    createPasswordAsStringFromDicewareList2
  ) where

import Repository
import Passwords

printMessageAndValue :: (Show a1, Show a2) => a1 -> a2 -> IO ()
printMessageAndValue title password = do
  print title
  print password

printPassword :: (Num a, Enum a) => FilePath -> a -> IO ()
printPassword filename passwordLength = do
  ws <- createRepository filename
  password <- generatePassword passwordLength ws
  printMessageAndValue "generated password: " password

createPasswordFromDicewareList :: (Num a, Enum a) => FilePath -> a -> IO [[Char]]
createPasswordFromDicewareList filename size = do
  ws <- createRepository filename
  password <- generatePassword size ws
  return password


createPasswordAsStringFromDicewareList2 :: (Num a, Enum a) => FilePath -> a -> IO [Char]
createPasswordAsStringFromDicewareList2 filename size = do
  ws <- createRepository filename
  password <- generatePassword size ws
  return (unwords password)
