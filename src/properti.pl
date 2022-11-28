/* propertyPrice(Loc, Price, PropertyLevel). */
/* 0 == land
   1 == bangunan tingkat 1 
   2 == bangungan tingkat 2
   3 == bangunan tingkat 3
   4 == landmark */

propertyColor('A1', "light green").
propertyColor('A2', "light green").
propertyColor('B1', "green").
propertyColor('B2', "green").
propertyColor('B3', "green").
propertyColor('C1', "light blue").
propertyColor('C2', "light blue").
propertyColor('C3', "light blue").
propertyColor('D1', "blue").
propertyColor('D2', "blue").
propertyColor('D3', "blue").
propertyColor('E1', "magenta").
propertyColor('E2', "magenta").
propertyColor('E3', "magenta").
propertyColor('F1', "purple").
propertyColor('F2', "purple").
propertyColor('F3', "purple").
propertyColor('G1', "orange").
propertyColor('G2', "orange").
propertyColor('G3', "orange").
propertyColor('H1', "red").
propertyColor('H2', "red").

propertyPrice('A1', 200, 0).
propertyPrice('A2', 210, 0).
propertyPrice('B1', 220, 0).
propertyPrice('B2', 230, 0).
propertyPrice('B3', 240, 0).
propertyPrice('C1', 250, 0).
propertyPrice('C2', 260, 0).
propertyPrice('C3', 270, 0).
propertyPrice('D1', 280, 0).
propertyPrice('D2', 290, 0).
propertyPrice('D3', 300, 0).
propertyPrice('E1', 310, 0).
propertyPrice('E2', 320, 0).
propertyPrice('E3', 330, 0).
propertyPrice('F1', 340, 0).
propertyPrice('F2', 350, 0).
propertyPrice('F3', 360, 0).
propertyPrice('G1', 370, 0).
propertyPrice('G2', 380, 0).
propertyPrice('G3', 390, 0).
propertyPrice('H1', 400, 0).
propertyPrice('H2', 410, 0).

propertyPrice('A1', 1000, 1).
propertyPrice('A2', 1010, 1).
propertyPrice('B1', 1020, 1).
propertyPrice('B2', 1030, 1).
propertyPrice('B3', 1040, 1).
propertyPrice('C1', 1050, 1).
propertyPrice('C2', 1060, 1).
propertyPrice('C3', 1070, 1).
propertyPrice('D1', 1080, 1).
propertyPrice('D2', 1090, 1).
propertyPrice('D3', 1100, 1).
propertyPrice('E1', 1110, 1).
propertyPrice('E2', 1120, 1).
propertyPrice('E3', 1130, 1).
propertyPrice('F1', 1140, 1).
propertyPrice('F2', 1150, 1).
propertyPrice('F3', 1160, 1).
propertyPrice('G1', 1170, 1).
propertyPrice('G2', 1180, 1).
propertyPrice('G3', 1190, 1).
propertyPrice('H1', 1200, 1).
propertyPrice('H2', 1210, 1).

propertyPrice('A1', 2000, 2).
propertyPrice('A2', 2010, 2).
propertyPrice('B1', 2020, 2).
propertyPrice('B2', 2030, 2).
propertyPrice('B3', 2040, 2).
propertyPrice('C1', 2050, 2).
propertyPrice('C2', 2060, 2).
propertyPrice('C3', 2070, 2).
propertyPrice('D1', 2080, 2).
propertyPrice('D2', 2090, 2).
propertyPrice('D3', 2100, 2).
propertyPrice('E1', 2110, 2).
propertyPrice('E2', 2120, 2).
propertyPrice('E3', 2130, 2).
propertyPrice('F1', 2140, 2).
propertyPrice('F2', 2150, 2).
propertyPrice('F3', 2160, 2).
propertyPrice('G1', 2170, 2).
propertyPrice('G2', 2180, 2).
propertyPrice('G3', 2190, 2).
propertyPrice('H1', 2200, 2).
propertyPrice('H2', 2210, 2).

