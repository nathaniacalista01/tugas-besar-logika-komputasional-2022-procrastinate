:- dynamic(locOwnerDetail/3).

/* locOwnerDetail(Loc, Player(Owner), PropertyLevel). */
/* Inisial Lokasi '-' Nama Lokasi */

locName('A1', 'Beijing').
locName('A2', 'Oriental Avenue').
locName('B1', 'Taipei').
locName('B2', 'New Delhi').
locName('B3', 'Seoul').
locName('C1', 'Kairo').
locName('C2', 'Tokyo').
locName('C3', 'Sydney').
locName('D1', 'Singapore').
locName('D2', 'Hong Kong').
locName('D3', 'Sao Paulo').
locName('E1', 'Prague').
locName('E2', 'Bucharest').
locName('E3', 'Berlin').
locName('F1', 'Moscow').
locName('F2', 'Geneva').
locName('F3', 'Rome').
locName('G1', 'Amsterdam').
locName('G2', 'London').
locName('G3', 'Paris').
locName('H1', 'Washington DC').
locName('H2', 'Jakarta').

/* Special location */
locName('GO', 'Start').
locName('CF', 'Coin Flip').
locName('1C', 'Chance Card 1').
locName('2C', 'Chance Card 2').
locName('3C', 'Chance Card 3').
locName('JL', 'Jail').
locName('1X', 'Tax').
locName('2X', 'Tax').
locName('FP', 'Free Parking').
locName('WT', 'World Tour').

/* Inisial Lokasi, Keterangan Lokasi */
locDesc('A1', 'Ibu Kota China').
locDesc('A2', 'Ibu Kota Avenue').
locDesc('B1', 'Ibu Kota Taiwan').
locDesc('B2', 'Ibu Kota India').
locDesc('B3', 'Ibu Kota Korea').
locDesc('C1', 'Ibu Kota Mesir').
locDesc('C2', 'Ibu Kota Jepang').
locDesc('C3', 'Ibu Kota Australia').
locDesc('D1', 'Ibu Kota Singapura').
locDesc('D2', 'Ibu Kota Hong Kong').
locDesc('D3', 'Ibu Kota Brazil').
locDesc('E1', 'Ibu Kota Czech Republic').
locDesc('E2', 'Ibu Kota Rumania').
locDesc('E3', 'Ibu Kota Jerman').
locDesc('F1', 'Ibu Kota Rusia').
locDesc('F2', 'Ibu Kota Swiss').
locDesc('F3', 'Ibu Kota Italia').
locDesc('G1', 'Ibu Kota Belanda').
locDesc('G2', 'Ibu Kota Inggris').
locDesc('G3', 'Ibu Kota Prancis').
locDesc('H1', 'Ibu Kota Amerika Serikat').
locDesc('H2', 'Ibu Kota Indonesia').

/* Special location */
locDesc('GO', 'Special Block : Start').
locDesc('CF', 'Special Block : Coin Flip Mini Game').
locDesc('1C', 'Special Block : Draw Chance Card').
locDesc('2C', 'Special Block : Draw Chance Card').
locDesc('3C', 'Special Block : Draw Chance Card').
locDesc('JL', 'Special Block : Confinement').
locDesc('1X', 'Special Block : Pay Tax').
locDesc('2X', 'Special Block : Pay Tax').
locDesc('FP', 'Special Block : Do Nothing').
locDesc('WT', 'Special Block : Travel Anywhere').

/* locOwnerDetail(Loc, Player(Owner), PropertyLevel) */
/* Inisialisasi locOwnerDetail */
locOwnerDetail('A1', 'V', 0).
locOwnerDetail('A2', '-', '-').
locOwnerDetail('B1', '-', '-').
locOwnerDetail('B2', '-', '-').
locOwnerDetail('B3', '-', 1).
locOwnerDetail('C1', '-', '-').
locOwnerDetail('C2', '-', '-').
locOwnerDetail('C3', '-', '-').
locOwnerDetail('D1', '-', '-').
locOwnerDetail('D2', 'A', 3).
locOwnerDetail('D3', '-', '-').
locOwnerDetail('E1', '-', '-').
locOwnerDetail('E2', 'A', 3).
locOwnerDetail('E3', '-', '-').
locOwnerDetail('F1', '-', '-').
locOwnerDetail('F2', '-', '-').
locOwnerDetail('F3', 'V', 0).
locOwnerDetail('G1', 'A', 0).
locOwnerDetail('G2', '-', '-').
locOwnerDetail('G3', '-', '-').
locOwnerDetail('H1', '-', 4).
locOwnerDetail('H2', 'A', 1).

