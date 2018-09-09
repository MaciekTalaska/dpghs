module Passwords
  ( printPassword,
    createPasswordFromFilename,
    createPasswordAsStringFromFilename,
    createSinglePassword,
    createAllPasswords
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

createSinglePassword :: [Char] -> String -> IO [Char]
createSinglePassword language passwordLength = do
  let wordCount = (read passwordLength :: Integer)
  let filename = "diceware-" ++ language ++ ".txt"
  password <- createPasswordAsStringFromFilename filename wordCount
  return password

createAllPasswords :: [Char] -> String -> String -> IO ()
createAllPasswords language passwordLength passwordsCount = do
  let count = (read passwordsCount :: Integer)
  passwords <- mapM (\_ -> createSinglePassword language passwordLength) [1..count]
  print passwords