propertyPrice('A1', 3000, 3).
propertyPrice('A2', 3010, 3).
propertyPrice('B1', 3020, 3).
propertyPrice('B2', 3030, 3).
propertyPrice('B3', 3040, 3).
propertyPrice('C1', 3050, 3).
propertyPrice('C2', 3060, 3).
propertyPrice('C3', 3070, 3).
propertyPrice('D1', 3080, 3).
propertyPrice('D2', 3090, 3).
propertyPrice('D3', 3100, 3).
propertyPrice('E1', 3110, 3).
propertyPrice('E2', 3120, 3).
propertyPrice('E3', 3130, 3).
propertyPrice('F1', 3140, 3).
propertyPrice('F2', 3150, 3).
propertyPrice('F3', 3160, 3).
propertyPrice('G1', 3170, 3).
propertyPrice('G2', 3180, 3).
propertyPrice('G3', 3190, 3).
propertyPrice('H1', 3200, 3).
propertyPrice('H2', 3210, 3).

propertyPrice('A1', 4000, 4).
propertyPrice('A2', 4010, 4).
propertyPrice('B1', 4020, 4).
propertyPrice('B2', 4030, 4).
propertyPrice('B3', 4040, 4).
propertyPrice('C1', 4050, 4).
propertyPrice('C2', 4060, 4).
propertyPrice('C3', 4070, 4).
propertyPrice('D1', 4080, 4).
propertyPrice('D2', 4090, 4).
propertyPrice('D3', 4100, 4).
propertyPrice('E1', 4110, 4).
propertyPrice('E2', 4120, 4).
propertyPrice('E3', 4130, 4).
propertyPrice('F1', 4140, 4).
propertyPrice('F2', 4150, 4).
propertyPrice('F3', 4160, 4).
propertyPrice('G1', 4170, 4).
propertyPrice('G2', 4180, 4).
propertyPrice('G3', 4190, 4).
propertyPrice('H1', 4200, 4).
propertyPrice('H2', 4210, 4).

biayaSewa(Loc, PropertyLevel, Price) :- PropertyLevel == 0,
                                        !,
                                        propertyPrice(Loc, Priceproperty, PropertyLevel),
                                        Price is 0.1 * Priceproperty.
biayaSewa(Loc, PropertyLevel, Price) :- PropertyLevel == 1,
                                        !,
                                        propertyPrice(Loc, Priceproperty, PropertyLevel),
                                        Price is 0.12 * Priceproperty. 
biayaSewa(Loc, PropertyLevel, Price) :- PropertyLevel == 2,
                                        !,
                                        propertyPrice(Loc, Priceproperty, PropertyLevel),
                                        Price is 0.175 * Priceproperty.
biayaSewa(Loc, PropertyLevel, Price) :- PropertyLevel == 3,
                                        !,
                                        propertyPrice(Loc, Priceproperty, PropertyLevel),
                                        Price is 0.2 * Priceproperty.
biayaSewa(Loc, PropertyLevel, Price) :- PropertyLevel == 4,
                                        !,
                                        propertyPrice(Loc, Priceproperty, PropertyLevel),
                                        Price is 0.3 * Priceproperty.

biayaAkuisisi(Loc, PropertyLevel, Price) :- biayaSewa(Loc, PropertyLevel, RentPrice),
                                            Price is 0.7 * RentPrice,!.
                                          

