:- include('bangkrut.pl').
:- include('location.pl').
:- include('pajak.pl').
:- include('penjara.pl').
:- include('pesan.pl').

:- dynamic(win/1).

start :-
    introduction,
    initMap,
    initPlayer.

introduction :-
    welcomeMsg.

help :- 
    write('...'), nl.

quit :-
    halt.