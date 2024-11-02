# fp-haskell-1
Лабораторная работа #1 по дисциплине "Функциональное программирование". Задачи с проекта Эйлер.

Работу выполнил: Бушмелев Константин Алексеевич,  
Студент группы P3318.

Преподаватель: Пенской Александр Владимирович.

---

## Список задач:

Problem № 8\. [Largest Product in a Series](https://projecteuler.net/problem=8)

Problem № 23\. [Non-Abundant Sums](https://projecteuler.net/problem=23)

## Решения

###Problem № 8

```Haskell
recursion :: [Int] -> Int
recursion xs
    | length xs < 13 = 0
    | otherwise = max (prod13 (take 13 xs)) (recursion (tail xs))

tailRecursion :: [Int] -> Int
tailRecursion xs = checkHelper xs 0

checkHelper :: [Int] -> Int -> Int
checkHelper xs k
    | length xs < 13 = k
    | otherwise = checkHelper (tail xs) (max k (prod13 (take 13 xs)))

reduce :: [Int] -> [[Int]]
reduce xs
    | length xs < 13 = []
    | otherwise = take 13 xs : reduce (tail xs)

mapResult :: [[Int]] -> Int
mapResult xs = maximum (map prod13 xs)

mapSequence :: [Int] -> Int
mapSequence = maximum . map prod13 . reduce

listComprehensions :: [Int] -> Int
listComprehensions xs = maximum [prod13 (take 13 (drop i xs)) | i <- [0..(length xs - 13)]]

generateInfList :: [Int] -> [[Int]]
generateInfList xs = [take 13 (drop i xs) | i <- [0..]] 

infList :: [Int] -> Int
infList xs = maximum . map prod13 . takeWhile(\ys -> length ys == 13) $ generateInfList xs
```

###Problem № 23

```Haskell
moduleSumRec :: Int -> Int
moduleSumRec limit = go 1 [] Set.empty
  where
    go :: Int -> [Int] -> Set.Set Int -> Int
    go n abundants sums
      | n > limit = 0
      | isAbundant n = 
          let newAbundants = n : abundants
              newSums = Set.union sums (Set.fromList [n + a | a <- newAbundants, n + a <= limit])
          in if Set.member n newSums
               then go (n + 1) newAbundants newSums
               else n + go (n + 1) newAbundants newSums 
      | otherwise =
          if Set.member n sums
             then go (n + 1) abundants sums
             else n + go (n + 1) abundants sums

recursion2 :: Int
recursion2 = moduleSumRec 28123

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

generateSequence :: Int -> [Int]
generateSequence limit = [1..limit]

filterNonAbundantSums :: Int -> Set.Set Int -> [Int]
filterNonAbundantSums limit sumsOfAbundants = filter (`Set.notMember` sumsOfAbundants) (generateSequence limit)

sumNumbers :: [Int] -> Int
sumNumbers = sum

findAbundant :: [Int]
findAbundant = filter isAbundant [12..28123]

abundantSum :: [Int] -> Set.Set Int
abundantSum abundants = Set.fromList [x + y | x <- abundants, y <- abundants, x + y <= 28123]

moduleSum :: Int
moduleSum = sumNumbers (filterNonAbundantSums limit (abundantSum findAbundant))
    where
        limit = 28123

mapSequence2 :: Int
mapSequence2 = sum . filter (not . (`Set.member` abundantSum findAbundant)) $ [1..28123]

listComprehensions2 :: Int
listComprehensions2 = 
    let abundants = findAbundant
        sumsOfAbundants = abundantSum abundants
    in sum [x | x <- [1..28123], not (Set.member x sumsOfAbundants)]


infList2 :: Int
infList2 = sum $ filter (`Set.notMember` abundantSums) (takeWhile (<= 28123) [1..])
```

## Решение на языке C

```C
int prod13(int arr[13]) {
    int product = 1;
    for (int i = 0; i < 13; i++) {
        product *= arr[i];
    }
    return product;
}

int recursion(int *xs, int size) {
    if (size < 13) {
        return 0;
    } else {
        int max_prod = prod13(xs);
        int next_prod = recursion(xs + 1, size - 1);
        return (max_prod > next_prod) ? max_prod : next_prod;
    }
}
```

## Выводы

Я познакомился с основами Haskell - Рекурсией, pattern matching, folding lists. Ознакомился с основами лексики языка, объявлениями функций, Типами данных, порядком исполнения. Так же познакомился с системой сборки Stack.
