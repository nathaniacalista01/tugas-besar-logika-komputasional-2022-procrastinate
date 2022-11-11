dice(0,6).
dice(1,1).
dice(2,2).
dice(3,3).
dice(4,4).
dice(5,5). 

:- dynamic(dadu1/1).
:- dynamic(dadu2/1).
:- dynamic(sisaBagi/1).
:- dynamic(round/1).
:- dynamic(money/1).
round(2).
money(570).

diceRandomizer(X,Y,Result1,Result2):- Temp1 is mod(13*Y-X+7,6), dice(Temp1,Angka1),
                                    Result1 is Angka1,Temp2 is mod(11*Y - X + 5,6),
                                    dice(Temp2,Angka2),Result2 is Angka2.

throwDice :- round(X),money(Y),diceRandomizer(X,Y,Angka1,Angka2),write('Dadu 1 : '),write(Angka1),write('.'),nl,
                write('Dadu 2: '),write(Angka2),write('.').