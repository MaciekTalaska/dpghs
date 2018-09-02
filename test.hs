import Data.List
import Data.Maybe
import System.Random

findIndexToSplit p line = fromMaybe (-1) (findIndex p line) +1

extract line = snd (splitAt (findIndexToSplit (=='\t') line) line)
-- extract line = snd (splitAt ((fromMaybe (-1) (findIndex (=='\t') line )) + 1) line)

createRepository ls = map extract ls

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

