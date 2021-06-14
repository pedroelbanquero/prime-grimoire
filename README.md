# prime-grimoire

a final description of NSIF field, code, ande demo

The NSI field are the distances form N to previous primes in order of precPrime^2-F^2 defines the expansion of carmichael ,

LCM (p1-1) (p2-1) 

The camichael expansion of N allways cross N distance of a prime squares, allowing us to calculate derivated composite numbers with factors of N or his carmichael.

Carmciahel of N^2-N ever is composed by origianl carmichael factors + N factors .

# Math demonstration

As all numbers X^2-Y^2 allways contains Y and P^2-P allways is his (carmichael / totient / decimal expansion length) we can assume a prime square can contain the factors of N at the distance of N from the prime square.

Using rsa to check de decimal expansion length for a message M = 2

e = exponent

N = public key

D = private key

powMod (M) e N = MC (Message cyphered)

powMod (MC) (modular_inverse e D) N = M

This is the RSA basic algorithm.

In this case assuming the past reflections :

powMod M e N = MC

NDIFF = N-precPrime

powMod NDIFF (modular_inverse e ((precPrime^2-NDIFF^2)) (N) = message decrypted | common factor with carmichael | common factors with N


# Testing with random big prime numbers

NSIF_FACTORS N = filter (\x-> x/=1 && x/=2) $ map (\x-> gcd (n) (tryperiod2 ((n)) ((n)^2-x^2) x)) $ [2^512..2^512+5000]

```Haskell

map nsif $ sp (2^512) 1000
[[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024336702,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024336702],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024336906,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024336906],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024337246],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024337626,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024337626],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024337702,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024337702],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024338466,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024338466],[],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339522,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339522],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339622,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339622],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339682,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339682],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339894],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339934,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339934],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024340422,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024340422],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168351],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168453,40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168453],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168623],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168813],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168851],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169233],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169683],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169761],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169811],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169841],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169947],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169967],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012170211]]

```


```Haskell

*Main> map factnos $ sp (2^1024) 1000

[[719077253944926363091722076315609893447190791576922629093720324630930703222003852530833909289630144084480455519485573430635159075257666489971389722557896497511071573699461941105208878404984376477812331808340023075352602729369851525895652442163308948653402042738345192959788983753918865219341425318496896551826,719077253944926363091722076315609893447190791576922629093720324630930703222003852530833909289630144084480455519485573430635159075257666489971389722557896497511071573699461941105208878404984376477812331808340023075352602729369851525895652442163308948653402042738345192959788983753918865219341425318496896551826],[719077253944926363091722076315609893447190791576922629093720324630930703222003852530833909289630144084480455519485573430635159075257666489971389722557896497511071573699461941105208878404984376477812331808340023075352602729369851525895652442163308948653402042738345192959788983753918865219341425318496896553362,719077253944926363091722076315609893447190791576922629093720324630930703222003852530833909289630144084480455519485573430635159075257666489971389722557896497511071573699461941105208878404984376477812331808340023075352602729369851525895652442163308948653402042738345192959788983753918865219341425318496896553362],[359538626972463181545861038157804946723595395788461314546860162315465351611001926265416954644815072042240227759742786715317579537628833244985694861278948248755535786849730970552604439202492188238906165904170011537676301364684925762947826221081654474326701021369172596479894491876959432609670712659248448275913],[359538626972463181545861038157804946723595395788461314546860162315465351611001926265416954644815072042240227759742786715317579537628833244985694861278948248755535786849730970552604439202492188238906165904170011537676301364684925762947826221081654474326701021369172596479894491876959432609670712659248448276681]]

```

# The RSA NSIF Attack

![image](https://user-images.githubusercontent.com/60758685/121837222-acbc8d00-cc9a-11eb-858f-78f9ccd2fed2.png)

40 and 10 ar distances to primes under 377, the distance^2 to the prime under N , contain N if you rest N.

n^2-distance^2, the distance is the field, who defines many numbers inside who can be solved with the same field

377-5 = 373 , is prime
377-40 = 337 , is prime

The result using the square as a exponent of dif mod N is the inverse of the module .

we can extract the factors by this way with GCD function.

```Haskell

*Main> gcd (377) $ (powMod 40 (modular_inverse 65537 (377^2-40^2)) 377) - 40

13


*Main> gcd (377) $ (powMod 5 (modular_inverse 65537 (377^2-5^2)) 377) - 5

13



```

Not all primes have common factors with N, the function can return a decrypted message, a comon factors with N or common factors with carmichael / totient / decimal expansion length.

# SIMPLE ALGORITHM FOR N BITS

prim n = read ((splitOn " " $ show (P.nextPrime n)) !! 1)::Integer

sp s l = nub $ sort $  concat $ map (\x-> map (\y-> x*y) (map (\e-> prim (e*2) ) [(s)..(s)+l]) ) (map (\t-> prim (t*3)) [0,(s)..(s)+l])

nsif n = filter (\x-> x/=1 && x/=2) $ map (\x-> gcd (n) (powMod x )modular_inverse 65537 ((n)^2-x^2)) n) - x) $ [2^1024..2^1024+5000]

![image](https://user-images.githubusercontent.com/60758685/121838997-afb97c80-cc9e-11eb-90c1-db7a1c90a735.png)


