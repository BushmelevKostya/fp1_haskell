-- Spec.hs
import qualified Test2
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "All tests"
    [
      Test2.tests
    ]