checkPropertyDetail(Loc) :- start(1), locName(Loc, A),
                            locDesc(Loc, B),
                            propertyPrice(Loc, Price0, 0),
                            propertyPrice(Loc, Price1, 1),
                            propertyPrice(Loc, Price2, 2),
                            propertyPrice(Loc, Price3, 3),
                            propertyPrice(Loc, Price4, 4),
                            biayaSewa(Loc, 0, RentPrice0),
                            biayaSewa(Loc, 1, RentPrice1),
                            biayaSewa(Loc, 2, RentPrice2),
                            biayaSewa(Loc, 3, RentPrice3),
                            biayaSewa(Loc, 4, RentPrice4),
                            !,
                            write('================================================'), nl,
                            write('              Informasi Properti '), nl, 
                            write('================================================'), nl,
                            write('Nama Properti         : '), write(A), nl, 
                            write('Deskripsi Properti    : '), write(B), nl, nl, 
                            write('Harga Tanah           : '), write(Price0), nl,
                            write('Harga Bangunan 1      : '), write(Price1), nl,
                            write('Harga Bangunan 2      : '), write(Price2), nl,
                            write('Harga Bangunan 3      : '), write(Price3), nl,
                            write('Harga Landmark        : '), write(Price4), nl, nl,
                            write('Biaya Sewa Tanah      : '), write(RentPrice0), nl,
                            write('Biaya Sewa Bangunan 1 : '), write(RentPrice1), nl,
                            write('Biaya Sewa Bangunan 2 : '), write(RentPrice2), nl,
                            write('Biaya Sewa Bangunan 3 : '), write(RentPrice3), nl,
                            write('Biaya Sewa Landmark   : '), write(RentPrice4), nl, 
                            write('================================================'), nl.

/* increasePropertyPlayer1 :-  */
/* increasePropertyPlayer2 :-  */
checkIsProperty(X,Result) :- 
                     (X == 'GO', Result is 0; X == 'CF', Result is 0; 
                     X=='1C',Result is 0 ; X=='2C',Result is 0 ; 
                     X=='3C',Result is 0 ; X=='JL',Result is 0 ; 
                     X=='1X', Result is 0; X=='2X',Result is 0 ;
                     X=='FP', Result is 0; X=='WT',Result is 0 ,!;
                     Result is 1). 
writePropertyLevel(PropertyLevel) :- PropertyLevel == 0, write('tanah');
                                    PropertyLevel == 1, write('bangunan tingkat 1');
                                    PropertyLevel == 2, write('bangunan tingkat 2');
                                    PropertyLevel == 3, write('bangunan tingkat 3');
                                    PropertyLevel == 4, write('landmark').

updatePropertyOwner(Loc,ID,Level) :- retract(locOwnerDetail(Loc,_,_)), asserta(locOwnerDetail(Loc,ID,Level)).

/* Untuk boolean, 1 = True, 0 = False */
prosesBeliProperti(PlayerID, BiayaTanggungan, Loc, PropertyLevel) :- 
   sanggupBayar(PlayerID, BiayaTanggungan) -> write('Berhasil membeli '), (PropertyLevel == 0 -> write('tanah'); PropertyLevel == 1 -> write('bangunan tingkat 1'); 
   PropertyLevel == 2 -> write('bangunan tingkat 2'); PropertyLevel == 3 -> write('bangunan tingkat 3'); PropertyLevel == 4 -> write('landmark')), nl, 
   pembayaran(PlayerID, BiayaTanggungan), updatePropertyOwner(Loc, PlayerID, PropertyLevel);
   write('Uangmu tidak cukup untuk membeli properti').

prosesIncreaseProperti(PlayerID, BiayaTanggungan, Loc, PropertyLevel) :- 
   sanggupBayar(PlayerID, BiayaTanggungan) -> write('Berhasil membeli '), (PropertyLevel == 0 -> write('tanah'); PropertyLevel == 1 -> write('bangunan tingkat 1'); 
   PropertyLevel == 2 -> write('bangunan tingkat 2'); PropertyLevel == 3 -> write('bangunan tingkat 3'); PropertyLevel == 4 -> write('landmark')), nl, 
   pembayaran(PlayerID, BiayaTanggungan), updatePropertyOwner(Loc, PlayerID, PropertyLevel), !;
   write('Uangmu tidak cukup untuk meningkatkan properti, silakan pilih tingkat properti yang lebih rendah'), nl, (PlayerID == 'A', increasePropertyPlayer1; PlayerID == 'V', increasePropertyPlayer2).

