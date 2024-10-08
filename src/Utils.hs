module Utils (readNumber, prod13, divisors, isAbundant) where

import Data.List (nub)

readNumber :: IO [Int]
readNumber = do
    number <- readFile "./resources/number.txt"
    let digits = map (read . (:[])) number :: [Int]
    return digits

prod13 :: [Int] -> Int
prod13 = foldl (*) 1

divisors :: Int -> [Int]
divisors n = nub $ concat [[x, div n x] | x <- [2..isqrt n], n `mod` x == 0]
    where
        isqrt :: Int -> Int
        isqrt = floor . sqrt . fromIntegral

isAbundant :: Int -> Bool
isAbundant n = sum (divisors n) > n