/* Updating loc owner */
/* Fakta*/
/* updateAllLocOwner(_,[],[]).*/

/* Rules */
/* updateAllLocOwner(ID,List1,List2) :- player1(ID,_,_,_,[Loc|Tail],[NewPropertyLevel|TailP],_),
                                    List1 is [Loc|Tail], 
                                    retract(locOwnerDetail(Loc, OldPlayer, OldPropertyLevel)),
                                    asserta(locOwnerDetail(Loc, ID, NewPropertyLevel)). */


/* Mengubah kepemilikan sebuah loc */
changeLocOwner(LocID, PlayerID, PropertyLevel) :- retract(locOwnerDetail(LocID,_,_)), asserta(locOwnerDetail(LocID, PlayerID, PropertyLevel)).

biayaAkuisisi(Loc, Price, PropertyLevel):- biayaSewa(Loc, RentPrice, PropertyLevel),
                                           PropertyLevel \= 4,
                                           Price is 0.7 * RentPrice.

/* Condition Special Block */
checkLocationDetail(Loc) :- locName(Loc, A), locDesc(Loc, B),
                            (Loc == ('1C'); Loc == ('2C'); Loc == ('3C'); Loc == ('CF'); 
                            Loc == ('JL'); Loc == ('1X'); Loc == ('2X');Loc == ('FP'); 
                            Loc == ('GO'), Loc == ('WT')), 
                            write('================================================'), nl,
                            write('          Informasi Lokasi Spesial '), nl, 
                            write('================================================'), nl,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write(B), nl,
                            ( (Loc == '1C'; Loc == '2C'; Loc == '3C'), write('Deskripsi Tambahan  : '), write('Feeling Lucky this time?');
                            Loc == 'CF', write('Deskripsi Tambahan  : '), write('WOOOHOO! GAME TIME BUDDYY!');
                            Loc == 'JL', write('Deskripsi Tambahan  : '), write('FBI! OPEN UP! *Sirens sound*');
                            (Loc == '1X'; Loc == '2X' ), write('Deskripsi Tambahan  : '), write('Pay. Your. Debt. *Gun Click Sounds*');
                            Loc == 'FP', write('Deskripsi Tambahan  : '), write('Nothing happened... Now what?');
                            Loc == 'GO', write('Deskripsi Tambahan  : '), write('You get the money right? riightt...?');
                            Loc == 'WT', write('Deskripsi Tambahan  : '), write('Pintu kemana saja has been spawned.')), nl,!.



/* Condition Vacant Land */
checkLocationDetail(Loc) :-  locOwnerDetail(Loc, C, D),
                             C == ('-'),
                             D == ('-'),
                             locName(Loc, A),  
                             locDesc(Loc, B),
                             !,
                             write('================================================'), nl,
                             write('              Informasi Lokasi '), nl, 
                             write('================================================'), nl,
                             write('Nama Lokasi        : '), write(A), nl,   
                             write('Deskripsi Lokasi   : '), write(B), nl, nl,
                             write('Kepemilikan        : '), write('-'), nl,
                             write('Biaya Sewa Saat Ini: '), write('-'), nl, 
                             write('Biaya Akuisisi     : '), write('-'), nl, 
                             write('Tingkatan Properti : '), write('-'), nl,
                             write('================================================'),!.

/* Kondisi Owned Land */
checkLocationDetail(Loc) :-  locOwnerDetail(Loc, C, D),
                             C \= ('-'),
                             biayaSewa(Loc, D, RentPrice),
                             biayaAkuisisi(Loc, D, Price),
                             locName(Loc, A),  
                             locDesc(Loc, B),
                             !,
                             write('================================================'), nl,
                             write('              Informasi Lokasi '), nl, 
                             write('================================================'), nl,
                             write('Nama Lokasi        : '), write(A), nl,   
                             write('Deskripsi Lokasi   : '), write(B), nl, nl,
                             write('Kepemilikan        : '), write(C), nl,
                             write('Biaya Sewa Saat Ini: '), write(RentPrice), nl, 
                             write('Biaya Akuisisi     : '), write(Price), nl, 
                             write('Tingkatan Properti : '), 
                                    (D = 0, write('Tanah');
                                    D = 1, write('Bangunan 1');
                                    D = 2, write('Bangunan 2');
                                    D = 3, write('Bangunan 3');
                                    D = 4, write('Bangunan 4')), nl,
                             write('================================================').



