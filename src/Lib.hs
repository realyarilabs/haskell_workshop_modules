module Lib
    ( someFunc
    ) where

import Points
import Move
import Data.Maybe          -- fromMaybe
import System.Environment  -- getArgs
import Text.Read           -- readMaybe

safeHead :: [a] -> Maybe a
safeHead []     = Nothing
safeHead (a:as) = Just a

someFunc :: IO ()
someFunc = do
  args <- getArgs
  let coordStr = fromMaybe "(0,0)" (safeHead args)                                      -- Default for no args
  let originPoint = FPoint (fromMaybe (0, 0) (readMaybe coordStr))                      -- Default for wrong args

  directionsLines <- getContents
  let directions = (catMaybes . (map readMaybe) . lines) directionsLines :: [Direcção]  -- Discard unreadable lines

  print $ percorre originPoint directions
