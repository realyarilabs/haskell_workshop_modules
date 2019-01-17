module Lib (someFunc) where

import Greet.French
import Greet.English
import Greet.Portuguese


import InteractLine (interactLine)

someFunc :: IO ()
someFunc = interactLine greet

greet :: String -> String
greet _ = undefined
