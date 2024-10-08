module Task3 (mapResult, reduce) where

import Utils (prod13)

reduce :: [Int] -> [[Int]]
reduce xs
    | length xs < 13 = []
    | otherwise = take 13 xs : reduce (tail xs)

mapResult :: [[Int]] -> Int
mapResult xs = maximum (map prod13 xs)