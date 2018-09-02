module Main where

import Lib
import Data.List
import Data.Maybe
import System.Random

findIndexToSplit :: (a -> Bool) -> [a] -> Int
findIndexToSplit p line = fromMaybe (-1) (findIndex p line) +1

extractWordWs :: [Char] -> [Char]
extractWordWs line = snd (splitAt (findIndexToSplit (=='\t') line) line)

extractAllWords :: [[Char]] -> [[Char]]
extractAllWords ls = map extractWordWs ls

createRepository :: FilePath -> IO [[Char]]
createRepository filename = do
  contents <- readFile filename
  let ls = lines contents
  return (extractAllWords ls)

getRandomIndex :: Foldable t => t a -> IO Int
getRandomIndex list = randomRIO (0, (length list))

getRandomElement :: [b] -> IO b
getRandomElement list = (getRandomIndex list) >>= \x -> return $ list !! x

getRandomElement2 :: [b] -> IO b
getRandomElement2 list = do
  index <- (getRandomIndex list)
  return (list !! index)

generatePassword :: (Num a, Enum a) => a -> [b] -> IO [b]
generatePassword size wlist = do
  password <- mapM (\_ -> getRandomElement wlist) [1..size]
  return password

printMessageAndValue :: (Show a1, Show a2) => a1 -> a2 -> IO ()
printMessageAndValue title password = do
  print title
  print password

main :: IO ()
main = do
  ws <- createRepository "diceware-en.txt"
  password <- generatePassword 5 ws
  printMessageAndValue "generated password: " password

