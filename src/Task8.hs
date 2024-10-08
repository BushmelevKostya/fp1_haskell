module Task8 (tailRecursion2) where

import Utils (divisors, isAbundant)
import qualified Data.Set as Set

moduleSumRec :: Int -> Int
moduleSumRec limit = go 1 [] Set.empty 0
  where
    go n abundants sums acc
      | n > limit = acc
      | isAbundant n = 
          let newAbundants = n : abundants
              newSums = Set.union sums (Set.fromList [n + a | a <- newAbundants, n + a <= limit])
          in if Set.member n newSums
               then go (n + 1) newAbundants newSums acc
               else go (n + 1) newAbundants newSums (acc + n) 
      | otherwise =
          if Set.member n sums
             then go (n + 1) abundants sums acc
             else go (n + 1) abundants sums (acc + n)

tailRecursion2 :: Int
tailRecursion2 = moduleSumRec 28123
