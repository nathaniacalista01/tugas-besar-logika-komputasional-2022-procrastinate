/* Mekanisme Penjara */
/* Seseorang masuk penjara jika
    1. Mendapat double 3x berturut-turut
    2. Mendapat kartu 'Go to Jail' */
/* Seseorang keluar penjara jika
    1. Apa bila terdapat dadu yang double tiga kali giliran
    2. Apabila pemain sudah melempar dadu sebanyak tiga kali
    3. Apabila pemain memiliki kartu 'Get Out of Jail Free'
    4. Apabila pemain membayar uang sebesar X */

/* penjara(PlayerID, Turn) */
/* :- dynamic(penjara/2). */
:- dynamic(remainTurnP1/1).
:- dynamic(remainTurnP2/1).

hargaKeluarPenjara(100).
remainTurnP1(0).
remainTurnP2(0).

player1('A', 'JL', 500, []).
player2('B', 'JL', 0, []).

/* Algoritma pertama (untuk dadu pertam) = (Money * 21 - Round + 80 + JailTurn*5)  mod 6 */
/* Algoritma kedua (untuk dadu kedua) = (Money * 19 - Round + 55 + JailTurn*8) mod6 */

/* Randomizer untuk dice dalam jail */
jailDiceRandomizer(Money, Round, JailTurn, Result1, Result2) :- Result1 is mod(Money*21 - Round + 80 + JailTurn*5, 6),
                                                        Result2 is mod(Money*19 - Round + 55 + JailTurn*8, 6).


isDouble(Money, Round, JailTurn, Double) :-  jailDiceRandomizer(Money, Round, JailTurn, _Res1, _Res2), (_Res1 = _Res2 -> Double is 1; Double is 0).

/* Memulai turn seseorang di penjara */
startPlayerInJail(PlayerID) :- ((PlayerID = 1, retract(remainTurnP1(_)), asserta(remainTurnP1(3))) ; 
                                (PlayerID = 2, retract(remainTurnP2(_)), asserta(remainTurnP2(3)) )),!.

/* Mengurangi Turn orang tersebut di penjara */
decrementTurnInJail(PlayerID) :- ((PlayerID = 1, remainTurnP1(Prev), Next is Prev-1, retract(remainTurnP1(_)), asserta(remainTurnP1(Next)));
                                (PlayerID = 2, remainTurnP2(Prev), Next is Prev-1, retract(remainTurnP2(_)), asserta(remainTurnP2(Next)))),!.

/* Mengeluarkan orang tersebut dari penjara */
releasePlayerFromJail(PlayerID) :- ((PlayerID = 1, retract(remainTurnP1(_)), asserta(remainTurnP1(0))) ; 
                                    (PlayerID = 2, retract(remainTurnP2(_)), asserta(remainTurnP2(0)))),!.

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
    write('================================================================================================'), nl,
    write('Jawaban : '), read(Result).

askUserJailChoice(PlayerID, Result) :- PlayerID = 2, remainTurnP2(P2Turn),
    write('================================================================================================'), nl,
    write('Selamat Datang di Keimusho! Berikut adalah beberapa opsi pilihan yang dapat kamu ambil!'), nl,
    write('================================================================================================'), nl,
    write('1. Kamu harus menunggu sebanyak '), write(P2Turn), write(' turn lagi!'),  nl,
    write('2. Kamu ada kartu keluar penjara? Ketik "1." untuk keluar sekarang!'),  nl,
    write('3. Mau keluar tapi gak ada kartu? Ketik "2." untuk membayar'), nl,
    write('   bayaran seharga $'), hargaKeluarPenjara(X), write(X), write(' untuk keluar sekarang.'), nl,
    write('4. Ketik "3." untuk melempar dadu lagi! Anda hanya keluar penjara bila mendapat double!'), nl,
    write('================================================================================================'), nl,
    write('Jawaban : '), read(Result).

/* Mekanisme Jail */
jailMechanism(PlayerID) :- PlayerID = 1, askUserJailChoice(PlayerID, Answer),
                        (Answer = 1).