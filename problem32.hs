import Data.List (nub, sort)
pandigital x y =  (== "123456789") . sort $ (show x) ++ (show y) ++ (show $ x * y)
one = [x * y | x <- [2..9], y <- [1000..9999], pandigital x y]
two = [x * y | x <- [10..99], y <- [100..999], pandigital x y]
main = putStrLn $ show $ sum $ nub $ one ++ two
