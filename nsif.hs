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

{- | For result 0 is the period , if period is NSI is common factor of N.  -}
tryperiod n period _ = (powMod 2 (ex * modular_inverse ex period - 1) n) - 1


{- | N is the pubkey  -}
nsif n tries distance
	| d /=1 && d /= n = (div n d,d,divcar)
	| otherwise = (0,0,0)
	where
	out2 = reverse ((1,1): take 1 (dropWhile (\(r,u)-> r==1 && r /= n ) $ map (\x-> (gcd (n) ((tryperiod ((n)) ((n)^2-x^2) x)  ),x)) $ [distance..distance+tries]))
	d = fst $ head out2
	divcar = snd $ head out2