checkPassGo1 :- passGo(X),(X == 'A',player1(_,_,Money,_),NewMoney is Money + 2000, updateMoney1(NewMoney);!).

checkPassGo2 :- passGo(X),(X == 'V',player2(_,_,Money,_),NewMoney is Money + 2000, updateMoney2(NewMoney);!).

checkPlayer1LocationAfter :- player1(ID1,Loc1,Money1,_), infoRound(X),
                            checkPassGo1,checkInGo1,
                            ( (Loc1 == '1C'; Loc1 == '2C'; Loc1 == '3C' ), getChanceCard(Money1,X,_Card),
                                   (_Card = 'Free $1000', NewMoney is Money1 + 1000, retract(player1(ID1,Loc1, Money1,List)), asserta(player1(ID1, Loc1, NewMoney, List));
                                    _Card = 'Free $1500', NewMoney is Money1 + 1500, retract(player1(ID1,Loc1, Money1,List)), asserta(player1(ID1, Loc1, NewMoney, List)); 
                                    _Card = 'Free $2000', NewMoney is Money1 + 2000, retract(player1(ID1,Loc1, Money1,List)), asserta(player1(ID1, Loc1, NewMoney, List));
                                    _Card = 'Instant Win', write('SELAMAT! Player '), write(ID1), write(' telah memenangkan permainan!'), quit;
                                    _Card = 'Go To Tax', tile(_,_,Loc1,Idx), 
                                                        ((Idx > 28 ; Idx < 4) ->  retract(player1(ID1,Loc1, Money1,List)), asserta(player1(ID1, '1X', Money1, List)) ; 
                                                                                    retract(player1(ID1,Loc1, Money1,List)), asserta(player1(ID1, '2X', Money1, List)));
                                   _Card = 'Go To Jail', retract(player1(ID1,Loc1, Money1,List)), asserta(player1(ID1, 'JL', Money1, List)), startPlayerInJail(1);
                                   _Card = 'Go To World Tour', retract(player1(ID1,Loc1, Money1,List)), asserta(player1(ID1, 'WT', Money1, List));
                                   _Card = 'Angel Card', addChanceCard(_Card,1);
                                   _Card = 'Get Out From Jail', addChanceCard(_Card,1)) ;
                                   /* _Card = 'Steal Property', ini belum ditambahin */
                            ((Loc1 == '1X'; Loc1 == '2X'), wentInTX(1)); 
                            (Loc1 == 'CF',write('masuk coin flip'),startCoinFlip,  playCoinFlip(Money1, X, FinalPrize), NewMoney is Money1+FinalPrize, retract(player1(ID1,Loc1, Money1,List)), asserta(player1(ID1, Loc1, NewMoney, List)));
                            /* (Loc1 == 'GO', ); */
                            (Loc1 == 'JL', write('Keberuntunganmu membawamu ke penjara.'),nl);
                            (Loc1 == 'WT', write('Kamu berada pada petak World Tour. Silahkan tunggu turn berikutnya untuk menggunakan mekanisme World Tour'), nl);
                            (Loc1 == 'FP', write('Kamu berada di area bebas parkir. Tidak terjadi apa-apa'));
                            buyProperty
                            ),!.
