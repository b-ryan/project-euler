import Data.List (sort)
pandigital x y = (sort $ (show x) ++ (show y) ++ (show $ x * y)) == "123456789"
one = [x * y | x <- [2..9], y <- [1000..9999], pandigital x y]
two = [x * y | x <- [10..99], y <- [100..999], pandigital x y]
main = putStrLn $ show $ sort $ one ++ two