buyPropertyPlayer1 :- player1(ID,Loc, _Money,_),checkIsProperty(Loc,Result), 
                     (Result == 1,
                      locOwnerDetail(Loc, OldID, _OldPropertyLevel),
                      checkPropertyDetail(Loc),
                      (OldID == ('-'),
                      write('================================================'), nl,
                      write('              Beli Properti '), nl, 
                      write('================================================'), nl,
                      write('Apakah kamu ingin membeli properti?'), nl,
                      write('Tanah (ketik 0)'), nl,
                      write('Bangunan Tingkat 1 (ketik 1)'), nl,
                      write('Bangunan Tingkat 2 (ketik 2)'), nl,
                      write('Bangunan Tingkat 3 (ketik 3)'), nl,
                      write('Ketik -1 jika tidak membeli'), nl,
                      read(Answer),
                      (Answer == 0, propertyPrice(Loc, Price, Answer), Price1 is Price, prosesBeliProperti(ID, Price1, Loc, Answer); 
                       Answer == 1, propertyPrice(Loc, Price, Answer), 
                       Price1 is Price, prosesBeliProperti(ID, Price, Loc, Answer); 
                       Answer == 2, propertyPrice(Loc, Price, Answer), Price1 is Price, prosesBeliProperti(ID, Price, Loc, Answer); 
                       Answer == 3, propertyPrice(Loc, Price, Answer), Price1 is Price, prosesBeliProperti(ID, Price, Loc, Answer); 
                       Answer == -1, write('Tidak membeli properti'), nl;
                       write('Input tidak valid!'), nl, buyPropertyPlayer1);
                       OldID == ('V'), bayarProperty1;
                       OldID == ID, increasePropertyPlayer1);
                      Result == 0, write('Tidak bisa membeli properti '),write(Loc)).

buyPropertyPlayer2 :- player2(ID,Loc,_Money,_),checkIsProperty(Loc,Result), 
                     (Result == 1,
                      locOwnerDetail(Loc, OldID, _OldPropertyLevel),
                      checkPropertyDetail(Loc),
                      (OldID == ('-'),
                      write('================================================'), nl,
                      write('              Beli Properti '), nl, 
                      write('================================================'), nl,
                      write('Apakah kamu ingin membeli properti?'), nl,
                      write('Tanah (ketik 0)'), nl,
                      write('Bangunan Tingkat 1 (ketik 1)'), nl,
                      write('Bangunan Tingkat 2 (ketik 2)'), nl,
                      write('Bangunan Tingkat 3 (ketik 3)'), nl,
                      write('Ketik -1 jika tidak membeli'), nl,
                      read(Answer),
                      (Answer == 0, propertyPrice(Loc, Price, Answer), Price1 is Price, prosesBeliProperti(ID, Price1, Loc, Answer); 
                       Answer == 1, propertyPrice(Loc, Price, Answer), 
                       Price1 is Price, prosesBeliProperti(ID, Price, Loc, Answer); 
                       Answer == 2, propertyPrice(Loc, Price, Answer), Price1 is Price, prosesBeliProperti(ID, Price, Loc, Answer); 
                       Answer == 3, propertyPrice(Loc, Price, Answer), Price1 is Price, prosesBeliProperti(ID, Price, Loc, Answer); 
                       Answer == -1, write('Tidak membeli properti');
                       write('Input tidak valid!'), nl, buyPropertyPlayer1);
                       OldID == ('A'), bayarProperty2;
                       OldID == ID, increasePropertyPlayer2);
                      Result == 0, write('Tidak bisa membeli properti '),write(Loc)).

increasePropertyPlayer1 :- player1(ID,Loc,_,_),
                           locOwnerDetail(Loc, IDPlayer, PropertyLevel),
                           (PropertyLevel == 3 ->
                           write('================================================'), nl,
                           write('              Beli Properti '), nl, 
                           write('================================================'), nl,
                           IDPlayer == ID,
                           write('Apakah kamu ingin meningkatkan properti menjadi Landmark?'), nl,
                           write('Ketik 1 jika ingin meningkatkan properti menjadi Landmark'), nl,
                           write('Ketik 0 jika tidak'), nl,
                           read(Answer),
                           (Answer == 1 -> propertyPrice(Loc, Price, 4), propertyPrice(Loc, Price0, 3), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 4), !;
                            Answer == 0, !; write('Input tidak valid!'), nl, increasePropertyPlayer1)).
                           
