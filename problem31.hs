numOptions :: [Integer] -> Integer -> Integer
numOptions [] x
  | x == 0    = 1
  | otherwise = 0
numOptions (coin:coins) x = sum $ map (numOptions coins . (x -)) [0, coin .. x]

main :: IO ()
main = putStrLn $ show $ numOptions [200, 100, 50, 20, 10, 5, 2, 1] 200
