:- include('chancecard.pl').
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
locName('CC', 'Chance Card').
locName('JL', 'Jail').
locName('TX', 'Tax').
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
locDesc('CC', 'Special Block : Draw Chance Card').
locDesc('JL', 'Special Block : Confinement').
locDesc('TX', 'Special Block : Pay Tax').
locDesc('FP', 'Special Block : Do Nothing').
locDesc('WT', 'Special Block : Travel Anywhere').


/* locOwnerDetail(Loc, Player(Owner), PropertyLevel) */
/* Inisialisasi locOwnerDetail */
locOwnerDetail('A1', '-', '-').
locOwnerDetail('A2', '-', '-').
locOwnerDetail('B1', '-', '-').
locOwnerDetail('B2', '-', '-').
locOwnerDetail('B3', 'V', 1).
locOwnerDetail('C1', '-', '-').
locOwnerDetail('C2', '-', '-').
locOwnerDetail('C3', '-', '-').
locOwnerDetail('D1', '-', '-').
locOwnerDetail('D2', 'A', 3).
locOwnerDetail('D3', '-', '-').
locOwnerDetail('E1', '-', '-').
locOwnerDetail('E2', 'A', 2).
locOwnerDetail('E3', '-', '-').
locOwnerDetail('F1', '-', '-').
locOwnerDetail('F2', '-', '-').
locOwnerDetail('F3', 'V', 0).
locOwnerDetail('G1', '-', '-').
locOwnerDetail('G2', '-', '-').
locOwnerDetail('G3', '-', '-').
locOwnerDetail('H1', 'V', 4).
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
                            !,
                            write('================================================'), nl,
                            write('          Informasi Lokasi Spesial '), nl, 
                            write('================================================'), nl,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write(B), nl,
                            (Loc == 'CC', write('Deskripsi Tambahan    : '), write('Feeling Lucky this time?');
                            Loc == 'CF', write('Deskripsi Tambahan    : '), write('WOOOHOO! GAME TIME BUDDYY!');
                            Loc == 'JL', write('Deskripsi Tambahan    : '), write('FBI! OPEN UP! *Sirens sound*');
                            Loc == 'TX', write('Deskripsi Tambahan    : '), write('Pay. Your. Debt. *Gun Click Sounds*');
                            Loc == 'FP', write('Deskripsi Tambahan    : '), write('Nothing happened... Now what?');
                            Loc == 'GO', write('Deskripsi Tambahan    : '), write('You get the money right? riightt...?');
                            Loc == 'WT', write('Deskripsi Tambahan    : '), write('Pintu kemana saja has been spawned.')), nl.



/* Condition Vacant Land */
checkLocationDetail(Loc) :-  locOwnerDetail(Loc, C, D),
                             C == ('-'),
                             D = ('-'),
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
                             write('================================================').

/* Kondisi Owned Land */
checkLocationDetail(Loc) :-  locOwnerDetail(Loc, C, D),
                             C \= ('-'),
                             biayaSewa(Loc, RentPrice, D),
                             biayaAkuisisi(Loc, Price, D),
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
/* initPlayerTemp :- 
                     player1('A','CC',1500,0,[],[],[]),asserta(round(1)). */
checkPlayer1Location :- player1(ID1,Loc1,Money1,_),infoRound(X),
                            (Loc1 == 'CC', getChanceCard(Money1,X,_Card)
                            ;
                            write('================= Selamat datang di ================= '), nl,
                            write('=================       '),write(Loc1),write('         ================='),nl,
                            write('====================================================='), cekPlayerTurn(Y),buyProperty(Y)
                            ;
                            Loc1 == 'JL', write('Selamat datang di JaiL!'),nl).

checkPlayerLocation(X) :- (X == 1, checkPlayer1Location).