increasePropertyPlayer1 :- player1(ID,Loc,_Money,_),
                           locOwnerDetail(Loc, IDPlayer, PropertyLevel),
                           IDPlayer == ID,
                           write('================================================'), nl,
                           write('              Beli Properti '), nl, 
                           write('================================================'), nl,
                           (PropertyLevel == 2 -> write('Apakah kamu ingin meningkatkan properti?'), nl,
                           write('Ketik 1 jika ingin meningkatkan properti ke bangunan tingkat 3'), nl,
                           write('Ketik 0 jika tidak'), nl, 
                           read(Answer), 
                           (Answer == 1 -> propertyPrice(Loc, Price, 3), propertyPrice(Loc, Price0, 2), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 3), !;
                           Answer == 0 , !; write('Input tidak valid!'), nl, increasePropertyPlayer1);
                           PropertyLevel == 1, write('Apakah kamu ingin meningkatkan properti?'), nl,
                           write('Ketik 2 jika ingin meningkatkan properti ke bangunan tingkat 3'), nl,
                           write('Ketik 1 jika ingin meningkatkan properti ke bangunan tingkat 2'), nl,
                           write('Ketik 0 jika tidak'), nl, 
                           read(Answer),
                           (Answer == 1 -> propertyPrice(Loc, Price, 2), propertyPrice(Loc, Price0, 1), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 2), !;
                           Answer == 2 -> propertyPrice(Loc, Price, 3), propertyPrice(Loc, Price0, 1), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 3), !;
                           Answer == 0 , !; write('Input tidak valid!'), nl, increasePropertyPlayer1);
                           PropertyLevel == 0, write('Apakah kamu ingin meningkatkan properti?'), nl,
                           write('Ketik 3 jika ingin meningkatkan properti ke bangunan tingkat 3'), nl,
                           write('Ketik 2 jika ingin meningkatkan properti ke bangunan tingkat 2'), nl,
                           write('Ketik 1 jika ingin meningkatkan properti ke bangunan tingkat 1'), nl,
                           write('Ketik 0 jika tidak'), nl, 
                           read(Answer),
                           (Answer == 1 -> propertyPrice(Loc, Price, 1), propertyPrice(Loc, Price0, 0), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 1), !;
                           Answer == 2 -> propertyPrice(Loc, Price, 2),  propertyPrice(Loc, Price0, 0), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 2), !;
                           Answer == 3 -> propertyPrice(Loc, Price, 3),  propertyPrice(Loc, Price0, 0), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 3), !;
                           Answer == 0 , !; write('Input tidak valid!'), nl, increasePropertyPlayer1)).

increasePropertyPlayer2 :- player2(ID,Loc,_,_),
                           locOwnerDetail(Loc, IDPlayer, PropertyLevel),
                           (PropertyLevel == 3 -> 
                           write('================================================'), nl,
                           write('              Beli Properti '), nl, 
                           write('================================================'), nl,
                           IDPlayer == ID,
                           write('Apakah kamu ingin meningkatkan properti menjadi Landmark?'), nl,
                           write('Ketik 1 jika ingin meningkatkan properti'), nl,
                           write('Ketik 0 jika tidak'), nl,
                           read(Answer),
                           (Answer == 1 -> propertyPrice(Loc, Price, 4), propertyPrice(Loc, Price0, 3), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 4), !;
                            Answer == 0, !; write('Input tidak valid!'), nl, increasePropertyPlayer1)).

