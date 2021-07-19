## Factorization by modular exponential base difference

# RSA POISONING ATTACK - Prime grimorie vol 3

A final description of NSIF field, code, and demo

The NSI Field is the distance to the N^E who can be divided by carmichael of N, composed by divisors and multiples of carmichael N, in rsa function returns a common factor number, or common factors with carmichael of N . Allowing us to factorize .

Carmichael = lcm (p1-1) (p2-1) 

field = carmichael divisors or modular inverses, or sum of distances to a near power from PQ, or the rest of the distance to a near power  of PQ

powMod field (modular_inverse 1928379187239812173 (N^2-field^2)) N) - field = factor of N or decrypt (==0)

minimum distance to a power of Q,P = DPQ, DPP

## DPQ = X^E - Q

## DPP = X^E - P

*x^e is the nearest power to P or Q

## NSI FIELD = DPP(+-)DPQ(+-)1

## FACTOR N = gcd N $ (powMod 2 (ex * modular_inverse ex period - 1) n) - 1

![image](https://user-images.githubusercontent.com/60758685/124370792-9faf1000-dc40-11eb-97a2-840a9c7d0f4c.png)




```Haskell

*Main> gcd (377) $ (powMod 40 (modular_inverse 65537 (377^2-40^2)) 377) - 40

13


*Main> gcd (377) $ (powMod 5 (modular_inverse 65537 (377^2-5^2)) 377) - 5

13



```

x^d - x for x ∈ [1,n]

where you choose d such that 65537d is congruent to 1 modulo n. In your example (when n = 377) you get d = 309. This works well for you because 309 ≡ 1 (mod (p-1)) with p = 29. Note that in the same way as my example we just then get that

x^d - x ≡ x^1 - x ≡ 0 mod p

by Fermat's little thm. So whenever you take an element x which has an order in the multiplicative group modulo q that does not divide d-1 = 308. For example, when x = 2 you get that the multiplicative order of x mod q is 12 (and 12 does not divide 308) while the order of x mod p is 28 which does divide 308 (obviously, since all orders must divide p-1).

So you get a factor of 377 exactly when x is such that the order of x mod q does not divide d-1=308. Note that the orders or the elements of the multiplicative group modulo q, when q is 13 are (here written as (representative, order) pairs):

(1,1), (2,12), (3,3), (4,6), (5,4), (6,12), (7,12), (8,4), (9,3), (10,6), (11,12), (12,2) 


# Implementation in RsaCTFTool

https://github.com/Ganapati/RsaCtfTool/pull/266

The tool allow you to compare the result of Power Modular Factorization / Rsa Poisoning versus other factorization methods .


# SIMPLE ALGORITHM FOR N BITS (Haskell)


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
# C++ (Fastest)
* made by banachtarskiveli in reddit challenge

```c

void factor(mpz_t r, const mpz_t n, const int base, const size_t limit) {
        size_t logn = mpz_sizeinbase(n, base);
        mpz_t fexp,x;
        mpz_inits(fexp,x,NULL);
        mpz_ui_pow_ui(fexp, base, logn);

        size_t i;

        while(logn > 1) {
                mpz_set(x, fexp);
                for(i = 0; i < limit; i++) {
                        if(mpz_divisible_p(n,x)) {
                                mpz_set(r, x);
                                logn = 1;
                                break;
                        }

                        mpz_add_ui(x, x, 1);
                }
                logn--;
                mpz_tdiv_q_ui(fexp, fexp, base);
        }

        mpz_clears(fexp, x, NULL);
}

#define DEFAULT_BASE 3
#define DEFAULT_LIMIT 1000

int main(int argc, char* argv[])
{
        mpz_t n,r;
        mpz_init_set_str(n, argv[1], 10);
        mpz_init_set_ui(r, 0);

        factor(r, n, DEFAULT_BASE, DEFAULT_LIMIT);

        if(mpz_cmp_ui(r, 0) == 0) {
                printf("Could not find factor\n");
        } else {
                gmp_printf("Found factor:\n  %Zd\n", r);
        }
}


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

Enrique Santos (Intellectual author)
 
Vicent Nos Ripolles (Hacker)

Francisco Blas Izquierdo (Hacker)
Phd Student , Chalmers Institute

BanachTarskiVeli (Math, Hacker) (Anonymous Reddit User)


Mas de pascualet, computation center



