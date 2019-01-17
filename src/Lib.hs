module Lib (someFunc) where

import InteractLine (interactLine)

someFunc :: IO ()
someFunc = interactLine greet

greet :: String -> String
greet _ = undefined
