module Task12 (infList2) where

import Utils (divisors, isAbundant)
import qualified Data.Set as Set

abundantNumbers :: [Int]
abundantNumbers = filter isAbundant [12..28123]

abundantSums :: Set.Set Int
abundantSums = Set.fromList [x + y | x <- abundantNumbers, y <- abundantNumbers, x + y <= 28123]

infList2 :: Int
infList2 = sum $ filter (`Set.notMember` abundantSums) (takeWhile (<= 28123) [1..])