module Task1 (recursion) where

import Utils (prod13)

recursion :: [Int] -> Int
recursion xs
    | length xs < 13 = 0
    | otherwise = max (prod13 (take 13 xs)) (recursion (tail xs))