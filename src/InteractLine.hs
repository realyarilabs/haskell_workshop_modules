module InteractLine (interactLine) where

interactLine :: (String -> String) -> IO ()
interactLine f = interact (unlines . (map f) . lines)