checkPlayer2LocationAfter :- player2(ID2,Loc2,Money2,_), infoRound(X),
                            checkPassGo2,
                            ( (Loc2 == '1C'; Loc2 == '2C'; Loc2 == '3C' ), getChanceCard(Money2,X,_Card),
                                   (_Card = 'Free $1000', NewMoney is Money2 + 1000, retract(player2(ID2,Loc2, Money2,List)), asserta(player2(ID2, Loc2, NewMoney, List));
                                    _Card = 'Free $1500', NewMoney is Money2 + 1500, retract(player2(ID2,Loc2, Money2,List)), asserta(player2(ID2, Loc2, NewMoney, List)); 
                                    _Card = 'Free $2000', NewMoney is Money2 + 2000, retract(player2(ID2,Loc2, Money2,List)), asserta(player2(ID2, Loc2, NewMoney, List));
                                    _Card = 'Instant Win', write('SELAMAT! Player '), write(ID2), write(' telah memenangkan permainan!'), quit;
                                    _Card = 'Go To Tax', tile(_,_,Loc2,Idx), 
                                                        ((Idx > 28 ; Idx < 4) ->  retract(player2(ID2,Loc2, Money2,List)), asserta(player2(ID2, '1X', Money2, List)) ; 
                                                                                    retract(player2(ID2,Loc2, Money2,List)), asserta(player2(ID2, '2X', Money2, List)));
                                   _Card = 'Go To Jail', retract(player2(ID2,Loc2, Money2,List)), asserta(player2(ID2, 'JL', Money2, List)), startPlayerInJail(2);
                                   _Card = 'Go To World Tour', retract(player2(ID2,Loc2, Money2,List)), asserta(player2(ID2, 'WT', Money2, List));
                                   _Card = 'Angel Card', addChanceCard(_Card,1);
                                   _Card = 'Get Out From Jail', addChanceCard(_Card,1)) ;
                                   /* _Card = 'Steal Property', ini belum ditambahin */
                            ((Loc2 == '1X'; Loc2 == '2X'), wentInTX(2)); 
                            (Loc2 == 'CF', startCoinFlip, playCoinFlip(Money2, X, FinalPrize), NewMoney is Money2+FinalPrize, retract(player2(ID2,Loc2, Money2,List)), asserta(player2(ID2, Loc2, NewMoney, List)));
                            /* (Loc2 == 'GO', ); */
                            (Loc2 == 'JL', write('Keberuntunganmu membawamu ke penjara.'),nl);
                            (Loc2 == 'WT', write('Kamu berada pada petak World Tour. Silahkan tunggu turn berikutnya untuk menggunakan mekanisme World Tour'), nl);
                            (Loc2 == 'FP', write('Kamu berada di area bebas parkir. Tidak terjadi apa-apa'));
                            checkIsProperty(Loc2,Result),(Result == 1, buyProperty;!),!
                            ),!.

checkPlayerLocationAfter(X) :- (X == 1, checkPlayer1LocationAfter;
                            X == 2, checkPlayer2LocationAfter).

wentInTX(PlayerID) :-
       checkPlayerLocationByID(PlayerID, Loc),
       (Loc == '1X'; Loc == '2X'),
       bayarPajak(PlayerID).

checkPlayerLocationBefore(X, CanMove) :- (X = 1, checkPlayer1LocationBefore(CanMove) ; X = 2, checkPlayer2LocationBefore(CanMove)).

checkPlayer1LocationBefore(CanMove) :- player1(P1ID,P1Loc, P1Money,_), 
                            ((P1Loc = 'JL', remainTurnP1(JailTurn), 
                            ( JailTurn == 0, releasePlayerFromJail(1), CanMove is 1;
                            JailTurn == -1 , canMove is 1;
                            JailTurn \= 0, JailTurn \= -1, jailMechanism(1, Release), 
                                                               (Release == 1, releasePlayerFromJail(1), CanMove is 1;
                                                               Release == 0, decrementTurnInJail(1), CanMove is 0))) ; 
                            (P1Loc = 'WT', goWorldTour(1, FinalLoc, MoneyChanges),  NewMoney is P1Money + MoneyChanges,
                            retract(player1(P1ID,P1Loc,P1Money,CardList)), asserta(player1(P1ID,FinalLoc, NewMoney,CardList)), 
                            (FinalLoc = 'WT' , write('Player '), write(P1ID), write(' tidak berpindah!'), nl, CanMove is 1; 
                            FinalLoc \= 'WT', write('Player '), write(P1ID), write(' telah berpindah ke petak '), write(FinalLoc), nl, CanMove is 0));
                            CanMove is 1),!.

checkPlayer2LocationBefore(CanMove) :- player2(P2ID,P2Loc, P2Money,_), 
                            ((P2Loc = 'JL', remainTurnP2(JailTurn), 
                            ( JailTurn == 0, releasePlayerFromJail(2), CanMove is 1;
                            JailTurn == -1 , canMove is 1;
                            JailTurn \= 0, JailTurn \= -1, jailMechanism(2, Release), 
                                                               (Release == 1, releasePlayerFromJail(2), CanMove is 1;
                                                               Release == 0, decrementTurnInJail(2), CanMove is 0))) ; 
                            (P2Loc = 'WT', goWorldTour(2, FinalLoc, MoneyChanges), NewMoney is P2Money + MoneyChanges,
                            retract(player2(P2ID,P2Loc,P2Money,CardList)), asserta(player2(P2ID,FinalLoc, NewMoney,CardList)), 
                            (FinalLoc = 'WT', write('Player '), write(P2ID), write(' tidak berpindah!'), nl, CanMove is 1 ; 
                            FinalLoc \= 'WT', write('Player '), write(P2ID), write(' telah berpindah ke petak '), write(FinalLoc), nl, CanMove is 0));
                            CanMove is 1),!.