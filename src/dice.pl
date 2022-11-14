
/* Deklarasi fakta nilai - nilai dice dengan range 1 - 6 */
dice(0,6).
dice(1,1).
dice(2,2).
dice(3,3).
dice(4,4).
dice(5,5). 

/* Deklarasi variabel dynamic */

/* Round dynamic karena terus bertambah setiap ronde*/
:- dynamic(round/1).

/* Money dynamic karena uang dari pemain terus berubah ubah */
:- dynamic(money/1).

/* Temporary variable selama belum ada */
round(2).
money(570).

/* Generate random number dengan algoritma yang ada */

/* Algoritma pertama (untuk dadu pertam) = (Money * 13 - Round + 7)mod 6 */
/* Algoritma kedua (untuk dadu kedua) = (Money * 11 - Round + 5)mod6 */

diceRandomizer(X,Y,Result1,Result2):- Temp1 is mod(13*Y-X+7,6), dice(Temp1,Angka1),
                                    Result1 is Angka1,Temp2 is mod(11*Y - X + 5,6),
                                    dice(Temp2,Angka2),Result2 is Angka2.

/* Memanggil throwDice */
throwDice :- round(X),money(Y),diceRandomizer(X,Y,Angka1,Angka2),write('Dadu 1 : '),write(Angka1),write('.'),nl,
                write('Dadu 2: '),write(Angka2),write('.').