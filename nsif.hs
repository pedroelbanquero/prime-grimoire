{-# LANGUAGE DeriveDataTypeable #-}

module Main where
--Authors
--Enrique Santos
--Vicent Nos
import Prelude hiding () 
import Math.NumberTheory.Powers.Modular (powMod)
import Codec.Crypto.RSA.Pure (modular_inverse)
--import System.Console.CmdArgs



{-
data Greeter = Greeter { cr :: [Char], ir :: [Char] , rr :: [Char]} deriving (Show, Data, Typeable)

options = Greeter { 
     cr = "" &= explicit &= name "n" &= help "a product of primes"
   , ir = "" &= explicit &= name "loops" &= help "the number of loops to try"
   , rr = "" &= explicit &= name "distance" &= help "Santos Nos Distance / starting point"

   } &= program "nsif"  &= summary "Blackhole Consulting - Power Modular factorization by base difference"
 


main = do
        op <- cmdArgs options
        print $ nsif(read (cr op)::Integer) (read (ir op)::Integer) (read (rr op)::Integer) 
-}

main = do 
	print $ nsif 377 100 3

ex = 1826379812379156297616109238798712634987623891298419

{- | For result 0 is the period , if period is NSI is common factor of N.  -}
tryperiod n period _ = (powMod 2 (ex * modular_inverse ex period - 1) n) - 1


{- | N is the pubkey, tries is the number of tries in the loop, until when try to sum 1, distance is the starting distance  -}
nsif n tries distance
	| d /=1 && d /= n = (div n d,d,divcar)
	| otherwise = (0,0,0)
	where
	out2 = reverse ((1,1): take 1 (dropWhile (\(r,u)-> r==1 && r /= n ) $ map (\x-> (gcd (n) ((tryperiod ((n)) ((n)^2-x^2) x)  ),x)) $ [distance..distance+tries]))
	d = fst $ head out2
	divcar = snd $ head out2


