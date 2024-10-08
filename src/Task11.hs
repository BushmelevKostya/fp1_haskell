module Task11 (listComprehensions2) where

import Utils (divisors, isAbundant)
import qualified Data.Set as Set

findAbundant :: [Int]
findAbundant = filter isAbundant [12..28123]

abundantSum :: [Int] -> Set.Set Int
abundantSum abundants = Set.fromList [x + y | x <- abundants, y <- abundants, x + y <= 28123]

listComprehensions2 :: Int
listComprehensions2 = 
    let abundants = findAbundant
        sumsOfAbundants = abundantSum abundants
    in sum [x | x <- [1..28123], not (Set.member x sumsOfAbundants)]

