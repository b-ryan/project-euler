import Data.Bits ((.|.), shift)

-- https://projecteuler.net/quote_post=2948-OgoLTCad6JtUanv5
panhelper :: Int -> Int -> Int
panhelper n result
  | n <= 0     = result
  | digit == 0 = 0
  | otherwise  = panhelper (quot n 10) ((.|.) result (shift 1 (digit - 1)))
  where digit = mod n 10

pandigital n = panhelper n 0 == 0x1ff
