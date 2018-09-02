module Main where

import Lib
import Data.List
import Data.Maybe
import System.Random

findIndexToSplit :: (a -> Bool) -> [a] -> Int
findIndexToSplit p line = fromMaybe (-1) (findIndex p line) +1

extract :: [Char] -> [Char]
extract line = snd (splitAt (findIndexToSplit (=='\t') line) line)

createRepository :: [[Char]] -> [[Char]]
createRepository ls = map extract ls

getRandomIndex :: Foldable t => t a -> IO Int
getRandomIndex list = randomRIO (0, (length list))

getRandomElement :: [b] -> IO b
getRandomElement list = (getRandomIndex list) >>= \x -> return $ list !! x

getRandomElement2 :: [b] -> IO b
getRandomElement2 list = do
  index <- (getRandomIndex list)
  return (list !! index)

printMessageAndValue title password = do
  print title
  print password

main :: IO ()
main = do
  contents <- readFile "diceware-en.txt"
  let ls = lines contents
  let ws = createRepository ls
  password <- mapM (\_ -> getRandomElement ws) [1..5]
  printMessageAndValue "password generated using mapM & getRandomElement: " password
  password2 <- mapM (\_ -> getRandomElement2 ws) [1..5]
  printMessageAndValue "password generated using mapM & getRandomElement2: " password2

