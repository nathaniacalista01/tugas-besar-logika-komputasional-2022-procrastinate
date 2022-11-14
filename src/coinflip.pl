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

/*
    Randomizer untuk chance card 
    Menggunakan metode LCG
    X[n+1] = (X[n]*(a) + c) mod m
    X[0] => Money + 323 (seed)
    n adalah banyaknya iterasi, yaitu menggunakan round
    a dan c adalah konstan value, dimana a = count + 5, c = 10 
    count adalah ronde ke berapa pada coin flip (untuk menghindari angka yang sama muncul berulang kali)
*/ 

/* Fakta */
calculateRandomFlip(Money, 0,_, Money+323).

/* Rules */
calculateRandomFlip(Money, Round, Count, Result) :- NewRound is Round - 1, calculateRandomFlip(Money, NewRound, Count, NewResult), Result is (((NewResult*(Count+5))+10) mod 2), !.

/* Variable untuk melanjutkan permainan */
:- dynamic(programCoinFlip/1).
:- dynamic(prizeVal/1).

programCoinFlip(0).

/* Fungsi Start Program */
startCoinFlip :- retract(programCoinFlip(_Prev)), asserta(programCoinFlip(1)).

/* Fungsi Exit Program */
exitCoinFlip :- retract(programCoinFlip(_Prev)), asserta(programCoinFlip(0)).

/* Menampilkan judul Round */
displayRoundTitle(X,Input) :- 
        write('========================================='), nl,
        write('===========      ROUND '), write(X), write('      ==========='), nl,
        write('========================================='), nl.
        write('Head (1) or Tail (0), Masukkan angka saja : '), getUserInputCoinFlip(Input).

/* Meminta input dari pengguna */
getUserInputCoinFlip(X) :- read(X).

/* Menampilkan Ascii untuk Head */
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
coinFlipRound(Money, Round, Count) :-  programCoinFlip(1), displayRoundTitle(Count), 
                                        write('Head (1) or Tail (0), Masukkan angka saja : '), nl,
                                        calculateRandomFlip(Money, Round, Count, _Result), displayAsciiCoinFlip(_Result).
/* Menampilkan Ascii */
displayAsciiCoinFlip(Result)    :-  (Result = 1, asciiHead; Result = 0, asciiTail),!.
