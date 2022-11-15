/* board.pl */
/* Menampilkan papan permainan beserta kepemilikan properti dan posisi pemain */
/* kepemilikan properti dan posisi pemain belum diimplementasikan */
:- include('pemain.pl').

tes :- 
    tile(_,__,Posisi,8),write(Posisi).

tile(1,2,'FP',16).
tile(1,3,'D3',15).
tile(1,4,'D2',14).
tile(1,5,'D1',13).
tile(1,6,'TX',12).
tile(1,7,'C3',11).
tile(1,8,'C2',10).
tile(1,9,'C1',9).
tile(1,10,'JL',8).
tile(2,10,'B3',7).
tile(3,10,'B2',6).
tile(4,10,'B1',5).
tile(5,10,'CC',4).
tile(6,10,'A3',3).
tile(7,10,'A2',2).
tile(8,10,'A1',1).
tile(9,10,'GO',0).
tile(2,2,'E1',17).
tile(3,2,'E2',18).
tile(4,2,'E3',19).
tile(5,2,'CC',20).
tile(6,2,'F1',21).
tile(7,2,'F2',22).
tile(8,2,'F3',23).
tile(9,2,'WT',24).
tile(9,3,'G1',25).
tile(9,4,'G2',26).
tile(9,5,'G3',27).
tile(9,6,'TX',28).
tile(9,7,'CC',29).
tile(9,8,'H1',30).
tile(9,9,'H2',31).

boardSize(9,9).

startGame(true).

board :-  drawBoard,
            write('Posisi pemain:'), nl,
            player1(_ID1,_Loc1,_,_,_,_), write(_ID1), write(': '), write(_Loc1), nl,
            player2(_ID2,_Loc2,_,_,_,_), write(_ID2), write(': '), write(_Loc2),!.

board :- write('Permainan belum dimulai'), nl.

/* DRAW BOARD */
drawTile(1,1) :- write('----------------------------------------------'), nl,
                    drawTile(0,2).
drawTile(2,3) :- write('----------------------------------|'), 
                    drawTile(9,3).
drawTile(2,6) :- write('          M O N O P O L Y         |'),
                    drawTile(9,6).
drawTile(2,9) :- write('----------------------------------|'), 
                    drawTile(9,9).
drawTile(1,11) :- write('----------------------------------------------'), nl, 
                    drawTile(0,12).
drawTile(9,12) :- nl.
drawTile(1,Y) :- boardSize(_,H),
                    Y > 1,
                    Y < H + 2, !,
                    tile(1,Y,Obj,_), !,
                    write('| '), write(Obj), write(' |'),
                    drawTile(2,Y).
drawTile(9,Y) :- boardSize(_,H),
                    Y > 2,
                    Y < H + 1, !,
                    tile(9,Y,Obj,_), !,
                    write(' '), write(Obj), write(' |'),
                    drawTile(10,Y).
drawTile(X,2) :- boardSize(W,_),
                    X > 1,
                    X < W + 1,
                    tile(X,2,Obj,_), !,
                    write(' '), write(Obj), write(' |'),
                    X1 is X + 1,
                    drawTile(X1,2).
drawTile(X,10) :- boardSize(W,_),
                    X > 1,
                    X < W + 1,
                    tile(X,10,Obj,_), !,
                    write(' '), write(Obj), write(' |'),
                    X1 is X + 1,
                    drawTile(X1,10).
drawTile(8,Y) :- Y > 3, 
                    Y < 9, !,
                    write('    |'),
                    drawTile(9,Y).

drawTile(X,Y) :- boardSize(W,H),
                    X > 0,
                    X < W + 1,
                    Y >= 0,
                    Y < H + 4, !,
                    write('     '),
                    X1 is X + 1,
                    drawTile(X1,Y).
drawTile(10,Y) :- boardSize(_,H),
                    Y >= 0,
                    Y < H + 2, !,
                    write('     '), nl,
                    Y1 is Y + 1,
                    drawTile(0,Y1).
drawTile(0,Y) :- boardSize(_,H),
                    Y >= 0,
                    Y < H + 4, !,
                    write('     '),
                    drawTile(1,Y).

drawBoard :- drawTile(0,0).