:- include('bangkrut.pl').
:- include('pajak.pl').
:- include('properti.pl').
:- include('pemain.pl').
:- include('location.pl').
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

start :- write('Masuk'),
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

changePlayerTurn :- cekPlayerTurn(X), (X = 1, retract(playerTurn(_)), asserta(playerTurn(2));
                                        X = 2, retract(playerTurn(_)), asserta(playerTurn(1))).

throwDice :- 
            cekPlayerTurn(X),
            /* Kalau sekarang giliran player 1, randomize dadu untuk player 1 dan update lokasi player 1 */
            (X == 1, asciiPlayerTurn(X), beforeMove(CanMove), (CanMove = 1, throwDice1 ; CanMove = 0, changePlayerTurn)  ;
            /* Kirim jumlah kedua dadu ke dalam fungsi updateLoc1 */
            X == 2 , asciiPlayerTurn(X), beforeMove(CanMove), (CanMove = 1, throwDice2 ; CanMove = 0, changePlayerTurn)),!.

afterMove:- cekPlayerTurn(X), checkPlayerLocation(X).

beforeMove(CanMove) :- cekPlayerTurn(X), checkPlayerLocationBefore(X, CanMove).

buyProperty :-cekPlayerTurn(X),
                   (X == 1, buyPropertyPlayer1;
                   X == 2, buyPropertyPlayer2).

infoRound(Y) :-
                round(Y).

cekPlayerTurn(X) :- 
                    playerTurn(X).

asciiPlayerTurn(X) :-
        write('=============================================='), nl,
        write('=============================================='), nl,
        write('=======            Player '),write(X),write('            ======='), nl,
        write('=============================================='), nl,
        write('=============================================='), nl, nl.