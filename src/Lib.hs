module Lib (someFunc) where

import InteractLine

someFunc :: IO ()
someFunc = interactLine greet

greet :: String -> String
greet = undefined
