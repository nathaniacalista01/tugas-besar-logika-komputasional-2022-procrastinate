/* Mekanisme Penjara */
/* Seseorang masuk penjara jika
    1. Mendapat double 3x berturut-turut
    2. Mendapat kartu 'Go to Jail' */
/* Seseorang keluar penjara jika
    1. Apa bila terdapat dadu yang double tiga kali giliran
    2. Apabila pemain sudah melempar dadu sebanyak tiga kali
    3. Apabila pemain memiliki kartu 'Get Out of Jail Free'
    4. Apabila pemain membayar uang sebesar X */


/* Hanya dinyalakan untuk testing 
:- include('pemain.pl').
:- include('dice.pl').
:- include('chancecard.pl').
player1('A', 'JL', 500, ['Angel Card', 'A Card', 'Get Out From Jail']).
player2('B', 'JL', 0, []).
infoRound(3).*/



/* penjara(PlayerID, Turn) */
/* :- dynamic(penjara/2). */
:- dynamic(isP1InJail/1).
:- dynamic(isP2InJail/2).
:- dynamic(remainTurnP1/1).
:- dynamic(remainTurnP2/1).

hargaKeluarPenjara(1500).
isP1InJail(0).
isP2InJail(0).
remainTurnP1(-1).
remainTurnP2(-1).


/* Algoritma pertama (untuk dadu pertam) = (Money * 21 - Round + 80 + JailTurn*5)  mod 6 */
/* Algoritma kedua (untuk dadu kedua) = (Money * 19 - Round + 55 + JailTurn*8) mod6 */

/* Randomizer untuk dice dalam jail */
jailDiceRandomizer(Money, Round, JailTurn, Result1, Result2) :- Res1 is mod(Money*21 - Round + 80 + JailTurn*5, 6),
                                                        Res2 is mod(Money*19 - Round + 55 + JailTurn*8, 6), 
                                                        (Res1 = 0 -> Result1 is 6; Result1 is Res1),
                                                        (Res2 = 0 -> Result2 is 6; Result2 is Res2).


isDouble(Money, Round, JailTurn, Double) :-  Int is round(Money), jailDiceRandomizer(Int, Round, JailTurn, _Res1, _Res2),
                                            write('Dadu 1 : '), write(_Res1), nl, write('Dadu 2 : '), write(_Res2), nl,
                                            asciiDice(_Res1), asciiDice(_Res2), (_Res1 = _Res2 -> Double is 1; Double is 0).

/* Memulai turn seseorang di penjara */
startPlayerInJail(PlayerID) :- ((PlayerID = 1, retract(remainTurnP1(_)), asserta(remainTurnP1(3))) ; 
                                (PlayerID = 2, retract(remainTurnP2(_)), asserta(remainTurnP2(3)) )),!.

/* Mengurangi Turn orang tersebut di penjara */
decrementTurnInJail(PlayerID) :- ((PlayerID = 1, remainTurnP1(Prev), Next is Prev-1, retract(remainTurnP1(_)), asserta(remainTurnP1(Next)));
                                (PlayerID = 2, remainTurnP2(Prev), Next is Prev-1, retract(remainTurnP2(_)), asserta(remainTurnP2(Next)))),!.

/* Mengeluarkan orang tersebut dari penjara */
releasePlayerFromJail(PlayerID) :- ((PlayerID = 1, retract(remainTurnP1(_)), asserta(remainTurnP1(-1))) ; 
                                    (PlayerID = 2, retract(remainTurnP2(_)), asserta(remainTurnP2(-1)))),!.

/* Meminta input valid dari user */
/* Input yang tidak valid otomatis akan dianggap sebagai input "3" */
askUserValidInput(Result) :- read(Answer), (Answer = 1, Result is 1 ;
                                            Answer = 2, Result is 2 ; Result is 3).

/* Menanyakan pilihan seseorang dalam penjara */
askUserJailChoice(PlayerID, Result) :- PlayerID = 1, remainTurnP1(P1Turn),
    write('================================================================================================'), nl,
    write('Selamat Datang di Keimusho! Berikut adalah beberapa opsi pilihan yang dapat kamu ambil!'), nl,
    write('================================================================================================'), nl,
    write('1. Kamu harus menunggu sebanyak '), write(P1Turn), write(' turn lagi!'),  nl,
    write('2. Kamu ada kartu keluar penjara? Ketik "1." untuk keluar sekarang!'),  nl,
    write('3. Mau keluar tapi gak ada kartu? Ketik "2." untuk membayar'), nl,
    write('   bayaran seharga $'), hargaKeluarPenjara(X), write(X), write(' untuk keluar sekarang.'), nl,
    write('4. Ketik "3." untuk melempar dadu lagi! Anda hanya keluar penjara bila mendapat double!'), nl,
    write('5. Input yang tidak valid akan otomatis dianggap sebagai "3"'), nl, 
    write('================================================================================================'), nl,
    write('Jawaban : '), askUserValidInput(Result).

