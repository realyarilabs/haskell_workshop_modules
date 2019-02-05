module Points where

-- -------------------------------------------------------------------------- --
-- Type Synonyms
-- -------------------------------------------------------------------------- --
type Point = (Float, Float)
type Vector = (Float, Float)

movePoint :: Float -> Vector -> Point -> Point
movePoint f (vx, vy) (p1, p2) = (f*vx+p1, f*vy+p2)

-- -------------------------------------------------------------------------- --
-- Algebraic Datatypes
-- -------------------------------------------------------------------------- --
data BetterPoint  = Pt Float Float
                    deriving (Eq, Read, Show)

data BetterVector = Vec Float Float
                    deriving (Eq, Read, Show)

moveBetterPoint :: Float -> BetterVector -> BetterPoint -> BetterPoint
moveBetterPoint f (Vec vx vy) (Pt x y) = Pt (f*vx+x) (f*vy+y)

-- -------------------------------------------------------------------------- --
-- Algebraic Datatypes (Record Syntax)
-- -------------------------------------------------------------------------- --
data RPoint  = RPoint {x::Float, y::Float}    -- |  x :: RPoint -> Float
               deriving (Eq, Read, Show)      -- |  y :: RPoint -> Float

data RVector = RVector {vx::Float, vy::Float} -- | vx :: RVector -> Float
               deriving (Eq, Read, Show)      -- | vy :: RVector -> Float

moveRPoint :: Float -> RVector -> RPoint -> RPoint
moveRPoint f v p = RPoint (f*vx(v)+x(p)) (f*vy(v)+y(p))


-- -------------------------------------------------------------------------- --
-- Renamed Datatypes
-- -------------------------------------------------------------------------- --

newtype FasterPoint  = FPoint (Float, Float)
                    deriving (Eq, Read, Show)

newtype FasterVector = FVector (Float, Float)
                    deriving (Eq, Read, Show)

moveFasterPoint :: Float -> FasterVector -> FasterPoint -> FasterPoint
moveFasterPoint f (FVector (vx, vy)) (FPoint (x, y)) = FPoint (f*vx+x, f*vy+y)
