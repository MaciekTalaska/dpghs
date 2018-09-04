module Lib
    ( someFunc,
      findIndexToSplit,
      extractWordWs,
      extractAllWords,
      createRepository
    ) where

import Data.List
import Data.Maybe
import Data.Char

someFunc :: IO ()
someFunc = putStrLn "someFunc"

findIndexToSplit :: (a -> Bool) -> [a] -> Int
findIndexToSplit p line = fromMaybe (-1) (findIndex p line) +1

extractWordWs :: [Char] -> [Char]
extractWordWs line = snd (splitAt (findIndexToSplit (isSpace) line) line)

extractAllWords :: [[Char]] -> [[Char]]
extractAllWords ls = map extractWordWs ls

createRepository :: FilePath -> IO [[Char]]
createRepository filename = do
  contents <- readFile filename
  let ls = lines contents
  return (extractAllWords ls)
