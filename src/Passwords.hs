module Passwords
  ( generatePassword,
    printPassword,
    createPasswordFromFilename,
    createPasswordAsStringFromFilename
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

createPasswordFromFilename :: (Num a, Enum a) => FilePath -> a -> IO [[Char]]
createPasswordFromFilename filename size = do
  ws <- createRepository filename
  password <- generatePassword size ws
  return password


createPasswordAsStringFromFilename :: (Num a, Enum a) => FilePath -> a -> IO [Char]
createPasswordAsStringFromFilename filename size = do
  ws <- createRepository filename
  password <- generatePassword size ws
  return (intercalate "-" password)
