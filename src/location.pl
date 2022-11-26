:- include('pemain.pl').
# :- include('properti.pl').
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

/* Inisialisasi locOwnerDetail */
locOwnerDetail('A1', '-', '-').
locOwnerDetail('A2', '-', '-').
locOwnerDetail('B1', '-', '-').
locOwnerDetail('B2', '-', '-').
locOwnerDetail('B3', '-', '-').
locOwnerDetail('C1', '-', '-').
locOwnerDetail('C2', '-', '-').
locOwnerDetail('C3', '-', '-').
locOwnerDetail('D1', '-', '-').
locOwnerDetail('D2', '-', '-').
locOwnerDetail('D3', '-', '-').
locOwnerDetail('E1', '-', '-').
locOwnerDetail('E2', '-', '-').
locOwnerDetail('E3', '-', '-').
locOwnerDetail('F1', '-', '-').
locOwnerDetail('F2', '-', '-').
locOwnerDetail('F3', '-', '-').
locOwnerDetail('G1', '-', '-').
locOwnerDetail('G2', '-', '-').
locOwnerDetail('G3', '-', '-').
locOwnerDetail('H1', '-', '-').
locOwnerDetail('H2', '-', '-').

/* updating loc owner */
updateLocOwner(_,[],[]).
updateLocOwner(ID,List1,List2) :- player1(ID,_,_,_,[Loc|Tail],[NewPropertyLevel|TailP],_),
                                    List1 is [Loc|Tail], 
                                    retract(locOwnerDetail(Loc, OldPlayer, OldPropertyLevel)),
                                    asserta(locOwnerDetail(Loc, ID, NewPropertyLevel)).
updateLoc :- player1(ID,_,_,_,[Loc|Tail],[NewPropertyLevel|TailP],_),
             player2(ID2,_,_,_,[Loc|Tail2],[NewPropertyLevel2|TailP2],_).
/*updateLocOwner(ID,L,L)
/*player1(ID,_,_,_,[],[],_).
player1(ID,_,_,_,[Loc|Tail],[NewPropertyLevel|TailP],_) :- retract(locOwnerDetail(Loc, OldPlayer, OldPropertyLevel)),
                                                           asserta(locOwnerDetail(Loc, ID, NewPropertyLevel)),
                                                           
player2(ID,_,_,_,[],[],_).
player2(ID,_,_,_,[Loc|Tail],[NewPropertyLevel|TailP],_) */
/*getLocOwner(Loc, '-', '-', []).
getLocOwner(Loc, Player, PropertyLevel) :'-' player1(_,_,_,_,[Loc|R],_),
                                                  
updateLocOwner(Loc, Player, PropertyLevel) :'-' getLocOwner(Loc, Player, PropertyLevel, List1)
                                              retract(locOwnerDetail(Loc, OldPlayer, OldPropertyLevel)),
                                              asserta(locOwnerDetail(Loc, Player, PropertyLevel)), !.*/

biayaAkuisisi(Loc, Price, PropertyLevel):- biayaSewa(Loc, RentPrice, PropertyLevel),
                                           PropertyLevel \= 4,
                                           Price is 0.7 * RentPrice.

checkLocationDetail(Loc) :- Loc == cc,
                            locName(Loc, A),
                            !,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write("Apakah kamu sedang beruntung? ").

checkLocationDetail(Loc) :- Loc == 'JL',
                            locName(Loc, A),
                            !,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write("").
                            
checkLocationDetail(Loc) :- Loc == tx,
                            locName(Loc, A),
                            !,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write("").
                            
checkLocationDetail(Loc) :- Loc == 'FP',
                            locName(Loc, A),
                            !,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write("").

checkLocationDetail(Loc) :- Loc == 'GO',
                            locName('WT',oc, A),
                            !,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write("").

checkLocationDetail(Loc) :- Loc == wt,
                            locName(Loc, A),
                            !,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write("").

checkLocationDetail(Loc) :-  locOwnerDetail(Loc, C, D),
                             C == ('-'),
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

checkLocationDetail(Loc) :-  locOwnerDetail(Loc, C, D),
                             D == 0,
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
                             write('Tingkatan Properti : '), write('Tanah'), nl,
                             write('================================================').

checkLocationDetail(Loc) :-  locOwnerDetail(Loc, C, D),
                             D == 1,
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
                             write('Tingkatan Properti : '), write('Bangunan 1'), nl,
                             write('================================================').

checkLocationDetail(Loc) :-  locOwnerDetail(Loc, C, D),
                             D == 2,
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
                             write('Tingkatan Properti : '), write('Bangunan 2'), nl,
                             write('================================================').

checkLocationDetail(Loc) :-  locOwnerDetail(Loc, C, D),
                             biayaSewa(Loc, RentPrice, D),
                             biayaAkuisisi(Loc, Price, D),
                             C \= ('-'),
                             D == 3,
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
                             write('Tingkatan Properti : '), write('Bangunan 3'), nl,
                             write('================================================').

checkLocationDetail(Loc) :-  locOwnerDetail(Loc, C, D),
                             biayaSewa(Loc, RentPrice, D),
                             C \= ('-'),
                             D == 4,
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
                             write('Biaya Akuisisi     : '), write('-'), nl, 
                             write('Tingkatan Properti : '), write('Landmark'), nl,
                             write('================================================').