increasePropertyPlayer2 :- player2(ID,Loc,_Money,_),
                           locOwnerDetail(Loc, IDPlayer, PropertyLevel),
                           IDPlayer == ID,
                           write('================================================'), nl,
                           write('              Beli Properti '), nl, 
                           write('================================================'), nl,
                           (PropertyLevel == 2 -> write('Apakah kamu ingin meningkatkan properti?'), nl,
                           write('Ketik 1 jika ingin meningkatkan properti ke bangunan tingkat 3'), nl,
                           write('Ketik 0 jika tidak'), nl, 
                           read(Answer), 
                           (Answer == 1 -> propertyPrice(Loc, Price, 3), propertyPrice(Loc, Price0, 2), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 3), !;
                           Answer == 0 , !; write('Input tidak valid!'), nl, increasePropertyPlayer1);
                           PropertyLevel == 1, write('Apakah kamu ingin meningkatkan properti?'), nl,
                           write('Ketik 2 jika ingin meningkatkan properti ke bangunan tingkat 3'), nl,
                           write('Ketik 1 jika ingin meningkatkan properti ke bangunan tingkat 2'), nl,
                           write('Ketik 0 jika tidak'), nl, 
                           read(Answer),
                           (Answer == 1 -> propertyPrice(Loc, Price, 2), propertyPrice(Loc, Price0, 1), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 2), !;
                           Answer == 2 -> propertyPrice(Loc, Price, 3), propertyPrice(Loc, Price0, 1), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 3), !;
                           Answer == 0 , !; write('Input tidak valid!'), nl, increasePropertyPlayer1);
                           PropertyLevel == 0, write('Apakah kamu ingin meningkatkan properti?'), nl,
                           write('Ketik 3 jika ingin meningkatkan properti ke bangunan tingkat 3'), nl,
                           write('Ketik 2 jika ingin meningkatkan properti ke bangunan tingkat 2'), nl,
                           write('Ketik 1 jika ingin meningkatkan properti ke bangunan tingkat 1'), nl,
                           write('Ketik 0 jika tidak'), nl, 
                           read(Answer),
                           (Answer == 1 -> propertyPrice(Loc, Price, 1), propertyPrice(Loc, Price0, 0), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 1), !;
                           Answer == 2 -> propertyPrice(Loc, Price, 2),  propertyPrice(Loc, Price0, 0), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 2), !;
                           Answer == 3 -> propertyPrice(Loc, Price, 3),  propertyPrice(Loc, Price0, 0), Price1 is Price - Price0, prosesIncreaseProperti(ID, Price1, Loc, 3), !;
                           Answer == 0 , !; write('Input tidak valid!'), nl, increasePropertyPlayer1)).

printAngelCard(Answer) :- write('=========== ANGEL CARD ==========='),nl,
                  write('Selamat, kamu mempunyai Angel Card, apakah kamu mau menggunakannya?'),nl,
                  write('Ketik 1 jika ingin menggunakan Angel Card'),nl,
                  write('Ketik 0 jika tidak ingin menggunakan Angel Card'),nl,
                  read(Temp), Answer is Temp.

notUseAngelCard :-
                  write(' ================ Yahh, kamu tetap harus membayar =============='),
                  nl.
useAngelCard1 :- retract(player1(ID,Loc,Money,ListCard)), remover('Angel Card',ListCard,NewList),
                  asserta(player1(ID,Loc,Money,NewList)),
                  write('============ Angel Card Dihapus ============'),nl,!.

useAngelCard2 :- retract(player2(ID,Loc,Money,ListCard)), remover('Angel Card',ListCard,NewList),
                  asserta(player2(ID,Loc,Money,NewList)),
                  write('============ Angel Card Dihapus ============'),nl,!.

bayarProperty1 :- player1(_ID, Loc, _Money,ListCard),
                locOwnerDetail(Loc, 'V', PropertyLevel),Temp is PropertyLevel,
                write('Yah kamu terkena biaya sewa: '),biayaSewa(Loc,Temp,Price),
                write(Price),nl,displayKekayaan('A'),
                checkAngelCard(ListCard,Result),
                (Result == 1 -> printAngelCard(Answer),
                  (Answer == 1, useAngelCard1,!;
                  Answer == 0, notUseAngelCard,prosesBayar('A',Price)), acProperty, !;
                Result == 0 -> prosesBayar('A',Price), acProperty, !).

