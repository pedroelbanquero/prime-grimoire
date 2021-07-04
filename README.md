## Factorization by modular exponential base difference

# RSA POISONING ATTACK - Prime grimorie vol 3

A final description of NSIF field, code, and demo

The NSI Field is the distance to the N^E who cross with carmichael multiples, composed by divisors and multiples of carmichael N, in rsa function returns a common factor number, or common factors with carmichael of N . Allowing us to factorize .

Carmichael = lcm (p1-1) (p2-1) 

The camichael expansion of N allways cross N distance of a prime squares, allowing us to calculate derivated composite numbers with factors of N or his carmichael.

Carmciahel of N^2-N ever is composed by original carmichael factors + N factors .

field = carmichael divisors or modular inverses, or sum of distances to a near square from PQ, or the rest of the distance to a near square  of PQ


powMod field (modular_inverse 1928379187239812173 (N^2-field^2)) N) - field = probable factor of N or decrypt (==0)

minimum distance to a power of Q,P = DPQ, DPP

## DPQ = X^E - Q

## DPP = X^E - P

*x^e is the nearest power to P or Q

## NSI FIELD = DPP(+-)DPQ(+-)1

## FACTOR N = gcd N ( powMod NSI (modular_inverse E (N^2-(NSI)^2)) N) - (NSI) )


![image](https://user-images.githubusercontent.com/60758685/124370792-9faf1000-dc40-11eb-97a2-840a9c7d0f4c.png)




```Haskell

*Main> gcd (377) $ (powMod 40 (modular_inverse 65537 (377^2-40^2)) 377) - 40

13


*Main> gcd (377) $ (powMod 5 (modular_inverse 65537 (377^2-5^2)) 377) - 5

13



```

Implementation in RsaCTFTool

https://github.com/Ganapati/RsaCtfTool/pull/266


The attack is similar to a quadratic sieve, but x^2-y^2 now we have the X who is N, and Y are the distances^2 untile a comon factor number, who are the carmichael divisors.


# SIMPLE ALGORITHM FOR N BITS


```Haskell

tryperiod n period m = (powMod (powMod (m) ex n) (modular_inverse ex period) n) - (m)

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
