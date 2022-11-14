/* List kartu pada game tersebut 
    Jenis Kartu                     | Probabilitas  | Deskripsi
    - Kartu Tax                     |       20%     | Pemain akan ditempatkan ke tempat tax terdekat 
    - Kartu Hadiah                  |               | Pemain mendapatkan uang dengan nominal tertentu
            S 50                    |       10%     |
            S 100                   |       7,5%    |
            S 200                   |       2,5%    |
    - Kartu Get out from Jail       |       15%     | Pemain mendapatkan kesempatan untuk tidak masuk penjara
    - Kartu Go to Jail              |       20%     | Pemain langsung dimasukkan ke penjara
    - Kartu Go to World Tour        |       15%     | Pemain langsung ditempatkan kepada petak World Tour
    - Kartu Steal Property          |       5%      | Pemain dapat mengakuisisi properti pemain lain (kecuali LandMark).
    - Kartu Angel Card              |      4,9%     | Bila pemain berada di situasi menuju bangkrut, pemain dapat menggunakan kartu ini untuk selamat
    - Kartu Auto Win                |      0,1%     | Pemain langsung memenangkan permainan, tetapi persentase mendapatkan kartu ini sangat kecil
*/

/* Variabel untuk melihat bahwa pemain sedang berada pada petak CC */
:- dynamic(inCC/1). 

/* Fakta Kartu */
card('Go To Tax').
card('Free $50').
card('Free $100').
card('Free $200').
card('Get Out From Jail').
card('Go To Jail').
card('Go To World Tour').
card('Steal Property').
card('Angel Card').
card('Instant Win').

indexCard('Instant Win', 1).
indexCard('Angel Card', 2).
indexCard('Go To Tax', 3).
indexCard('Free $50', 4).
indexCard('Free $100', 5).
indexCard('Free $200', 6).
indexCard('Get Out From Jail', 7).
indexCard('Go To Jail', 8).
indexCard('Go To World Tour', 9).
indexCard('Steal Property', 10).


/* Randomizer untuk chance card 
    Menggunakan metode LCG
    X[n+1] = (X[n]*(a) + c) mod m
    a, c, m adalah -> a = 77, c = Money+537, m = 1000
    Nilai Seed atau X0 adalah sebesar (1234 + Money) 
    Money adalah banyaknya uang player saat pengambilan chance card
    Banyaknya iterasi yang dilakukan untuk metode LCG adalah nilai round pada pelaksanaan chance card
*/


/* Menentukan Random Integer */
/* Fakta */
calculateRandomChance(Money, 0, 1234+Money).

/* Rules */
calculateRandomChance(Money, Round, Result) :- NewRound is Round - 1 , calculateRandomChance(Money, NewRound, NewResult),  Result is (((NewResult*(Money+56)+Money+537) mod 1000)), !.


/* Menentukan Kartu yang Didapat */
/* Fakta */

/* Rules */
getCCIndex(Money1, Round, Result) :- calculateRandomChance(Money, Round, RandInt), 
                                        (RandInt = 777, Result is 1; 
                                        RandInt >= 750, RandInt =< 799, Result is 2;
                                        RandInt >= 700, RandInt =< 749, Result is 10;
                                        RandInt >= 0, RandInt =< 199, Result is 3;
                                        RandInt >= 200, RandInt =< 299, Result is 4;
                                        RandInt >= 300, RandInt =< 374, Result is 5;
                                        RandInt >= 375, RandInt =< 399, Result is 6;
                                        RandInt >= 400, RandInt =< 549, Result is 7;
                                        RandInt >= 550, RandInt =< 699, Result is 9;
                                        RandInt >= 800, RandInt =< 999, Result is 8),!.


/* Mengeluarkan kartu */
/* Fakta */ 

/* Rules */
/* Val yang dimasukkan pada fungsi ini adalah Val yang didapat menggunakan fungsi getCCIndex */
getChanceCard(Money, Round, _Card) :- 
            write('================================================================'), nl,
            write('================================================================'), nl,
            write('========                 GACHA TIME                     ========'), nl,
            write('================================================================'), nl,
            write('================================================================'), nl,

            getCCIndex(Money, Round, _Index), indexCard(_Card, _Index),
            write(''), nl, write('Anda mendapatkan : '), write(_Card), !.



/* 
Untuk menyimpan sementara

calculateRandomChance(_,_,1234,1).
/* Pada iterasi ke 0, result yang dikeluarkan adalah sesuai dengan money 

calculateRandomChance(Money, Round, _, Iteration) :-
    (Iteration = 1,  NewIteration is Iteration+1, calculateRandomChance(Money, Round, 1234+Money, NewIteration)).
    /* Dilakukan untuk iterasi pertama 

# If Else
kondisi -> hasil true ; hasil false 

Result is (((NewResult*(Money+56)+Money+537) mod 1000))

*/