bayarProperty2 :- player2(_ID, Loc, _Money,ListCard),
                locOwnerDetail(Loc, 'A', PropertyLevel),Temp is PropertyLevel,
                write('Yah kamu terkena biaya sewa: '),biayaSewa(Loc,Temp,Price),
                write(Price),nl,displayKekayaan('V'),
                checkAngelCard(ListCard,Result),
                (Result == 1 -> printAngelCard(Answer),
                  (Answer == 1, useAngelCard2,acProperty,!;
                  Answer == 0, notUseAngelCard,prosesBayar('V',Price),start(X),(X \= 0, acProperty;!));
                Result == 0 , prosesBayar('V',Price),acProperty,!).
/* Player 1 mau akuisisi bangunan Player 2 */
acProperty :-  cekPlayerTurn(X),
               (X == 1, acProperty1,!;
               X == 2, acProperty2,!),!.

acProperty1 :- player1(ID,Loc,Money,_),
               locOwnerDetail(Loc,'V',PropertyLevel), Temp is PropertyLevel,
               biayaAkuisisi(Loc, Temp, AccPrice),
               (Money < AccPrice -> write('Uangmu tidak cukup untuk akuisisi properti!'), !;
                 Money >= AccPrice -> write('Apakah kamu ingin mengakuisisi properti? (yes/no)'), nl,
                 read(Answer), (Answer == 'yes' -> write('Berhasil mengakuisisi properti'), nl, retract(locOwnerDetail(Loc, _IDPlayer, PropertyLevel)),
                 asserta(locOwnerDetail(Loc, ID, PropertyLevel)), pembayaran(ID, AccPrice), !;
                 Answer == 'no' -> write('Tidak mengakuisisi properti'), !;
                 write('Input tidak valid, masukan hanya yes/no'),nl, acProperty1)).

acProperty2 :- player2(ID,Loc,Money,_),
                locOwnerDetail(Loc, 'A', PropertyLevel),Temp is PropertyLevel,
                biayaAkuisisi(Loc,Temp,AccPrice),
                (Money < AccPrice -> write('Uangmu tidak cukup untuk akuisisi properti'), !;
                 Money >= AccPrice -> write('Apakah kamu ingin mengakuisisi properti? (yes/no)'), nl,
                 read(Answer), (Answer == 'yes' -> write('Berhasil mengakuisisi properti'), nl,retract(locOwnerDetail(Loc, _IDPlayer, PropertyLevel)),
                 asserta(locOwnerDetail(Loc, ID, PropertyLevel)), pembayaran(ID, AccPrice), !;
                 Answer == 'no' -> write('Tidak mengakuisisi properti'), !;
                 write('Input tidak valid, masukan hanya yes/no'), nl, acProperty2)).
               
               
   
buyProperty(X) :- 
                  (X == 1, buyPropertyPlayer1;
                  X == 2, buyPropertyPlayer2).

jualProperty(ID, Money) :- countProperty(ID,N), Money is N, resetProperty(ID,1), !.

resetProperty(ID, 31) :- tile(_,_,Loc,31), locOwnerDetail(Loc, IDPlayer, _PropertyLevel), ID \= IDPlayer, !.

resetProperty(ID, 31) :- tile(_,_,Loc,31), locOwnerDetail(Loc, IDPlayer, PropertyLevel), !,
                           (IDPlayer == ID -> retract(locOwnerDetail(Loc,IDPlayer, PropertyLevel)), asserta(locOwnerDetail(Loc,'-','-'))).

resetProperty(ID, IDX) :- tile(_,_,Loc,IDX), locOwnerDetail(Loc, IDPlayer, PropertyLevel),
                           (IDPlayer == ID -> retract(locOwnerDetail(Loc,IDPlayer, PropertyLevel)), asserta(locOwnerDetail(Loc,'-','-'))),
                           IDX1 is IDX + 1, resetProperty(ID, IDX1).

