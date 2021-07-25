{-# LANGUAGE DeriveDataTypeable #-}

module Main where
--Authors
--Enrique Santos
--Vicent Nos

import System.Environment (getArgs)

modular_inverse :: Integer {- ^e -} ->
                   Integer  {- ^phi -} ->
                   Integer
modular_inverse e phi = x `mod` phi
 where (_, x, _) = extended_euclidean e phi

-- Compute the extended euclidean algorithm
extended_euclidean :: Integer -> Integer -> (Integer, Integer, Integer)
extended_euclidean a b | d < 0     = (-d, -x, -y)
                       | otherwise = (d, x, y)
 where
  (d, x, y) = egcd a b

egcd :: Integer -> Integer -> (Integer, Integer, Integer)
egcd 0 b = (b, 0, 1)
egcd a b = let (g, y, x) = egcd (b `mod` a) a
           in (g, x - ((b `div` a) * y), y)


powMod :: (Integral a, Integral b) => a -> b -> a -> a
powMod x y m
  | m <= 0    = error "powModInt: non-positive modulo"
  | y <  0    = error "powModInt: negative exponent"
  | otherwise = f (x `rem` m) y 1 `mod` m
  where
    f _ 0 acc = acc
    f b e acc = f (b * b `rem` m) (e `quot` 2)
      (if odd e then (b * acc `rem` m) else acc)


main = do
	a <- getArgs 
	let n = a !! 0
	let l = a !! 1
	let d = a !! 2
	print $ nsif (read n::Integer) (read l::Integer) (read d::Integer)



ex2 = 1826379812379156297616109238798712634987623891298419
ex = 13
{- | For result 0 is the period , if period is NSI is common factor of N.  -}
tryperiod n period _ = (powMod 2 (ex * (modular_inverse ex period) - 1) n) - 1


{- | N is the pubkey, tries is the number of tries in the loop, until when try to sum 1, distance is the starting distance  -}
nsif n tries distance
	| d /=1 && d /= n = (div n d,d,divcar)
	| otherwise = (0,0,0)
	where
	out2 = reverse ((1,1): take 1 (dropWhile (\(r,u)-> r==1 && r /= n ) $ map (\x-> (gcd (n) ((tryperiod ((n)) ((n)^2-x^2) x)  ),x)) $ [distance..distance+tries]))
	d = fst $ head out2
	divcar = snd $ head out2


