/* Player Status */
/* player(PlayerID, Loc, Money, Property, List of Card) */
:- dynamic(player1/5).
:- dynamic(player2/5).
blank :- write(' ').

initPlayer :- write('Masuk'),
            asserta(player1('A','GO',1500,0,[])),!,
            asserta(player2('V','GO',1500,0,[])),!,
            write('Selamat bermain, pemain A!'),nl,
            printInfo1,nl,!,
            write('Selamat bermain, pemain B!'),nl,
            printInfo2,nl,!.

/* Fungsi untuk update lokasi dari player pertama dan kedua */
updateLoc1(NewLoc) :- 
                retract(player1(Id,Loc,Money,Property,List1)),
                tile(_,_,Loc,LocNumber),NewLocNumber is LocNumber + NewLoc,
                tile(_,_,X,NewLocNumber),
                asserta(player1(Id,X,Money,Property,List1)),!.


updateLoc2(NewLoc) :-
                retract(player2(Id,Loc,Money,Property,List1)),
                tile(_,_,Loc,LocNumber),NewLocNumber is LocNumber + NewLoc,
                tile(_,_,X,NewLocNumber),
                asserta(player2(Id,X,Money,Property,List1)),!.

/* Fungsi untuk update jumlah uang dari player pertama dan kedua */
updateMoney1(NewMoney) :-
                retract(player1(Id,Loc,_,Property,List1)),
                asserta(player1(Id,Loc,NewMoney,Property,List1)).

updateMoney2(NewMoney) :-
                retract(player2(Id,Loc,_,Property,List1)),
                asserta(player2(Id,Loc,NewMoney,Property,List1)).

/* Fungsi untuk update jumlah property dari player pertama dan kedua */
updateProperty1(NewProperty) :-
                retract(player1(Id,Loc,Money,_,List1)),
                asserta(player1(Id,Loc,Money,Property,List1)).

updateProperty2(NewProperty) :-
                retract(player2(Id,Loc,Money,_,List1)),
                asserta(player2(Id,Loc,Money,Property,List1)).
    
printInfo1 :-
            write('================================================'), nl,
            player1(Id,Loc,Money,Property,List1),
            write('              Informasi Player A '), nl,
            write('==============================================='),nl,
            write('1. Lokasi                   : '), write(Loc), nl,
            write('2. Total Uang               : '),write(Money),nl,
            write('3. Total Nilai Properti     : '), countProperty('A',P), write(P),nl,
            write('4. Total Aset               : '),TotalAsset is Money + Property,write(TotalAsset),nl,
            write('Daftar kepemilikian properti : '),nl,
            writeLoc('A'),
            write('================ List Cards ================ '),nl,
            writeCard(List1),!.

printInfo2 :-
            write('================================================'), nl,
            player2(Id,Loc,Money,Property,List1),
            write('              Informasi Player V '), nl,
            write('==============================================='),nl,
            write('1. Lokasi                   : '), write(Loc), nl,
            write('2. Total Uang               : '),write(Money),nl,
            write('3. Total Nilai Properti     : '), countProperty('V',P), write(P),nl,
            write('4. Total Aset               : '),TotalAsset is Money + Property,write(TotalAsset),nl,
            write('Daftar kepemilikan Properti : '),nl,
            writeLoc('V'),
            write('================ List Cards ================ '),nl,
            writeCard(List1),!.
            
checkPlayerDetail(Player):-
                        (Player = 'A',printInfo1),!;
                        (Player = 'B',printInfo2),!.

writeB(0) :- write(' - Tanah'), !.
writeB(1) :- write(' - Bangunan 1'), !.
writeB(2) :- write(' - Bangunan 2'), !.
writeB(3) :- write(' - Bangunan 3'), !.
writeB(4) :- write(' - Landmark'), !.

writeX(31,ID,_) :- locOwnerDetail('H2',ID1,_), ID \= ID1, nl, !.
writeX(31,ID,NO) :- locOwnerDetail('H2',ID,B), write(NO), write('. '), write('H2'), writeB(B), nl.
writeX(IDX,ID,NO) :- tile(_,_,Loc,IDX), locOwnerDetail(Loc,ID,B), write(NO), write('. '), write(Loc), writeB(B), nl, IDX1 is IDX + 1, NO1 is NO + 1, writeX(IDX1,ID,NO1).
writeX(IDX,ID,NO) :- tile(_,_,Loc,IDX), IDX1 is IDX + 1, writeX(IDX1,ID,NO).
writeLoc(ID) :- writeX(1,ID,1),!.

countP(31,ID,0) :- locOwnerDetail('H2',ID1,_), ID \= ID1, !.
countP(31,ID,N) :- locOwnerDetail('H2',ID,B), propertyPrice('H2',N,B), !.
countP(IDX,ID,N) :- tile(_,_,Loc,IDX), locOwnerDetail(Loc,ID,B), propertyPrice(Loc,N1,B), IDX1 is IDX + 1, countP(IDX1,ID,N2), N is N1 + N2, !.
countP(IDX,ID,N) :- tile(_,_,Loc,IDX), IDX1 is IDX + 1, countP(IDX1,ID,N).
countProperty(ID,N) :- countP(1,ID,N),!.

writeCard([]).
writeCard([H|T]) :- write(H),nl,writeCard(T),!.