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
  -- mapM_ (\x -> printPassword x 5) diceware_files
  passwords <- mapM (\x -> createPasswordFromDicewareList x 5 ) diceware_files
  passwords2 <- mapM (\x -> createPasswordAsStringFromDicewareList2 x 5) diceware_files
  print "passwords: "
  print passwords
  print "second batch of passwords: "
  print passwords2
