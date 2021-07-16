## Factorization by modular exponential base difference

# RSA POISONING ATTACK - Prime grimorie vol 3

A final description of NSIF field, code, and demo

The NSI Field is the distance to the N^E who cross with carmichael multiples, composed by divisors and multiples of carmichael N, in rsa function returns a common factor number, or common factors with carmichael of N . Allowing us to factorize .

Carmichael = lcm (p1-1) (p2-1) 

field = carmichael divisors or modular inverses, or sum of distances to a near square from PQ, or the rest of the distance to a near square  of PQ

powMod field (modular_inverse 1928379187239812173 (N^2-field^2)) N) - field = factor of N or decrypt (==0)

minimum distance to a power of Q,P = DPQ, DPP

## DPQ = X^E - Q

## DPP = X^E - P

*x^e is the nearest power to P or Q

## NSI FIELD = DPP(+-)DPQ(+-)1

## FACTOR N = tryperiod n period _ = (powMod 2 (ex * modular_inverse ex period - 1) n) - 1

![image](https://user-images.githubusercontent.com/60758685/124370792-9faf1000-dc40-11eb-97a2-840a9c7d0f4c.png)




```Haskell

*Main> gcd (377) $ (powMod 40 (modular_inverse 65537 (377^2-40^2)) 377) - 40

13


*Main> gcd (377) $ (powMod 5 (modular_inverse 65537 (377^2-5^2)) 377) - 5

13



```

Implementation in RsaCTFTool

https://github.com/Ganapati/RsaCtfTool/pull/266


# SIMPLE ALGORITHM FOR N BITS


```Haskell


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



```

## Usage

```Haskell

-- N, loops, distance

./nsif 377 0 3

(29,13,3)



OR

ghci nsif.hs

*Main> nsif 257585468675898878692697829828877177271726674504483915376269783623698607231869350800480020861461078316108953783989889820659511261545507627 1000000 0

(4567759074507740406477787437675267212178680251724974985372646979034083,56392087339601733413306017749077372989860250021295987473736382457369,12725)

(22.48 secs, 13,534,650,280 bytes)



```

# DONATIONS BTC

12phYWJ5WiGW488ETj4PA8zjF7pCdC5ZWD



# LICENSE

100 % Pure dark math of Mas de Pascualet

Institutional investigation of this paper is forbidden

All commercial rights of this document or derivates, are reserved .

Blackhole Consulting 

## Authors

Enrique Santos

Vicent Nos Ripolles

Mas de pascualet, computation center


## Collaborator
Francisco Blas Izquierdo
Phd Student , Chalmers Institute
