# :- include('bangkrut.pl').
:- include('location.pl').
# :- include('pajak.pl').
:- include('penjara.pl').
:- include('pesan.pl').
:- include('board.pl').
:- include('dice.pl').

:- dynamic(round/1).
:- dynamic(win/1).
:- dynamic(start/1).
:- dynamic(playerTurn/1).
:- dynamic(repeat/1).
:- dynamic(diceCount/1).

start :-
    /* introduction */
    /* Ini belum ada fungsinya */
    /* initMap ,*/
    initPlayer,
    asserta(round(1)),
    asserta(start(1)),
    asserta(diceCount(1)),
    /* Saat awal ronde diluar, dadu akan dimulai dari player A */
    asserta(playerTurn(1)),!.

introduction :-
    welcomeMsg.

help :- 
    write('...'), nl.

quit :-
    halt.

map:-
    start(1),board,!.

throwDice :- 
            cekPlayerTurn(X),
            /* Kalau sekarang giliran player 1, randomize dadu untuk player 1 dan update lokasi player 1 */
            (X == 1, player1(_,_,Money1,_,_,_),infoRound(Y),retract(diceCount(X1)),write('Sekarang adalah giliran player 1!'),nl,
                diceOutput(Y,Money1,Dice1,Dice2),    
                ( Dice1 = Dice2,
                    (X1 == 3,write('Anda masuk ke Jail karena mendapatkan double 3 kali berturut - turut'),nl,asserta(diceCount(1)),retract(playerTurn(X2)),asserta(playerTurn(2))),!;
                    (writeDouble(Dice1,Dice2),Sum is X1 + 1, asserta(diceCount(Sum)),NewLoc is Dice1 + Dice2,updateLoc1(NewLoc))),!;
                (X == 1,writeNormal(Dice1,Dice2),asserta(playerTurn(2)),asserta(diceCount(1)),NewLoc is Dice1 + Dice2,updateLoc1(NewLoc),!),!); 

            /* Kirim jumlah kedua dadu ke dalam fungsi updateLoc1 */
            (infoRound(Y),player2(_,_,Money2,_,_,_),write('Sekarang adalah giliran player 2!'),nl,
            diceOutput(Y,Money2,Dice3,Dice4),retract(diceCount(Count)),
                (Dice3 == Dice4, 
                    (Count == 3, write('Anda masuk ke Jail karena mendapatkan double 3 kali berturut - turut'),nl, asserta(diceCount(1)), retract(playerTurn(X3)),asserta(playerTurn(1))),!;
                    (writeDouble(Dice3,Dice4),Sum is Count +1, asserta(diceCount(Sum)),NewLoc is Dice3 + Dice4,updateLoc2(NewLoc))),!;
                (writeNormal(Dice3,Dice4)),asserta(playerTurn(1)),asserta(diceCount(1)),retract(round(PrevRound)),NewRound is PrevRound +1, asserta(round(NewRound),
                NewLoc is Dice3+Dice4,updateLoc2(NewLoc)),!),!.

infoRound(Y) :-
                round(Y).

cekPlayerTurn(X) :- 
                    playerTurn(X).