module Task7 (recursion2) where

import Utils (divisors, isAbundant)
import qualified Data.Set as Set

moduleSumRec :: Int -> Int
moduleSumRec limit = go 1 [] Set.empty
  where
    go :: Int -> [Int] -> Set.Set Int -> Int
    go n abundants sums
      | n > limit = 0
      | isAbundant n = 
          let newAbundants = n : abundants
              newSums = Set.union sums (Set.fromList [n + a | a <- newAbundants, n + a <= limit])
          in if Set.member n newSums
               then go (n + 1) newAbundants newSums
               else n + go (n + 1) newAbundants newSums 
      | otherwise =
          if Set.member n sums
             then go (n + 1) abundants sums
             else n + go (n + 1) abundants sums

recursion2 :: Int
recursion2 = moduleSumRec 28123
