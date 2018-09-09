module Main where

import Passwords
import System.Environment
import System.Exit

usage :: IO ()
usage   = putStrLn "Usage: dpghs -l language -w password_length_in_words -p numbers_of_password_to_generate"

version :: IO ()
version = putStrLn "dpghs 0.1"

exit :: IO a
exit    = exitWith ExitSuccess

exitFail :: IO a
exitFail = exitWith (ExitFailure 1)

main :: IO ()
main = do
  args <- getArgs
  case args of
    ["-v"] -> version >> exit
    ["-h"] -> usage >> exit
    ["-l", l, "-w", w, "-p", p] -> createAllPasswords l w p
    ["-l", l, "-p", p, "-w", w] -> createAllPasswords l w p
    ["-w", w, "-l", l, "-p", p] -> createAllPasswords l w p
    ["-w", w, "-p", p, "-l", l] -> createAllPasswords l w p
    ["-p", p, "-l", l, "-w", w] -> createAllPasswords l w p
    ["-p", p, "-w", w, "-l", l] -> createAllPasswords l w p
    otherwise -> do
      putStrLn "error! type: 'dpghs -h' for help"
      exitFail

--  diceware_files <- getDicewareFiles
--  passwords <- mapM (\x -> createPasswordFromDicewareList x 5 ) diceware_files
--  passwords2 <- mapM (\x -> createPasswordAsStringFromDicewareList2 x 5) diceware_files
--  print "passwords: "
--  print passwords
--  print "second batch of passwords: "
--  print passwords2
