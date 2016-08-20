import Data.List (reverse, sum)

floorRt :: Int -> Int
floorRt x = floor $ sqrt $ fromIntegral x

divisors :: Int -> [Int]
divisors x = leftDivisors ++ [quot x z | z <- reverse leftDivisors]
  where leftDivisors = [y | y <- [1 .. floorRt x], mod x y == 0]

isAbundant :: Int -> Bool
isAbundant x = (sum $ init $ divisors x) > x

allAbundant :: [Int]
allAbundant = [x | x <- [12 .. 28123], isAbundant x]

sumOfAbundants = [False | x <- [1 .. 28123 * 2]]

allSums :: [Int]
allSums = [x + y | x <- allAbundant, y <- allAbundant]



-- main = putStrLn $ show $ [x | x <- [1 .. 25], notSumOfAbundants x]
main = do
  putStrLn $ show $ take 5 allAbundant
  putStrLn $ show $ divisors 16
