:- include('bangkrut.pl').
:- include('pajak.pl').
:- include('properti.pl').
:- include('pemain.pl').
:- include('location.pl').
:- include('penjara.pl').
:- include('pesan.pl').
:- include('board.pl').
:- include('dice.pl').
:- include('chancecard.pl').
:- include('worldtour.pl').
:- include('coinflip.pl').
:- include('buildablego.pl').

:- dynamic(round/1).
:- dynamic(win/1).
:- dynamic(start/1).
:- dynamic(playerTurn/1).
:- dynamic(repeat/1).
:- dynamic(diceCount/1).

/* Menyalakan Game */
start :- 
        initPlayer,
        /* introduction, */
        asserta(round(1)),
        asserta(start(1)),
        asserta(diceCount(0)),
        /* Saat awal ronde diluar, dadu akan dimulai dari player A */
        asserta(playerTurn(1)),!.

introduction :-
    welcomeMsg.

help :-
    write('List Command yang dapat digunakan : '), nl,
    write('         Command                    |       Kegunaan            '), nl,
    write('?- map.                             |   Menampilkan Kondisi Papan dan Posisi pemain'), nl,
    write('?- checkPlayerDetail(<ID>).         |   Menampilkan Kondisi Pemain, ganti <ID> dengan ID pemain '), nl,
    write('?- checkLocationDetail(<Petak>).    |   Menampilkan Keterangan Petak, ganti <Petak> dengan Initial Petak'), nl,
    write('?- checkPropertyDetail(<Petak>).    |   Menampilkan Keterangan Property pada suatu petak, ganti <Petak> dengan Initial Petak'), nl,
    write('?- throwDice.                       |   Melempar dadu dan melanjutkan permainan'), nl.

/* Mematikan game */
quit :-
    retract(start(_)), asserta(start(0)),!.
map:-
    start(1), board,!.

/* Mengubah Player Turn */
changePlayerTurn :- cekPlayerTurn(X), (X = 1, retract(playerTurn(_)), asserta(playerTurn(2));
                                        X = 2, retract(playerTurn(_)), asserta(playerTurn(1))).

/* Update Round */
updateRound :- infoRound(Z), NewRound is Z + 1, retract(round(_)), asserta(round(NewRound)).

/* Update DiceCount */
updateDiceCount :- diceCount(X), New is X + 1, retract(diceCount(_)), asserta(diceCount(New)).

/* Reset DiceCount */
resetDiceCount :- retract(diceCount(_)), asserta(diceCount(0)).

/* Melempar dadu untuk melanjutkan permainan */
throwDice :- start(1),
            cekPlayerTurn(X), infoRound(Z), 
            /* Kalau sekarang giliran player 1, randomize dadu untuk player 1 dan update lokasi player 1 */
            (X == 1, asciiPlayerTurn(X,Z), beforeMove(CanMove), 
                (CanMove = 1, throwDice1(Dice1, Dice2) ,
                                (Dice1 \= Dice2, resetDiceCount, writeNormal(Dice1, Dice2), afterMove, changePlayerTurn ; 
                                Dice1 = Dice2, updateDiceCount, (diceCount(Num), (Num = 3, writeDouble(Dice1,Dice2), write('Oopsie, kamu masuk penjara!'), retract(player1(ID, Loc, Money, List)), asserta(player1(ID, 'JL', Money, List)), startPlayerInJail(1), resetDiceCount, changePlayerTurn;
                                                                                Num \= 3, writeDouble(Dice1,Dice2), afterMove))); 
                CanMove = 0, afterMove, changePlayerTurn)  ;
            /* Kirim jumlah kedua dadu ke dalam fungsi updateLoc1 */
            X == 2 ,asciiPlayerTurn(X,Z),beforeMove(CanMove), 
                (CanMove = 1, throwDice2(Dice1, Dice2), 
                                (Dice1 \= Dice2, resetDiceCount, writeNormal(Dice1, Dice2), afterMove, changePlayerTurn ; 
                                Dice1 = Dice2, updateDiceCount, (diceCount(Num), (Num = 3, writeDouble(Dice1,Dice2), write('Oopsie, kamu masuk penjara!'), retract(player2(ID, Loc, Money, List)), asserta(player2(ID, 'JL', Money, List)), startPlayerInJail(2), resetDiceCount, changePlayerTurn;
                                                                                Num \= 3, writeDouble(Dice1,Dice2), afterMove))); 
                 CanMove = 0, afterMove, changePlayerTurn), updateRound),!.

/* Melakukan cek pada petak dimana pemain sedang berada (setelah pergerakan) */
afterMove:- cekPlayerTurn(X), checkPlayerLocationAfter(X).

/* Melakukan cek pada petak dimana pemain sedang berada (sebelum pergerakan) */
beforeMove(CanMove) :- cekPlayerTurn(X), checkPlayerLocationBefore(X, CanMove).

buyProperty :-cekPlayerTurn(X),
                   (X == 1, buyPropertyPlayer1;
                   X == 2, buyPropertyPlayer2).

/* Menampilkan Informasi round ke berapa */
infoRound(Y) :- round(Y).

/* Menampilkan info sedang berada di turn player yang mana */
cekPlayerTurn(X) :- playerTurn(X).

/* Menampilkan info bahwa player 1 yang sedang bergerak */
asciiPlayerTurn(X, Z) :- X = 1 , 
    write('  __________          _____                     '),nl,
    write(' |    ____  |_       |  _  |                    '),nl,
    write(' |   |    |   |     |  ||  |          _________    '),nl,
    write(' |   |     |   |   |__| |  |        ||         ||   '),nl,
    write(' |   |____|  _|         |  |        ||  ROUND  ||   '),nl,
    write(' |    ______|           |  |        ||         ||  '),nl,
    write(' |   |                  |  |        ||    '), write(Z), write('    ||  '),nl,
    write(' |   |                  |  |        ||_________||  '),nl,
    write(' |   |                 _|  |_                    '),nl,
    write(' |   |              __|      |__                  '),nl,
    write(' |___|             |____________|                  '),nl, nl.

/* Menampilkan info bahwa player 1 yang sedang bergerak */
asciiPlayerTurn(X, Z) :- X = 2 , 
    write('  __________          ________                   '),nl,
    write(' |    ____  |_       |  ___   |                   '),nl,
    write(' |   |    |   |     |  |   |   |      _________       '),nl,
    write(' |   |     |   |   |__|     |   |   ||         ||    '),nl,
    write(' |   |____|  _|           _|  _|    ||  ROUND  ||  '),nl,
    write(' |    ______|           _|  _|      ||         ||   '),nl,
    write(' |   |                 |  _|        ||    '), write(Z), write('    ||  '),nl,
    write(' |   |                |  |          ||_________||   '),nl,
    write(' |   |               |  |      ||                 '),nl,
    write(' |   |              |  |______| |                  '),nl,
    write(' |___|             |____________|                  '),nl,nl.