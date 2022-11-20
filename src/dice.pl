/* :- include ('pemain.pl'). */
/* Deklarasi fakta nilai - nilai dice dengan range 1 - 6 */
dice(0,6).
dice(1,1).
dice(2,2).
dice(3,3).
dice(4,4).
dice(5,5). 

:- dynamic(countDice/1).

/* Deklarasi variabel dynamic */

/* Generate random number dengan algoritma yang ada */

/* Algoritma pertama (untuk dadu pertam) = (Money * 13 - Round + 7)mod 6 */
/* Algoritma kedua (untuk dadu kedua) = (Money * 11 - Round + 5)mod6 */

diceRandomizer(X,Y,Result1,Result2):- Temp1 is mod(13*Y-X+7,6), dice(Temp1,Angka1),
                                    Result1 is Angka1,Temp2 is mod(13*Y - X+7,6),
                                    dice(Temp2,Angka2),Result2 is Angka2.

initDaduCount :- asserta(countDice(0)).

writeDouble(Dadu1,Dadu2) :- (Dadu1 == Dadu2,write('Dadu 1 : '),write(Dadu1),nl, write('Dadu 2 :'),write(Dadu2),nl,
                            write('Double!'), nl,Sum is Dadu1 + Dadu2,write('Anda berhasil maju sebanyak '),
                            write(Sum),write(' langkah') ).
writeNormal(Dadu1,Dadu2) :-
                            write('Dadu 1 : '),write(Dadu1),nl,write('Dadu 2 : '),write(Dadu2),nl,
                            (Dadu1 =\= Dadu2, write('Anda berhasil maju sebanyak '),Sum is Dadu1 + Dadu2 ,write(Sum),write(' langkah')).
/* Memanggil throwDice */
diceOutput(Round,Money,Dice1,Dice2) :- 
                                diceRandomizer(Round,Money,Angka1,Angka2),
                                Dice1 is Angka1, Dice2 is Angka2.