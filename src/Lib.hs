module Lib (someFunc) where

import qualified Greet.English
import qualified Greet.Portuguese
import qualified Greet.French

import InteractLine (interactLine)

import BitcoinCheck (validate)

someFunc :: IO ()
someFunc = interactLine greet

greet :: String -> String
greet "en" = Greet.English.greet 
greet "fr" = Greet.French.greet
greet "pt" = Greet.Portuguese.greet
greet bitcoinAddress = validate bitcoinAddress
