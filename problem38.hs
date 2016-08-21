import Data.List (dropWhile, splitAt)

factorial n
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)
factorials = [factorial n | n <- [0..9]]

move from to lst
  | from >= to = error "must move earlier element to later in list"
  | otherwise  = heads2 ++ tails2 ++ [move] ++ tails
                 where (heads, tails) = splitAt (to + 1) lst
                       (heads2, move:tails2) = splitAt from heads

maxp n = head [p | p <- [9,8..1], n >= factorials !! p]

nthPerm 0 nums = nums
nthPerm n nums = nthPerm rem (move (p - mag) p nums)
                 where p    = maxp n
                       pfac = factorials !! p
                       mag  = quot n pfac
                       rem  = mod n pfac

toNum [x] = x
toNum (x:xs) = x + 10 * (toNum xs)

perms = [toNum $ nthPerm n [1..9] | n <- [0..]]

takeDigits take drop n = mod (quot n (10^drop)) (10^take)

concatSum :: Int -> Int -> String -> Int
concatSum x n sumStr
  | length sumStr >= 9 = read sumStr :: Int
  | otherwise          = concatSum x (n + 1) (sumStr ++ show (x * n))

works ndigits n = concatSum base 1 "" == n
  where base = takeDigits ndigits (9 - ndigits) n

anyWorks x = any ((==) True) [works n x | n <- [2..4]]

main = putStrLn $ show $ head $ dropWhile (not . anyWorks) perms
