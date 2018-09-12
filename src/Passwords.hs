module Passwords
  (
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

generatePasswordSeparated :: (Num a1, Enum a1) => a1 -> [[a2]] -> [a2] -> IO [a2]
generatePasswordSeparated size wlist separator = do
  password <- generatePassword size wlist
  return (intercalate separator password)

createAllPasswords :: [Char] -> String -> String -> IO ()
createAllPasswords language passwordLength passwordsCount = do
  let count = (read passwordsCount :: Integer)
  ws <- createRepository ("diceware-"++language++".txt")
  let size = (read passwordLength :: Integer)
  passwords <- mapM (\_ -> generatePasswordSeparated size ws "-") [1..count]
  print passwords
