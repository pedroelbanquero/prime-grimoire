## Factorization by power P-Q differences

# RSA POISONING ATTACK - Prime grimorie vol 3

A final description of NSIF group, code, and demo

The NSI group is the distance among n^2 and multiple of p or q -1 , or p-q, or p , or q multiple, when (p-q) is near a power .

Many semiprimes are in the same distance of n^2 to find the NSI, and factorize the number with the same distance.

## NSI = n^2 - $ minimum ( mod (n^2) (p-q) , mod (n^2) ((p-1) or (q-1)) )

## FACTOR N = gcd N $ (powMod 2 (ex * modular_inverse ex (NSI) - 1) n) - 1

## Conjecture 

If n is product of 2 primes :


## mod (n^2) (p-q) < (p-q) , easy factorize from distance than find a factor 

## mod ((p*q)^2) (p-q) = 1 or prime or square 



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

OR (C++)

time ./nsifc 257585468675898878692697829828877177271726674504483915376269783623698607231869350800480020861461078316108953783989889820659511261545507627
Found factor:
  4567759074507740406477787437675267212178680251724974985372646979034083

real	0m0.009s
user	0m0.009s
sys	0m0.000s

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

BanachTarskiVeli (Math, Hacker) (Anonymous Reddit User) (Fastest Benchmark)


Mas de pascualet, computation center



