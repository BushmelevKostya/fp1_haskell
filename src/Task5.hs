module Task5 (listComprehensions) where

import Utils (prod13)

listComprehensions :: [Int] -> Int
listComprehensions xs = maximum [prod13 (take 13 (drop i xs)) | i <- [0..(length xs - 13)]]