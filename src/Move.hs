module Move ( percorre, Direcção(..) ) where

import Points

data Direcção = Norte | Sul | Este | Oeste
  deriving (Eq, Show, Read, Enum)

percorre :: FasterPoint -> [Direcção] -> FasterPoint
percorre = undefined

