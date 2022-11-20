/* Player Status */
/* player(PlayerID, Loc, Money, Property, List of Property, List of Card) */

:- dynamic(player1/6).
:- dynamic(player2/6).

blank :- write(' ').

initPlayer :- 
                asserta(player1('A','GO',1500,0,[],[])),!,
                asserta(player2('V','GO',1500,0,[],[])),!,
                write('Selamat bermain, pemain A!'),nl,
                printInfo1,nl,!,
                write('Selamat bermain, pemain B!'),nl,
                printInfo2,nl,!.

/* Fungsi untuk update lokasi dari player pertama dan kedua */
updateLoc1(NewLoc) :- 
                retract(player1(Id,Loc,Money,Property,List1,List2)),
                tile(_,_,Loc,LocNumber),NewLocNumber is LocNumber + NewLoc,
                tile(_,_,X,NewLocNumber),
                asserta(player1(Id,X,Money,Property,List1,List2)),!.


updateLoc2(NewLoc) :-
                retract(player2(Id,Loc,Money,Property,List1,List2)),
                tile(_,_,Loc,LocNumber),NewLocNumber is LocNumber + NewLoc,
                tile(_,_,X,NewLocNumber),
                asserta(player2(Id,X,Money,Property,List1,List2)),!.

/* Fungsi untuk update jumlah uang dari player pertama dan kedua */
updateMoney1(NewMoney) :-
                retract(player1(Id,Loc,_,Property,List1,List2)),
                asserta(player1(Id,Loc,NewMoney,Property,List1,List2)).

updateMoney2(NewMoney) :-
                retract(player2(Id,Loc,_,Property,List1,List2)),
                asserta(player2(Id,Loc,NewMoney,Property,List1,List2)).

/* Fungsi untuk update jumlah property dari player pertama dan kedua */
updateProperty1(NewProperty) :-
                retract(player1(Id,Loc,Money,_,List1,List2)),
                asserta(player1(Id,Loc,Money,Property,List1,List2)).

updateProperty2(NewProperty) :-
                retract(player2(Id,Loc,Money,_,List1,List2)),
                asserta(player2(Id,Loc,Money,Property,List1,List2)).
    
printInfo1 :-
            write('================================================'), nl,
            player1(Id,Loc,Money,Property,List1,List2),
            write('              Informasi Player A '), nl,
            write('==============================================='),nl,
            write('1. Lokasi                   : '), write(Loc), nl,
            write('2. Total Uang               : '),write(Money),nl,
            write('3. Total Nilai Properti     : '),write(Property),nl,
            write('4. Total Aset               : '),TotalAsset is Money + Property,write(TotalAsset),nl,
            write('Daftar kepemilikian properti : '),nl,
            write(List1),nl,
            write('================ List Cards ================ '),nl,
            write(List2),!.

printInfo2 :-
            write('================================================'), nl,
            player2(Id,Loc,Money,Property,List1,List2),
            write('              Informasi Player V '), nl,
            write('==============================================='),nl,
            write('1. Lokasi                   : '), write(Loc), nl,
            write('2. Total Uang               : '),write(Money),nl,
            write('3. Total Nilai Properti     : '),write(Property),nl,
            write('4. Total Aset               : '),TotalAsset is Money + Property,write(TotalAsset),nl,
            write('Daftar kepemilikan Properti : '),nl,
            write(List1),nl,
            write('================ List Cards ================ '),nl,
            write(List2),!.
            
checkPlayerDetail(Player):-
                        (Player = 'A',printInfo1),!;
                        (Player = 'B',printInfo2),!.

