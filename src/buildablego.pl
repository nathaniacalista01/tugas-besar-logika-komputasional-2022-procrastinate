checkInGo1 :- player1(_,Loc,_,_), (Loc == 'GO', goBuild1;!).
checkInGo2 :- player2(_,Loc,_,_),(Loc == 'GO',goBuild2;!).

goBuild1 :-
                write('====================== GO BUILD ======================'),nl,
                write('Apakah kamu ingin menambah bangunan atau membuat landmark?'),nl,
                write('1. Ketik 1 jika ingin menambah bangunan atau membuat landmark'),nl,
                write('2. Ketik 0 jika tidak ingin melakukan apa - apa'),nl,
                read(Answer),
                (Answer == 1, tambahBangunan1;
                Answer == 0, write('Sayang sekali, semoga lain kali kamu mau :((');
                write('Input tidak valid, silakan ulangi lagi!'),nl,goBuild1,!).

goBuild2 :-
                write('====================== GO BUILD ======================'),nl,
                write('Apakah kamu ingin menambah bangunan atau membuat landmark?'),nl,
                write('1. Ketik 1 jika ingin menambah bangunan atau membuat landmark'),nl,
                write('2. Ketik 0 jika tidak ingin melakukan apa - apa'),nl,
                read(Answer),
                (Answer == 1, tambahBangunan2;
                Answer == 0, write('Sayang sekali, semoga lain kali kamu mau :(('),!;
                write('Input tidak valid, silakan ulangi lagi!'),nl,goBuild2,!).

tambahBangunan1 :- write('===================== LIST PROPERTY ====================='),nl,
                    writeLoc('A'),nl, write('Silakan pilih properti yang mau kamu bangun!'),nl,
                    read(Answer),getLocX('A',Answer,Loc),write('Ke level mana kamu mau upgrade '),write(Loc),write('?'),nl,
                    write('1. Ketik 0 untuk menjadikannya ke tanah') ,nl,write('2. Ketik 1 untuk menjadikannya ke bangunan 1'),nl,
                    write('3. Ketik 2 untuk menjadikannya ke bangunan 2'),nl,write('4. Ketik 3 untuk menjadikannya ke bangunan 3'),nl,
                    write('5. Ketik 4 untuk menjadikannya ke Landmark'),nl,
                    read(Level),(Level \= 1, Level \= 2, Level \= 3, Level \= 4, Level \= 0, write('Input tidak valid, silakan ulangi lagi!'),nl,tambahBangunan1,!;
                    upgradeProperti1(Loc,Level),write('================= UPGRADE SELESAI ================='),nl,
                    write(Loc), write(' sekarang sudah di level '), locOwnerDetail(Loc,'A',Level),writeB(Level),nl).

tambahBangunan2 :- write('===================== LIST PROPERTY ====================='),nl,
                    writeLoc('V'),nl, write('Silakan pilih properti yang mau kamu bangun!'),nl,
                    read(Answer),getLocX('V',Answer,Loc),write('Ke level mana kamu mau upgrade '),write(Loc),write('?'),nl,
                    write('1. Ketik 0 untuk menjadikannya ke tanah') ,nl,write('2. Ketik 1 untuk menjadikannya ke bangunan 1'),nl,
                    write('3. Ketik 2 untuk menjadikannya ke bangunan 2'),nl,write('4. Ketik 3 untuk menjadikannya ke bangunan 3'),nl,
                    write('5. Ketik 4 untuk menjadikannya ke Landmark'),nl,
                    read(Level),(Level \= 1, Level \= 2, Level \= 3, Level \= 4, Level \= 0, write('Input tidak valid, silakan ulangi lagi!'),nl,tambahBangunan2,!;
                    upgradeProperti2(Loc,Level),write('================= UPGRADE SELESAI ================='),nl,
                    write(Loc), write(' sekarang sudah di level '), locOwnerDetail(Loc,'V',Level),writeB(Level),nl).

upgradeProperti1(Loc,NewLevel) :-retract(locOwnerDetail(Loc,'A',OldLevel)),asserta(locOwnerDetail(Loc,'A',NewLevel)).
upgradeProperti2(Loc,NewLevel) :-retract(locOwnerDetail(Loc,'V',OldLevel)),asserta(locOwnerDetail(Loc,'V',NewLevel)).

getLocN(31,ID,N,N,31) :- tile(_,_,Loc,31), locOwnerDetail(Loc, ID, _),!.
getLocN(IDX,ID,N,N,IDX) :- tile(_,_,Loc,IDX), locOwnerDetail(Loc, ID, _),!.
getLocN(IDX,ID,NO,N,LocID) :- tile(_,_,Loc,IDX), locOwnerDetail(Loc, ID, _), NO =< N,
                            IDX1 is IDX + 1, NO1 is NO + 1, getLocN(IDX1,ID,NO1,N,LocID).                            
getLocN(IDX,ID,NO,N,LocID) :- IDX1 is IDX + 1, getLocN(IDX1,ID,NO,N,LocID).

getLocX(ID,N,Loc) :- getLocN(1,ID,1,N,LocID), tile(_,_,Loc,LocID), !.