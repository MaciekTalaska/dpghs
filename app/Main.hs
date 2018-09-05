module Main where

import Utils
import System.Directory
import Data.List

isDicewareFile :: [Char] -> Bool
isDicewareFile filename = (isPrefixOf "diceware-" filename) && (isSuffixOf ".txt" filename)

main :: IO ()
main = do
  all_files <- getDirectoryContents "."
  let diceware_files = (filter (\x -> isDicewareFile x) all_files)
  mapM_ (\x -> printPassword x 5) diceware_files
