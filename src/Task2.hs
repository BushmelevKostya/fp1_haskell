module Task2 (tailRecursion) where

import Utils (prod13)

tailRecursion :: [Int] -> Int
tailRecursion xs = checkHelper xs 0

checkHelper :: [Int] -> Int -> Int
checkHelper xs k
    | length xs < 13 = k
    | otherwise = checkHelper (tail xs) (max k (prod13 (take 13 xs)))