{-# LANGUAGE FlexibleContexts #-}

--Nos Santos Izquierdo Field , PRIME GRIMOIRE SPELLS v0.0.0.2
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





ex2 = 1826379812379156297616109238798712634987623891298419

ex = 13 

tryperiod n period _ = (powMod 2 (ex * modular_inverse ex period - 1) n) - 1

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




nsif n tries distance
	| d /=1 && d /= n = (div n d,d,divcar)
	| otherwise = (0,0,0)
	where
	out2 = reverse ((1,1): take 1 (dropWhile (\(r,u)-> r==1 && r /= n ) $ map (\x-> (gcd (n) ((tryperiod ((n)) ((n)^2-x^2) x)  ),x)) $ [distance..distance+tries]))
	d = fst $ head out2
	divcar = snd $ head out2

