module Main where

import Repository
import Passwords
import System.Environment
import System.Exit

usage :: IO ()
usage   = putStrLn "Usage: dpghs -m <language> -w <password length> -p <passwords_count>"

version :: IO ()
version = putStrLn "dpghs 0.1"

exit :: IO a
exit    = exitWith ExitSuccess

exitFail :: IO a
exitFail = exitWith (ExitFailure 1)

processForPasswords :: [Char] -> String -> p -> IO ()
processForPasswords language passwordLength passwordsCount = do
  --print ("language: " ++ language)
  --print ("password length: " ++ passwordLength)
  --print ("password count: " ++ passwordsCount)
  password <- createPasswordAsStringFromDicewareList2 ("diceware-"++language++".txt") (read passwordLength :: Integer)
  print password

main :: IO ()
main = do
  args <- getArgs
  case args of
    ["-v"] -> version >> exit
    ["-h"] -> usage >> exit
    ["-l", l, "-w", w, "-p", p] -> processForPasswords l w p
    ["-l", l, "-p", p, "-w", w] -> processForPasswords l w p
    ["-w", w, "-l", l, "-p", p] -> processForPasswords l w p
    ["-w", w, "-p", p, "-l", l] -> processForPasswords l w p
    ["-p", p, "-l", l, "-w", w] -> processForPasswords l w p
    ["-p", p, "-w", w, "-l", l] -> processForPasswords l w p
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
