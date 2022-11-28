/* Pemain akan melakukan mini game coin flip
-> Coin flip akan diadakan 3 kali dengan pemain akan menebak Head or Tail untuk setiap iterasi,
-> Bila pemain salah menebak, maka mini game coin flip akan selesai 
    tanpa mendapatkan hadiah apapun,
-> sebaliknya, bila pemain benar menebak, maka pemain dapat memilih 
    untuk berhenti bermain atau melanjutkan permainan minigame.
*/

/* Spesifikasi hadiah yang didapatkan 
Round 1             | $ 2000
Round 2             | $ 4000
Round 3             | $ 6000
*/


/* Variable untuk melanjutkan permainan */
:- dynamic(programCoinFlip/1).

programCoinFlip(1).

/* Fakta Hadiah Coin Flip */
prizeCoinFlip(0, 0).
prizeCoinFlip(2000, 1).
prizeCoinFlip(4000, 2).
prizeCoinFlip(6000, 3).

/*
    Randomizer untuk chance card 
    Menggunakan metode LCG
    X[n+1] = (X[n]*(a) + c) mod m
    X[0] => Money/10 + 323 (seed)
    n adalah banyaknya iterasi, yaitu menggunakan round
    a dan c adalah konstan value, dimana a = count + 5, c = 11
    count adalah ronde ke berapa pada coin flip (untuk menghindari angka yang sama muncul berulang kali)
*/ 

/* Mencari angka random untuk permainan coin flip */
/* Fakta */
calculateRandomFlip(Money, 0,_, Money+323).

/* Rules */
calculateRandomFlip(Money, Round, Count, Result) :- NewRound is Round - 1, calculateRandomFlip(Money, NewRound, Count, NewResult), Result is (((NewResult*(Count+5))+11) mod 2), !.



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
                write('|     | |  | | |  ___|   |  |   |   |    |   |'), nl,
                write('|     | |  | | | |      |    |  |    |   |   |'), nl,
                write('|     | |  | | | |     |  ||  | | ||  |  |   |'), nl,
                write('|     | |__| | | |___  | |__| | | | | |  |   |'), nl,
                write('|     |  __  | |  ___| |  __  | | | | |  |   |'), nl,
                write('|     | |  | | | |     | |  | | | | | |  |   |'), nl,
                write('|     | |  | | | |     | |  | | | ||  |  |   |'), nl,
                write('|     | |  | | | |___  | |  | | |    |   |   |'), nl,
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
                write('|    |_    _|  |  |   |_    _| |  |      |   |'), nl,
                write('|      |  |   |    |    |  |   |  |      |   |'), nl,
                write('|      |  |  |  ||  |   |  |   |  |      |   |'), nl,
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
                                        Temp is Money/10, Int is round(Temp),
                                        calculateRandomFlip(Int, Round, Count, _Result), displayAsciiCoinFlip(_Result), nl,
                                        (( _Choice = _Result, write('Selamat kamu memenangkan round ini!'), nl, askUserContinue(_Answer),
                                        ( (_Answer = 1, Continue is 1); (_Answer = 0, Continue is 2)) ) ;
                                         _Choice \= _Result, write('Maaf, kamu tidak menebak dengan benar.'), nl, write('Permainan Coin Flip telah selesai. Kamu tidak mendapatkan apa apa.'),nl, Continue is 0),!.
/* Menampilkan Ascii */
/* Fakta */
/* Rules */
displayAsciiCoinFlip(Result)    :-  (Result = 1, asciiHead; Result = 0, asciiTail),!.

/* Mengatur permainan coinflip sebagai suatu round */
/* Fakta */
/* Rules */
getCoinFlip(Money, GameRound, FlipRound, Prize, Stop) :- programCoinFlip(1), coinFlipRound(Money, GameRound, FlipRound, _Continue),
                                                    (_Continue = 0, Prize is 0, Stop is 1; 
                                                    _Continue = 2, write('Permainan Coin Flip telah selesai. Kamu mendapatkan $'), prizeCoinFlip(_cPrize, FlipRound), write(_cPrize), Prize is _cPrize, Stop is 1;
                                                    _Continue = 1, (FlipRound = 3, write('Permainan coin flip sudah mencapai ronde terakhir.') ; FlipRound \= 3, write('Anda melanjutkan permainan Coin Flip.')), prizeCoinFlip(_cPrize, FlipRound), Prize is _cPrize, Stop is 0), nl,!.

/* Mengatur permainan Coinflip secara keseluruhan */
/* Fakta */
/* Rules */
playCoinFlip(Money, GameRound, FinalPrize) :- programCoinFlip(1), getCoinFlip(Money, GameRound, 1, _TempPrize, _Stop),
                                            (_TempPrize = 0, FinalPrize is 0, addPrize(FinalPrize),exitCoinFlip; 
                                            _TempPrize \= 0,(_Stop = 1, FinalPrize is _TempPrize,addPrize(FinalPrize),exitCoinFlip; 
                                                            _Stop = 0 , startCoinFlip, getCoinFlip(Money, GameRound, 2, _TempPrize2, _Stop2),
                                                            (_TempPrize2 = 0, FinalPrize is 0,addPrize(FinalPrize), exitCoinFlip; 
                                                             _TempPrize2 \= 0, (_Stop2 = 1, FinalPrize is _TempPrize2, addPrize(FinalPrize),exitCoinFlip;
                                                                               _Stop2 = 0, startCoinFlip, getCoinFlip(Money, GameRound, 3, _TempPrize3, _Stop3),
                                                                                (_TempPrize3 = 0, FinalPrize is 0,addPrize(FinalPrize),exitCoinFlip;
                                                                                (_TempPrize3 \= 0, FinalPrize is _TempPrize3,addPrize(FinalPrize), exitCoinFlip)))))),!.

addPrize(Money):- cekPlayerTurn(X),(X == 1 , player1(_,_,Money1,_),NewMoney is Money1 + Money, updateMoney1(NewMoney);
                                    X == 2,player2(_,_,Money2,_),NewMoney is Money2 + Money,updateMoney2(NewMoney)),!.