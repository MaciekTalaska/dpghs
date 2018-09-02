import Data.List
import Data.Maybe
import System.Random

findIndexToSplit p line = fromMaybe (-1) (findIndex p line) +1

extractWordWs line = snd (splitAt (findIndexToSplit (=='\t') line) line)
-- extractWordWs line = snd (splitAt ((fromMaybe (-1) (findIndex (=='\t') line )) + 1) line)

extractAllWords ls = map extractWordWs ls

createRepository filename = do
  contents <- readFile filename
  let ls = lines contents
  return (extractAllWords ls)

getRandomIndex list = randomRIO (0, (length list))
getRandomElement list = (getRandomIndex list) >>= \x -> return $ list !! x

chooseRandom list = do
  index <- (getRandomIndex list)
  return $ list !! index

getRandomElement2 list = do
  index <- (getRandomIndex list)
  list !! index

getRandomE list = do
  word <- getRandomElement list
  return word

printMessageAndValue title password = do
  print title
  print password

generatePassword size wlist = do
  password <- mapM (\_ -> getRandomElement wlist) [1..size]
  return password

