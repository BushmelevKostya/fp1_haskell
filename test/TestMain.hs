module TestMain where

import Test.HUnit
import Test.QuickCheck
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

testTask1 :: Test
testTask1 = TestCase (do
    number <- readNumber
    assertEqual "Test recursion" expectedOutput1 (recursion number))

expectedOutput1 :: Int
expectedOutput1 = 23514624000


testTask2 :: Test
testTask2 = TestCase (do
    number <- readNumber
    assertEqual "Test recursion2" expectedOutput2 recursion2)

expectedOutput2 :: Int
expectedOutput2 = 4179871

propTask1 :: [Int] -> Bool
propTask1 xs = recursion xs == tailRecursion xs == mapResult . reduce $ xs == mapSequence xs == listComprehensions xs == infList xs

propTask2 :: [Int] -> Bool
propTask2 xs = recursio2 xs == tailRecursion2 xs == moduleSum xs == mapSequence2 xs == listComprehensions2 xs == infList2 xs

tests :: Test
tests = TestList [testTask1, testTask2, TestLabel "QuickCheck Test1" (TestProperty propTask1), TestLabel "QuickCheck Test2" (TestProperty propTask2)]

main :: IO ()
main = do
    _ <- runTestTT tests 
    quickCheck prop_recursion
    return ()
