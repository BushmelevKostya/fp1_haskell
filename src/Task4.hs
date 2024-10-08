module Task4 (mapSequence) where

import Task3 (reduce)
import Utils (prod13)

mapSequence :: [Int] -> Int
mapSequence xs = maximum . map prod13 . reduce $ xs