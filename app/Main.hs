module Main where

import Utils
import Repository

main :: IO ()
main = do
  diceware_files <- getDicewareFiles
  -- mapM_ (\x -> printPassword x 5) diceware_files
  passwords <- mapM (\x -> createPasswordFromDicewareList x 5 ) diceware_files
  passwords2 <- mapM (\x -> createPasswordAsStringFromDicewareList2 x 5) diceware_files
  print "passwords: "
  print passwords
  print "second batch of passwords: "
  print passwords2
