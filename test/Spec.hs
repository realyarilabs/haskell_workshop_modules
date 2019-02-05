import Data.List

import Test.Tasty
import Test.Tasty.QuickCheck as QC
import Test.Tasty.HUnit

import Move (Direcção(..), percorre)
import Points (FasterPoint(..))

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Problems" 
    [ problem1Spec ]

problem1Spec :: TestTree
problem1Spec = 
     testGroup "Problem #1" 
     [ testGroup "(checked by HUnit)"
        [ testCase "Given the origin and a single Norte it should return (0, 1)" $
          (percorre (FPoint (0, 0)) [Norte]) @?= FPoint (0, 1),

        testCase "Given the origin and a single Sul it should return (0, -1)" $
          (percorre (FPoint (0, 0)) [Sul]) @?= FPoint (0, -1),

        testCase "Given the origin and a single Este it should return (1, 0)" $
          (percorre (FPoint (0, 0)) [Este]) @?= FPoint (1, 0),

        testCase "Given the origin and a single Oeste it should return (-1, 0)" $
          (percorre (FPoint (0, 0)) [Oeste]) @?= FPoint (-1, 0)
        ],


      testGroup "(checked by QuickCheck)"
        [ QC.testProperty "From origin N Norths means (0, N)" prop_Norths
        , QC.testProperty "From origin N Souths means (0, -N)" prop_Souths
        , QC.testProperty "From origin N Easts means (N, 0)" prop_Easts
        , QC.testProperty "From origin N Wests means (-N, 0)" prop_Wests
        , QC.testProperty "From origin any path that is a circle will return to the origin" prop_Circle
        , QC.testProperty "From anywhere any path that contains the same amount of moves in all directions will return to the same place" prop_AllPathsEqualMoves
        ]
     ]
       where origin = FPoint (0, 0)

             prop_Norths :: Positive Int -> Bool
             prop_Norths (Positive n) =
               percorre origin (replicate n Norte) == FPoint (0, fromIntegral n)

             prop_Souths :: Positive Int -> Bool
             prop_Souths (Positive n) =
               percorre origin (replicate n Sul) == FPoint (0, fromIntegral (-n))

             prop_Easts :: Positive Int -> Bool
             prop_Easts (Positive n) =
               percorre origin (replicate n Este) == FPoint (fromIntegral n, 0)

             prop_Wests :: Positive Int -> Bool
             prop_Wests (Positive n) =
               percorre origin (replicate n Oeste) == FPoint (fromIntegral (-n), 0)

             prop_Circle :: Positive Int -> Bool
             prop_Circle (Positive n) =
               let circle = concat (map (replicate n) [Norte ..])
                in 
               percorre origin circle == origin


             prop_AllPathsEqualMoves :: Int -> Int -> Positive Int -> Bool
             prop_AllPathsEqualMoves x y (Positive n) =
               let start = FPoint (fromIntegral x, fromIntegral y)
                   allPaths = permutations (concat (map (replicate n) [Norte ..]))
                in
               all (\path -> percorre start path == start) allPaths
