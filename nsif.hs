{-# LANGUAGE FlexibleContexts #-}

--Nos Santos Izquierdo Field , PRIME GRIMOIRE SPELLS v0.1
-- Authors
--  Enrique Santos
--  Vicent Nos

module Main where

import System.Environment
import System.Exit
import System.Console.CmdArgs

import Data.List.Ordered
import Data.List.Split 
import Data.List (subsequences)

import Data.Numbers.Primes
import qualified Math.NumberTheory.Primes as P
import Math.NumberTheory.ArithmeticFunctions
import Math.NumberTheory.Powers.Modular
import Math.NumberTheory.Powers.Squares
import Math.NumberTheory.Powers
import Codec.Crypto.RSA.Pure



prim n = read ((splitOn " " $ show (P.nextPrime n)) !! 1)::Integer


primb n = read ((splitOn " " $ show (P.precPrime n)) !! 1)::Integer


ncr n b e t=  head $ filter (\(r,w)-> w/=1 && w/=r ) $ map (\x-> (n, (gcd n ((powMod x (n^2-x^2) n) - x ))) )  $ map (\x-> (x+3))  [0..t]-- [(e^b..e^b+t] 


loadprimes = do 
	a<- readFile "../../../safes25.txt"
	let b = splitOn "\n" a
	let c = init $ map (\x-> read x::Integer) b

	return c

primc n l = map (\x-> read ((splitOn " " $ show (P.nextPrime x)) !! 1)::Integer) [1..l]

{-
nsifc2 n base tries e
	| out /=1 && out /= n = (div n (fst out),(fst out),(snd out))
	| otherwise = (0,0,0)
	where
	mods = map (\x-> (powMod x 65537 n) ) $ nub $ sort $ map (primes !!) [1..1000]
	--(nearsquare) = 2^(logBase 2 n)
	out =  head $ filter (\(r,t)-> r/=1 && r/=2 ) $ map (\x-> ((gcd (n) (tryperiod ((n)) ((n)^e-x^e) x)),x)) $ reverse [base^e..base^e+tries] 
-}

-- exponent root
-- search for best base
-- search the best exponent

powRoot n = minimum $ intpowroot (n)

bestroot n = minimum $ nub $ sort $ filter (\(r,e,w)-> e/=n ) $  map (\x-> (n-((integerRoot x n))^x,(integerRoot x n),x) ) [1..1000]

powDiv n o
	| rest == 0 || rest == 1 || rest == 2 = (o++[(b,e)])
	| otherwise = powDiv rest (o++[(b,e)])
	where
	(rest,b,e) = bestroot n
		

intpowroot n =  filter (\(r,f,g)-> (f^g)<=n) $ concat $  map (\x-> map (\y-> (n-(x^y),x,y) ) [2..512]) [2..512]

-- loop "bit" squares
--
--
--

{--
nsifcrack n = 

	where
	-- search for better base
	-- if base is integer divide by 2
	-- else find the better base
	-- start to loop bits in x tries per loop
	
	out = head $ map (\x-> nsifc2 n (x) 10000 x) [1..13]
--}


bestpow n =  head $ filter (<n) $  map (\x-> map (\y-> (y^x) ) [1..1000]) [1..15]

supcar primespair o
	| lp == 1  = out
	| otherwise = supcar to out
	where
	lp = length primespair
	to = tail primespair
	out = lcm (o) (head primespair)

nsifc n tries
	| out2 /= 1 && out2 /= n = (div n out2,out2) 
	| out /=1 && out /= n = (div n out,out)
	| out3 /= 1 && out3 /= n = (div n out3,out3) 
	| out4 /=1 && out4 /= n = (div n out4,out4)
	| out5 /= 1 && out5 /= n = (div n out5,out5) 
	| out6 /=1 && out6 /= n = (div n out6,out6)
	| out7 /= 1 && out7 /= n = (div n out7,out7) 
	| out8 /=1 && out8 /= n = (div n out8,out8)

	| otherwise = (0,0)
	where
 	base = 2
		
	--(nearsquare) = 2^(logBase 2 n)
	primesc = nub $ sort $ map prim [1..n]	
	out =  head $ reverse ([1] ++ (filter (\r-> r/=1 && r/=2 ) $ map (\x-> gcd (n) (tryperiod ((n)) (x*(n + (n - x))) x)) $ reverse $ [2^base..2^base+tries]) )
	out2 = head $ reverse ([1]++ (filter (\x-> x/=1 && x/=2) $ map (\x-> gcd (n) (tryperiod ((n)) ((n)^2-(x)^2) x)) [2^base..2^base+tries]))

	out3 = head $ reverse ([1]++ (filter (\r-> r/=1 && r/=2 ) $ map (\x-> gcd (n) (tryperiod ((n)) ((n)^3+(x)^3) x)) [3^base..3^base+tries]))
	out4 = head $ reverse ([1]++ (filter (\x-> x/=1 && x/=2) $ map (\x-> gcd (n) (tryperiod ((n)) ((n)^3-(x)^3) x)) [3^base..3^base+tries] ))
	out5 =  head $ reverse ([1] ++ (filter (\r-> r/=1 && r/=2 ) $ map (\x-> gcd (n) (tryperiod ((n)) ((n)^5+(x)^5) x)) [5^base..5^base+tries]) )
	out6 = head $ reverse ([1]++ (filter (\x-> x/=1 && x/=2) $ map (\x-> gcd (n) (tryperiod ((n)) ((n)^5-(x)^5) x)) [5^base..5^base+tries]))
	out7 = head $ reverse ([1]++ (filter (\r-> r/=1 && r/=2 ) $ map (\x-> gcd (n) (tryperiod ((n)) ((n)^7+(x)^7) x)) [7^base..7^base+tries]))
	out8 = head $ reverse ([1]++ (filter (\x-> x/=1 && x/=2) $ map (\x-> gcd (n) (tryperiod ((n)) ((n)^7-(x)^7) x)) [7^base..7^base+tries] ))




sp s l = nub $ sort $  concat $ map (\x-> map (\y-> x*y) (map (\e-> prim (e*2) ) [(s)..(s)+l]) ) (map (\t-> prim (t*3)) [0,(s)..(s)+l])




ex = 1826379812379156297616109238798712634987623891298419


tryperiod n period m = (powMod (powMod (m) ex n) (modular_inverse ex period) n) - (m)

{--
-- | Cypher 'm', and tries to uncypher using 'period' as the subgroup order
tryperiod n period m = 
   m == powMod c xe n   -- uncypher c, and test if equal to original message
   where
   c  = powMod m ex n   -- cypher m
   -- 'xe' would be the privKey, inverse of 'ex', if 'period' was a subgroup order
   xe = modular_inverse ex period
--}   

primetosquare :: Integer -> [Integer]
{- | Search for squares 'o2' and check if subtracting (n - 1) is prime.  -}
primetosquare n = candidates ini (ini^2)
   where
   ini = integerSquareRoot (n - 1)
   candidates i i2
      -- | i > limit    = []
      | isPrime x = x : candidates o o2
      | otherwise = candidates o o2
      where 
      o  = i + 1
      o2 = i2 + i + o   -- o2 = (i + 1)^2 = i^2 + i + (i + 1)
      x  = o2 - n + 1   -- (n - 1 + x) must be a perfect square 


intPowBaseExp n= head $  map (\[h,j,k]-> [k,h]) $ filter (\[e,r,u]-> r=="0") $ map (\([a,b],c)-> [a,b,show c]) $ tail $  map (\x-> (splitOn "." $ show $ (logBase x n),x)) [2..3000]



nsif n tries
	| d /=1 && d /= n = (div n d,d,divcar)
	| otherwise = (0,0,0)
	where
 	base = 2 
		
	--(nearsquare) = 2^(logBase 2 n)
	primesc = nub $ sort $ map prim [1..n]	
	
	out2 = head $ reverse ([(1,1)]++ (filter (\(r,u)-> r/=1 ) $ map (\x-> (gcd (n) ((tryperiod ((n)) ((n)^2-(x)^2) x)  ),x)) [2^base..2^base+tries]))
	d = fst out2
	divcar = snd out2


--
--
main = do  
    args <- getArgs                  -- IO [String]
    progName <- getProgName          -- IO String
    print args
    let (n : st :  m : _) = args
    -- let n = args !! 0
    -- let st = args !! 1
    -- let e = args !! 2
    -- let m = args !! 3

    let (factorA,factorB) = nsifc (read n::Integer) (read m::Integer) 
    
    putStrLn "Public Key" 
    
    print $ (read n::Integer)

    putStrLn $ "Factors"

    print $ "P " ++ show factorB

    print $ "Q " ++ show factorA
    
    putStrLn $ "Prime grimoire spells  v0.1"
