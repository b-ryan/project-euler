findRepeatingPattern' :: Int -> Int -> [Int] -> String -> String
findRepeatingPattern' num den visited pattern
  | elem num visited = pattern
  | num < den        = findRepeatingPattern' (num * 10) den (num:visited) pattern
  | otherwise        = findRepeatingPattern' ((num `mod` den) * 10)
                                             den
                                             (num:visited)
                                             (pattern ++ (show $ quot num den))

findRepeatingPattern x = findRepeatingPattern' 1 x [] ""

findMaxPattern [x] = findRepeatingPattern x
findMaxPattern (x:xs)
  | length pattern > length tailMax = pattern
  | otherwise                       = tailMax
  where pattern = findRepeatingPattern x
        tailMax = findMaxPattern xs

main = putStrLn $ show $ length $ findMaxPattern [1 .. 1000]
