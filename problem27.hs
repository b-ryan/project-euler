-- depends on https://github.com/sebfisch/primes
import Data.List (foldl1')
import Data.Numbers.Primes (isPrime)

consecutive a b = takeWhile isPrime [n^2 + a*n + b | n <- [0..]]

maxBy f x y
  | (f x) >= (f y) = x
  | otherwise      = y

as = [-999..999]
-- since n^2 + a*n + b == b when n is 0, b must be prime
bs = [x | x <- [1..1000], isPrime x]

main =
  putStrLn $
  show $
  -- snd $
  foldl1' (maxBy fst) [((length $ consecutive a b), (a, b)) | a <- as, b <- bs]
