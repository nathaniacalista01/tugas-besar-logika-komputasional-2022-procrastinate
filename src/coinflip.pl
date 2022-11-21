/* Pemain akan melakukan mini game coin flip
-> Coin flip akan diadakan 3 kali dengan pemain akan menebak Head or Tail untuk setiap iterasi,
-> Bila pemain salah menebak, maka mini game coin flip akan selesai 
    tanpa mendapatkan hadiah apapun,
-> sebaliknya, bila pemain benar menebak, maka pemain dapat memilih 
    untuk berhenti bermain atau melanjutkan permainan minigame.
*/

/* Spesifikasi hadiah yang didapatkan 
Round 1             | $ 200
Round 2             | $ 600
Round 3             | $ 1000
*/


/* Variable untuk melanjutkan permainan */
:- dynamic(programCoinFlip/1).
:- dynamic(prizeVal/1).

programCoinFlip(0).

/* Fakta Hadiah Coin Flip */
prizeCoinFlip(0, 0).
prizeCoinFlip(200, 1).
prizeCoinFlip(600, 2).
prizeCoinFlip(1000,3).

/*
    Randomizer untuk chance card 
    Menggunakan metode LCG
    X[n+1] = (X[n]*(a) + c) mod m
    X[0] => Money + 323 (seed)
    n adalah banyaknya iterasi, yaitu menggunakan round
    a dan c adalah konstan value, dimana a = count + 5, c = 10 
    count adalah ronde ke berapa pada coin flip (untuk menghindari angka yang sama muncul berulang kali)
*/ 

/* Mencari angka random untuk permainan coin flip */
/* Fakta */
calculateRandomFlip(Money, 0,_, Money+323).

/* Rules */
calculateRandomFlip(Money, Round, Count, Result) :- NewRound is Round - 1, calculateRandomFlip(Money, NewRound, Count, NewResult), Result is (((NewResult*(Count+5))+10) mod 2), !.



/* Fungsi Start Program */
/* Fakta */
/* Rules */
startCoinFlip :- retract(programCoinFlip(_Prev)), asserta(programCoinFlip(1)).

/* Fungsi Exit Program */
/* Fakta */
/* Rules */
exitCoinFlip :- retract(programCoinFlip(_Prev)), asserta(programCoinFlip(0)).

/* Menampilkan judul Round */
/* Fakta */
/* Rules */
displayRoundTitle(X,Input) :- 
        write('========================================='), nl,
        write('===========      ROUND '), write(X), write('      ==========='), nl,
        write('========================================='), nl,
        write('Head (1) or Tail (0), Masukkan angka saja : '), getUserInputCoinFlip(Input),nl.

/* Meminta input dari pengguna */
/* Fakta */
/* Rules */
getUserInputCoinFlip(X) :- read(X).

/* Menanyakan user apakah ingin melanjutkan */
askUserContinue(X) :-   write('Apakah kamu ingin melanjutkan minigame?'), nl,
                        write('1 untuk Ya, 0 untuk Tidak : '), read(X).

/* Menampilkan Ascii untuk Head */
/* Fakta */
/* Rules */
asciiHead   :-  write('             ____________________'), nl,
                write('           _|__________________  |_'), nl,
                write('         _|                    |_  |_'), nl,    
                write('       _|                        |_  |_'), nl,    
                write('     _|                            |_  |_'), nl,
                write('   _|                                |_  |_'), nl,
                write(' _|    _    _   _____     __     ___   |_  |_'), nl,
                write('|     | |  | | |  ___|  _|  |_  |   |_   |   |'), nl,
                write('|     | |  | | | |     |  __  | |  _  |  |   |'), nl,
                write('|     | |  | | | |     | |  | | | | | |  |   |'), nl,
                write('|     | |__| | | |___  | |__| | | | | |  |   |'), nl,
                write('|     |  __  | |  ___| |  __  | | | | |  |   |'), nl,
                write('|     | |  | | | |     | |  | | | | | |  |   |'), nl,
                write('|     | |  | | | |     | |  | | | |_| |  |   |'), nl,
                write('|     | |  | | | |___  | |  | | |    _|  |   |'), nl,
                write('|_    |_|  |_| |_____| |_|  |_| |___|   _|  _|'), nl,
                write('  |_                                  _|  _|'), nl, 
                write('    |_                              _|  _|'), nl, 
                write('      |_                          _|  _|'), nl,
                write('        |_                      _|  _|'), nl,
                write('          |____________________|___|'), nl.

/* Menampilkan Ascii untuk Tail */
/* Fakta */
/* Rules */
asciiTail   :-  write('             ____________________'), nl,                
                write('           _|__________________  |_'), nl,
                write('         _|                    |_  |_'), nl,    
                write('       _|                        |_  |_'), nl,    
                write('     _|                            |_  |_'), nl,
                write('   _|                                |_  |_'), nl,
                write(' _|   ______    __     ______   __     |_  |_'), nl,
                write('|    |_    _| _|  |_  |_    _| |  |      |   |'), nl,
                write('|      |  |  |  __  |   |  |   |  |      |   |'), nl,
                write('|      |  |  | |  | |   |  |   |  |      |   |'), nl,
                write('|      |  |  | |__| |   |  |   |  |      |   |'), nl,
                write('|      |  |  |  __  |   |  |   |  |      |   |'), nl,
                write('|      |  |  | |  | |   |  |   |  |      |   |'), nl,
                write('|      |  |  | |  | |   |  |   |  |      |   |'), nl,
                write('|      |  |  | |  | |  _|  |_  |  |__    |   |'), nl,
                write('|_     |__|  |_|  |_| |______| |_____|  _|  _|'), nl,
                write('  |_                                  _|  _|'), nl, 
                write('    |_                              _|  _|'), nl, 
                write('      |_                          _|  _|'), nl,
                write('        |_                      _|  _|'), nl,
                write('          |____________________|___|'), nl.

/* Melaksanakan mini game coin flip */
/* Fakta */
/* Rules */
coinFlipRound(Money, Round, Count, Continue) :-  programCoinFlip(1), displayRoundTitle(Count, _Choice), 
                                        calculateRandomFlip(Money, Round, Count, _Result), displayAsciiCoinFlip(_Result), nl,
                                        (_Choice = _Result, write('Selamat kamu memenangkan round ini!'),nl, Continue is 1 ;
                                         _Choice \= _Result, write('Maaf, kamu tidak menebak dengan benar.'),nl, Continue is 0),!.
/* Menampilkan Ascii */
/* Fakta */
/* Rules */
displayAsciiCoinFlip(Result)    :-  (Result = 1, asciiHead; Result = 0, asciiTail),!.

/* Mengatur permainan coinflip sebagai suatu kesatuan */
/* Fakta */
/* Rules */
getCoinFlip(Money, GameRound, FlipRound, Prize) :- programCoinFlip(1), coinFlipRound(Money, GameRound, FlipRound, _Continue),
                                                    (_Continue = 0, write('Permainan Coin Flip telah selesai. Kamu tidak mendapatkan apa apa.'), Prize is 0;
                                                    askUserContinue(_Choice), ( _Choice = 0 , write('Permainan telah selesai, Kamu mendapatkan $ '), write(_P), prizeCoinFlip(_P, 1), Prize is 1;
                                                            )).


