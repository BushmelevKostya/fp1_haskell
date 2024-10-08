module Task6 (infList) where

import Utils (prod13)

generateInfList :: [Int] -> [[Int]]
generateInfList xs = [take 13 (drop i xs) | i <- [0..]] 

infList :: [Int] -> Int
infList xs = maximum . map prod13 . takeWhile(\ys -> length ys == 13) $ generateInfList xs