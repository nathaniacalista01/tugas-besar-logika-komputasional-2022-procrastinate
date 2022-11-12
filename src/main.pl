:- include('bangkrut.pl').
:- include('location.pl').
:- include('pajak.pl').
:- include('penjara.pl').

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