module Main where

import Repository
import Passwords

main :: IO ()
main = do
  diceware_files <- getDicewareFiles
  passwords <- mapM (\x -> createPasswordFromDicewareList x 5 ) diceware_files
  passwords2 <- mapM (\x -> createPasswordAsStringFromDicewareList2 x 5) diceware_files
  print "passwords: "
  print passwords
  print "second batch of passwords: "
  print passwords2