askUserJailChoice(PlayerID, Result) :- PlayerID = 2, remainTurnP2(P2Turn),
    write('================================================================================================'), nl,
    write('Selamat Datang di Keimusho! Berikut adalah beberapa opsi pilihan yang dapat kamu ambil!'), nl,
    write('================================================================================================'), nl,
    write('1. Kamu harus menunggu sebanyak '), write(P2Turn), write(' turn lagi!'),  nl,
    write('2. Kamu ada kartu keluar penjara? Ketik "1." untuk keluar sekarang!'),  nl,
    write('3. Mau keluar tapi gak ada kartu? Ketik "2." untuk membayar'), nl,
    write('   bayaran seharga $'), hargaKeluarPenjara(X), write(X), write(' untuk keluar sekarang.'), nl,
    write('4. Ketik "3." untuk melempar dadu lagi! Anda hanya keluar penjara bila mendapat double!'), nl,
    write('5. Input yang tidak valid akan otomatis dianggap sebagai "3"'), nl, 
    write('================================================================================================'), nl,
    write('Jawaban : '), askUserValidInput(Result).

/* Check apakah ada kartu Get Out From Jail */
/* Fakta */
checkGetOutJailCard([], 0).
/* Rules */
checkGetOutJailCard([H|T], Result) :- (H = 'Get Out From Jail', Result is 1) ,!; checkGetOutJailCard(T, Result).

/* Remove get out from jail card */
/* Fakta */
removeGetOutJailCard(List, [], List).
/* Rule */
removeGetOutJailCard(List, [H|T], FinalList) :- H = 'Get Out From Jail' -> removeGetOutJailCard(List, T, FinalList) ;
                                                appendList(List, [H], ResList), removeGetOutJailCard(ResList, T, FinalList),!.

/* Mekanisme Jail */
jailMechanism(PlayerID, Release) :- PlayerID = 1, player1(_,_,P1Money,CardList), infoRound(CRound), remainTurnP1(P1Remain),askUserJailChoice(PlayerID, Answer),
                                (Answer = 1, checkGetOutJailCard(CardList, HaveCard),
                                            (HaveCard = 1, write('Kamu keluar dari penjara menggunakan Chance Card!'), nl, removeGetOutJailCard([],CardList, FinalList),
                                            retract(player1(ID,P1Loc,P1Money,CardList)), asserta(player1(ID,P1Loc,P1Money, FinalList)), Release is 1;
                                            HaveCard = 0, write('Kamu bohong, kamu tidak memiliki kartu tersebut.'), nl, Release is 0); 
                                Answer = 2, ( P1Money >= 1500 -> write('Kamu membayar sebesar $ 1500 untuk keluar dari penjara.'), nl, NewMoney is P1Money - 1500,
                                            retract(player1(ID,P1Loc,P1Money,CardList)), asserta(player1(ID,P1Loc,NewMoney, CardList)), Release is 1; 
                                                                write('Oops! Uang kamu tidak cukup.'), nl, Release is 0 );
                                Answer = 3, isDouble(P1Money, CRound, P1Remain, Double),
                                            (Double = 1, write('Selamat! Kamu keluar dari penjara!'), nl,  Release is 1); 
                                            (Double = 0, write('Oopsie, kamu kurang hoki!'), nl, Release is 0)), !.

jailMechanism(PlayerID, Release) :- PlayerID = 2, player2(_,_,P2Money,CardList), infoRound(CRound), remainTurnP2(P2Remain), askUserJailChoice(PlayerID, Answer),
                                (Answer = 1, checkGetOutJailCard(CardList, HaveCard),
                                            (HaveCard = 1, write('Kamu keluar dari penjara menggunakan Chance Card!'), nl, removeGetOutJailCard([],CardList, FinalList),
                                            retract(player2(ID,P2Loc,P2Money,CardList)), asserta(player2(ID,P2Loc,P2Money, FinalList)), Release is 1;
                                            HaveCard = 0, write('Kamu bohong, kamu tidak memiliki kartu tersebut.'), nl, Release is 0); 
                                Answer = 2, ( P2Money >= 1500 -> write('Kamu membayar sebesar $ 1500 untuk keluar dari penjara.'), nl, NewMoney is P2Money - 1500,
                                            retract(player2(ID,P2Loc,P2Money,CardList)), asserta(player2(ID,P2Loc,NewMoney, CardList)), Release is 1; 
                                                                write('Oops! Uang kamu tidak cukup.'), nl, Release is 0 );
                                Answer = 3, isDouble(P2Money, CRound, P2Remain, Double),
                                            (Double = 1, write('Selamat! Kamu keluar dari penjara!'), nl,  Release is 1); 
                                            (Double = 0, write('Oopsie, kamu kurang hoki!'), nl, Release is 0)), !.
