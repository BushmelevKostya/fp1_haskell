-- Test2.hs
module Test2 (tests) where

import Test.Tasty
import Test.Tasty.HUnit
import Task7
import Task8
import Task9
import Task10
import Task11
import Task12

tests :: TestTree
tests = testGroup "Test2" [testTask7To12]

-- 25079226 = 4179871 * 6
expectedResult :: Integer
expectedResult = 25079226

testTask7To12 :: TestTree
testTask7To12 =
  testCase "Testing Task7 to Task12" $ do
    let result7 = return recursion2
    let result8 = return tailRecursion2
    let result9 = return moduleSum
    let result10 = return mapSequence2
    let result11 = return listComprehensions2
    let result12 = return infList2
    let totalResult = result7 + result8 + result9 + result10 + result11 + result12
    totalResult @?= expectedResult
