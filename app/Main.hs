module Main where

import Task1 (recursion)
import Task2 (tailRecursion)
import Task3 (mapResult, reduce)
import Task4 (mapSequence)
import Task5 (listComprehensions)
import Task6 (infList)
import Task7 (recursion2)
import Task8 (tailRecursion2)
import Task9 (moduleSum)
import Task10 (mapSequence2)
import Task11 (listComprehensions2)
import Task12 (infList2)
import Utils (readNumber)

main :: IO()
main = do
    --8 task
    digits <- readNumber
    putStrLn "Task's 1 recursion result is:"
    print $ recursion digits
    putStrLn "Task's 2 tailRecursion result is:"
    print $ tailRecursion digits
    putStrLn "Task's 3 mapResult result is:"
    print $ mapResult . reduce $ digits
    putStrLn "Task's 4 mapSequence result is:"
    print $ mapSequence digits
    putStrLn "Task's 5 listComprehensions result is:"
    print $ listComprehensions digits
    putStrLn "Task's 6 infList result is:"
    print $ infList digits

    putStrLn ""

    --23 task
    putStrLn "Task's 7 recursion result is:"
    print recursion2
    putStrLn "Task's 8 tailRecursion result is:"
    print tailRecursion2
    putStrLn "Task's 9 mapResult result is:"
    print moduleSum
    putStrLn "Task's 10 mapSequence result is:"
    print mapSequence2
    putStrLn "Task's 11 listComprehensions result is:"
    print listComprehensions2
    putStrLn "Task's 12 infList result is:"
    print infList2