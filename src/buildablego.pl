checkInGo1 :- player1(_,Loc,_,_), (Loc == 'GO', goBuild1;!).
checkInGo2 :- player2(_,Loc,_,_),(Loc == 'GO',goBuild2;!).

goBuild1 :-
                write('====================== GO BUILD ======================'),nl,
                write('Apakah kamu ingin menambah bangunan atau membuat landmark?'),nl,
                write('1. Ketik 1 jika ingin menambah bangunan '),nl,
                write('2. Ketik 2 jika ingin membuat landmark'),nl,
                write('3. Ketik 0 jika tidak ingin melakukan apa - apa'),nl,
                read(Answer),
                (Answer == 1, tambahBangunan1;
                Answer == 2, landMark1;
                Answer == 0, write('Sayang sekali, semoga lain kali kamu mau :(('),!).

tambahBangunan1 :- write('===================== LIST PROPERTY ====================='),nl,
                    writeLoc('A'),nl, write('Silakan pilih properti yang mau kamu bangun!'),
                    read(Answer),.

landMark1 :- write('Kamu upgrade landmark!').
