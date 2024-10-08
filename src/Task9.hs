module Task9 (moduleSum) where

import Utils (divisors, isAbundant)
import qualified Data.Set as Set

generateSequence :: Int -> [Int]
generateSequence limit = [1..limit]

filterNonAbundantSums :: Int -> Set.Set Int -> [Int]
filterNonAbundantSums limit sumsOfAbundants = filter (`Set.notMember` sumsOfAbundants) (generateSequence limit)

sumNumbers :: [Int] -> Int
sumNumbers = foldr (+) 0

findAbundant :: [Int]
findAbundant = filter isAbundant [12..28123]

abundantSum :: [Int] -> Set.Set Int
abundantSum abundants = Set.fromList [x + y | x <- abundants, y <- abundants, x + y <= 28123]

moduleSum :: Int
moduleSum = sumNumbers (filterNonAbundantSums limit (abundantSum findAbundant))
    where
        limit = 28123