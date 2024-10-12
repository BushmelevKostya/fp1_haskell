module Task4 (mapSequence) where

import Task3 (reduce)
import Utils (prod13)

mapSequence :: [Int] -> Int
mapSequence = maximum . map prod13 . reduce
