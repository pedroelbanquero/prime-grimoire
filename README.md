# prime-grimoire
a final description of NSIF field, code, ande demo


# Math demonstration

As all numbers x^2-y alwais contain y and p^2-p allways is his (carmichael / totient / decimal expansion length) we can assume a prime square can contain the factors of N at the distance of N from the prime square.

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

NSF_FACTORS N = filter (\x-> x/=1 && x/=2) $ map (\x-> gcd (n) (tryperiod2 ((n)) ((n)^2-x^2) x)) $ [2^512..2^512+5000]

```Haskell

map nsif $ sp (2^512) 1000
[[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024336702,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024336702],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024336906,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024336906],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024337246],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024337626,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024337626],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024337702,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024337702],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024338466,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024338466],[],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339522,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339522],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339622,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339622],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339682,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339682],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339894],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339934,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024339934],[53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024340422,53631231719770388398296099992823384509917463282369573510894245774887056120294187907207497192667613710760127432745944203415015531247786279785734596024340422],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168351],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168453,40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168453],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168623],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168813],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012168851],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169233],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169683],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169761],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169811],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169841],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169947],[26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012169967],[40223423789827791298722074994617538382438097461777180133170684331165292090220640930405622894500710283070095574559458152561261648435839709839300947018252637,26815615859885194199148049996411692254958731641184786755447122887443528060147093953603748596333806855380063716372972101707507765623893139892867298012170211]]

```
