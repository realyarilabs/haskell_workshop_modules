module Lib (someFunc) where

import Greet.English
import Greet.Portuguese
import Greet.World
import InteractLine

someFunc :: IO ()
someFunc = interactLine greet

-- TODO
greet :: String -> String
greet = undefined
