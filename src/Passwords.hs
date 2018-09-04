module Passwords
  ( generatePassword
  ) where

import Crypto

generatePassword :: (Num a, Enum a) => a -> [b] -> IO [b]
generatePassword size wlist = do
  password <- mapM (\_ -> getRandomElement wlist) [1..size]
  return password
