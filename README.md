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


![image](https://user-images.githubusercontent.com/60758685/122687991-2eeb0b00-d1df-11eb-8a3d-c5577c16928f.png)


![image](https://user-images.githubusercontent.com/60758685/123015670-811e5e80-d38e-11eb-9aed-78828128a94c.png)



```Haskell

*Main> nsifc 
1078615880917389544637583114473414840170786187365383943640580486946396054833005778796250863934445216126720683279228360145952738612886499734957084583836860500440925043100784911137186209476676352971557693774728859797725277166790113706541220865545309534507638851540886910549436636443182335048699197515327493691587 513 158

(40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168351)



```

![image](https://user-images.githubusercontent.com/60758685/122001914-a996cf00-cd76-11eb-8e0a-02b8f9be0990.png)


same with 2048

![image](https://user-images.githubusercontent.com/60758685/122141520-211a3c00-ce13-11eb-9ba5-322caf6a0d3b.png)


eliptic curve vs nsif method

![image](https://user-images.githubusercontent.com/60758685/122146588-fa610300-ce1c-11eb-9896-65cdf15761cc.png)

imposible factorize with ecm the big numbers


when works ?

![image](https://user-images.githubusercontent.com/60758685/122174753-96543400-ce48-11eb-8e3a-4421f2eac008.png)

Works when a carmichael divisors or modular inverse are found.

long distances from squares

![image](https://user-images.githubusercontent.com/60758685/122319581-65c2d780-cee6-11eb-9a7e-632bb804ba44.png)


other geometric fields

![image](https://user-images.githubusercontent.com/60758685/122329378-f0abce00-cef6-11eb-8c36-30eb73e96c49.png)



# The RSA NSIF Attack

![image](https://user-images.githubusercontent.com/60758685/121837222-acbc8d00-cc9a-11eb-858f-78f9ccd2fed2.png)

40 , 14 , 56 , 28 and 5 are divisors of carmichaels of N or have common divisors with carmichael , 5 , 89, 257 are modular inverses of divisors of carmichael / totient / decimal expansion length

we can extract the factors by this way with GCD function.

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