resetProperty(ID, IDX) :- IDX1 is IDX + 1, resetProperty(ID, IDX1).

checkAngelCard([], 0).
checkAngelCard([H|T], Result) :- (H == ('Angel Card'), Result is 1, !;
                                 checkAngelCard(T, Result)).

remover(_, [], []).
remover(R, [R|T], T).
remover(R, [H|T], [H|T2]) :- H \= R, remover(R, T, T2).

/* ---Steal Property Procedure--- */
/* Write Oponent's Properties Without Landmark */
writeY(31,ID,_) :- locOwnerDetail('H2',ID1,_), ID \= ID1, nl, !.
writeY(31,ID,NO) :- locOwnerDetail('H2',ID,B), write(NO), write('. '), write('H2'), writeB(B), nl.
writeY(IDX,ID,NO) :- tile(_,_,Loc,IDX), locOwnerDetail(Loc,ID,B), B \= 4, write(NO), write('. '), write(Loc), writeB(B), nl, IDX1 is IDX + 1, NO1 is NO + 1, writeY(IDX1,ID,NO1).
writeY(IDX,ID,NO) :- tile(_,_,_,IDX), IDX1 is IDX + 1, writeY(IDX1,ID,NO).
writeLocWithoutLandmark(ID) :- writeY(1,ID,1),!.

/* Procedure Count Jumlah Properti */
countY(31,ID,0) :- locOwnerDetail('H2',ID1,_), ID \= ID1, !.
countY(31,ID,1) :- locOwnerDetail('H2',ID,Level), Level\= 4, !.
countY(IDX,ID,N) :- tile(_,_,Loc,IDX), locOwnerDetail(Loc,ID,Level), Level \= 4, IDX1 is IDX + 1, countY(IDX1,ID,N2), N is 1 + N2, !.
countY(IDX,ID,N) :- tile(_,_,_,IDX), IDX1 is IDX + 1, countY(IDX1,ID,N).
countBanyakProperty(ID,N) :- countY(1,ID,N),!.

checkLocOwner1(Loc, Result, Level1) :- locOwnerDetail(Loc, IDPlayer, Level),
                                       (IDPlayer \= ('V'), Result is 0, Level1 is -1;
                                       IDPlayer == ('V'), Level\= 4, Result is 1, Level1 is Level), !.

checkLocOwner2(Loc, Result, Level1) :- locOwnerDetail(Loc, IDPlayer, Level),
                                       (IDPlayer \= ('A'), Result is 0, Level1 is -1;
                                       IDPlayer == ('A'), Level\= 4, Result is 1, Level1 is Level), !.
stealProperty1 :- countBanyakProperty('V', Count),
                  Count == 0,
                  write('Sayang sekali player V tidak memiliki properti untuk diakuisisi:('), nl, !.
                  
stealProperty1 :- write('Yes! Kamu dapat mengakuisisi properti player V!'), nl, 
                  write('Properti mana yang ingin kamu akuisisi? (ketik lokasi, contoh: \'A1\')'), nl,
                  writeLocWithoutLandmark('V'),
                  read(Answer),
                  checkLocOwner1(Answer, Result, Level),
                  (Result == 0 -> write('Masukan lokasi tidak valid!'), nl, stealProperty1;
                  Result == 1, updatePropertyOwner(Answer, 'A', Level), !).

stealProperty2 :- countBanyakProperty('A', Count),
                  Count == 0,
                  write('Sayang sekali player A tidak memiliki properti untuk diakuisisi:('), nl, !.
                  
stealProperty2 :- write('Yes! Kamu dapat mengakuisisi properti player A!'), nl, 
                  write('Properti mana yang ingin kamu akuisisi? (ketik lokasi, contoh: \'A1\')'), nl,
                  writeLocWithoutLandmark('A'),
                  read(Answer),
                  checkLocOwner2(Answer, Result, Level),
                  (Result == 0 -> write('Masukan lokasi tidak valid!'), nl, stealProperty2;
                  Result == 1, updatePropertyOwner(Answer, 'V', Level), !).

