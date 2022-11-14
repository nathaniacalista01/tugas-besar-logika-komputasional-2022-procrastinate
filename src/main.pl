# :- include('bangkrut.pl').
:- include('location.pl').
# :- include('pajak.pl').
:- include('penjara.pl').
:- include('pesan.pl').
:- include('board.pl').
:- dynamic(win/1).
:- dynamic(start/1).

start :-
    /* introduction */
    /* Ini belum ada fungsinya */
    /* initMap ,*/
    initPlayer,
    asserta(start(1)),!.

introduction :-
    welcomeMsg.
    
help :- 
    write('...'), nl.

quit :-
    halt.

map:-
    start(1),board,!.