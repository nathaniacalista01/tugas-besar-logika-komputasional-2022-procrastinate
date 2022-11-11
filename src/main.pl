:- include('bangkrut.pl').
:- include('location.pl').
:- include('pajak.pl').
:- include('penjara.pl').

start :-
    introduction,
    initMap,
    initPlayer.

introduction :-
    write('Some Ascii Art Sh!t'), nl.

help :- 
    write('...'), nl.

quit :-
    halt.