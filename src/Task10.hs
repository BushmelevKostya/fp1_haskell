module Task10 (mapSequence2) where

import Utils (divisors, isAbundant)
import qualified Data.Set as Set

findAbundant :: [Int]
findAbundant = filter isAbundant [12..28123]

abundantSum :: [Int] -> Set.Set Int
abundantSum abundants = Set.fromList [x + y | x <- abundants, y <- abundants, x + y <= 28123]

mapSequence2 :: Int
mapSequence2 = sum . filter (not . (`Set.member` abundantSum findAbundant)) $ [1..28123]