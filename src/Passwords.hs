module Passwords
  ( generatePassword,
    printPassword,
    createPasswordFromDicewareList,
    createPasswordAsStringFromDicewareList2
  ) where

import Crypto
import Repository
import Data.List
import Utils

generatePassword :: (Num a, Enum a) => a -> [b] -> IO [b]
generatePassword size wlist = do
  password <- mapM (\_ -> getRandomElement wlist) [1..size]
  return password

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
  return (intercalate "-" password)
