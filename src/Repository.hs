module Repository
    ( extractWordWs,
      extractAllWords,
      createRepository,
      getDicewareFiles
    ) where

import Data.List
import Data.Maybe
import Data.Char
import System.Directory

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

-- TODO: regex here should be better idea
isDicewareFile :: [Char] -> Bool
isDicewareFile filename = (isPrefixOf "diceware-" filename) && (isSuffixOf ".txt" filename)

getDicewareFiles :: IO [[Char]]
getDicewareFiles = do
  all_files <- getDirectoryContents "."
  let diceware_files = (filter (\x -> isDicewareFile x) all_files)
  return diceware_files
