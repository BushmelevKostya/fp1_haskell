module Test1 (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import Task1
import Task2
import Task3
import Task4
import Task5
import Task6

tests :: TestTree
tests = testGroup "Test1" [testTask1To6]

--141087744000 = 23514624000 * 6
expectedResult :: Integer
expectedResult = 141087744000 


testTask1To6 :: TestTree
testTask1To6 =
  testCase "Testing Task1 to Task6" $ do
    let result1 = return recursion
    let result2 = return tailRecursion
    let result3 = return mapResult reduce
    let result4 = return mapSequence
    let result5 = return listComprehensions
    let result6 = return infList
    let totalResult = result1 + result2 + result3 + result4 + result5 + result6
    totalResult @?= expectedResult
