/* List kartu pada game tersebut 
    Jenis Kartu                     | Probabilitas  | Deskripsi
    - Kartu Tax                     |       20%     | Pemain akan ditempatkan ke tempat tax terdekat 
    - Kartu Hadiah                  |               | Pemain mendapatkan uang dengan nominal tertentu
            S 1000                  |       10%     |
            S 1500                  |       7,5%    |
            S 2000                  |       2,5%    |
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
card('Free $1000').
card('Free $1500').
card('Free $2000').
card('Get Out From Jail').
card('Go To Jail').
card('Go To World Tour').
card('Steal Property').
card('Angel Card').
card('Instant Win').

indexCard('Instant Win', 1).
indexCard('Angel Card', 2).
indexCard('Go To Tax', 3).
indexCard('Free $1000', 4).
indexCard('Free $1500', 5).
indexCard('Free $2000', 6).
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
getCCIndex(Money, Round, Result) :- Int is round(Money), RandInt is 700, 
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


/* calculateRandomChance(Int, Round, RandInt) */

/* Ascii Art untuk kartu */
/* Fakta */

/* Rules */
asciiCard :-    write('         ______________________________'), nl,
                write('       _|____________________________  |'), nl,
                write('      |                              | |'), nl,
                write('      |         ____________         | |'), nl,
                write('      |        |  ________  |        | |'), nl,
                write('      |       |  |        |  |       | |'), nl,
                write('      |      |  |          |  |      | |'), nl,
                write('      |      |_|            | |      | |'), nl,
                write('      |                   _|  |      | |'), nl,
                write('      |                 _|  _|       | |'), nl,
                write('      |               _|  _|         | |'), nl,
                write('      |              |  _|           | |'), nl,
                write('      |             |  |             | |'), nl,
                write('      |             | |              | |'), nl,
                write('      |             |_|              | |'), nl,
                write('      |              _               | |'), nl,
                write('      |             |_|              | |'), nl,
                write('      |                              |_|'), nl,
                write('      |______________________________|  '), nl.

/* Mengeluarkan kartu */
/* Fakta */ 

/* Rules */
/* Val yang dimasukkan pada fungsi ini adalah Val yang didapat menggunakan fungsi getCCIndex */
getChanceCard(Money, Round, _Card) :- 
            write('===================================================='), nl,
            write('========            CHANCE CARD             ========'), nl,
            write('===================================================='), nl,
            asciiCard,
            getCCIndex(Money, Round, _Index), indexCard(_Card, _Index),
            write(''), nl, write('Anda mendapatkan : '), write(_Card),nl, !.

/* Melakukan inisiasi Chance Card yang dimiliki player */
initPlayerTemp :- asserta(player1('A','CC',_,_)).

/* Menambahkan Chance Card pada List */
/* Fakta */
appendList( [], X, X).                 
/* Rules */                 
appendList( [X | Y], Z, [X | W]) :- append( Y, Z, W).  

/* Menambahkan Chance Card untuk player 1 */
addChanceCardPlayer1(Card) :- 
                        retract(player1(ID1,Loc1,Money1,List1)),appendList(List1,[Card],List2),
                        asserta(player1(ID1,Loc1,Money1,List2)).

/* Menambahkan Chance Card untuk player 2 */
addChanceCardPlayer2(Card) :- 
                        retract(player2(ID1,Loc1,Money1,List1)),appendList(List1,[Card],List2),
                        asserta(player2(ID1,Loc1,Money1,List2)).

/* Menambahkan Chance Card untuk player tertentu */
addChanceCard(Card,X) :-
                cekPlayerTurn(X),
                (X == 1, addChanceCardPlayer1(Card);
                X == 2, addChanceCardPlayer2(Card)).


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