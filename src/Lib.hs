module Lib (someFunc) where

import Greet.English
import Greet.Portuguese
import Greet.World
import InteractLine

someFunc :: IO ()
someFunc = interactLine greet

greet :: String -> String
greet "pt" = undefined
greet "en" = undefined
greet _ = undefined
