## Factorization by power P-Q differences

# RSA POISONING ATTACK - Prime grimorie vol 3

A final description of NSIF group, code, and demo

The NSI group is the smallest distance among n^2 and multiple of p or q -1 , or p-q, or p , or q multiple to the nearest power.


## NSI = n^2 - $ minimum ( mod (n^2) (p-q) , mod (n^2) ((p-1) or (q-1)) )

## FACTOR N = gcd N $ (powMod 2 (ex * modular_inverse ex (NSI) - 1) n) - 1

## Conjecture 

If n is product of 2 primes :


## mod (n^2) (p-q) < (p-q) , easy factorize from distance than find a factor 

## mod ((p*q)^2) (p-q) = 1 or prime or square 

## 4PQ = (P+Q)^2-(P-Q)^2

## gcd (pq) (mod ((p+q)^3-(p-q)^3) (pq) ) = factor

## FACTOR N = gcd N $ (powMod 2 (ex * modular_inverse ex (p-q || p+q multiples ) - 1) n) - 1

## sigma(n)^2 = 4n + x^2

## n^2-1 = x6 + y6 + (x6 * y6) 

## n^2 / 6 = (y + 1) * x6


![image](https://user-images.githubusercontent.com/60758685/183696769-c087195a-cfd3-465a-9ef7-3dfb51f05217.png)

![image](https://user-images.githubusercontent.com/60758685/183696846-598ffa20-07ba-4f2e-a8ab-a9307ddf6721.png)




# Implementation in RsaCTFTool

https://github.com/Ganapati/RsaCtfTool/pull/266

The tool allow you to compare the result of Power Modular Factorization / Rsa Poisoning versus other factorization methods .


# SIMPLE ALGORITHM FOR N BITS (Haskell)


```Haskell


ex = 1826379812379156297616109238798712634987623891298419

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



```


## Usage

```Haskell

-- N, loops, distance

./nsif 377 0 3

(29,13,3)


```




# LICENSE

100 % Pure dark math of Mas de Pascualet

Institutional investigation of this paper is forbidden

All commercial rights of this document or derivates, are reserved .

Blackhole Consulting 

## Authors

Enrique Santos (Intellectual author)
 
Vicent Nos Ripolles (Hacker)

Francisco Blas Izquierdo (Hacker)
Phd Student , Chalmers Institute


Maestrazgo , computation center



