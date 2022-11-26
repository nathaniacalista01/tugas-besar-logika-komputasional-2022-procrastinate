:- include('pemain.pl').
# :- include('properti.pl').
:- dynamic(locOwnerDetail/3).

/* locOwnerDetail(Loc, Player(Owner), PropertyLevel) */

/* Nama Lokasi'-'Lokasi */
locName(a1, 'Beijing').
locName(a3, 'Oriental Avenue').
locName(cc, 'Chance Card').
locName(b1, 'Taipei').
locName(b2, 'New Delhi').
locName(b3, 'Seoul').
locName(jl, 'Jail').
locName(c1, 'Kairo').
locName(c2, 'Tokyo').
locName(c3, 'Sydney').
locName(tx, 'Tax').
locName(d1, 'Singapore').
locName(d2, 'Hong Kong').
locName(d3, 'Sao Paulo').
locName(fp, 'Freeport').
locName(e1, 'Prague').
locName(e2, 'Bucharest').
locName(e3, 'Berlin').
locName(f1, 'Moscow').
locName(f2, 'Geneva').
locName(f3, 'Rome').
locName(g1, 'Amsterdam').
locName(g2, 'London').
locName(g3, 'Paris').
locName(h1, 'Washington DC').
locName(h2, 'Jakarta').
locName(go, 'GO').
locName(gc, 'Game Center').
locName(wt, 'World Tour').
locDesc(a1, 'Ibu Kota China').
locDesc(a3, 'Ibu Kota Avenue').
locDesc(b1, 'Ibu Kota Taiwan').
locDesc(b2, 'Ibu Kota India').
locDesc(b3, 'Ibu Kota Korea').
locDesc(c1, 'Ibu Kota Mesir').
locDesc(c2, 'Ibu Kota Jepang').
locDesc(c3, 'Ibu Kota Australia').
locDesc(d1, 'Ibu Kota Singapura').
locDesc(d2, 'Ibu Kota Hong Kong').
locDesc(d3, 'Ibu Kota Brazil').
locDesc(e1, 'Ibu Kota Czech Republic').
locDesc(e2, 'Ibu Kota Rumania').
locDesc(e3, 'Ibu Kota Jerman').
locDesc(f1, 'Ibu Kota Rusia').
locDesc(f2, 'Ibu Kota Swiss').
locDesc(f3, 'Ibu Kota Italia').
locDesc(g1, 'Ibu Kota Belanda').
locDesc(g2, 'Ibu Kota Inggris').
locDesc(g3, 'Ibu Kota Prancis').
locDesc(h1, 'Ibu Kota Amerika Serikat').
locDesc(h2, 'Ibu Kota Indonesia').
locDesc(go, 'Start').
/* Inisialisasi locOwnerDetail */
locOwnerDetail(a1, '-', '-').
locOwnerDetail(a3, '-', '-').
locOwnerDetail(b1, '-', '-').
locOwnerDetail(b2, '-', '-').
locOwnerDetail(b3, '-', '-').
locOwnerDetail(c1, '-', '-').
locOwnerDetail(c2, '-', '-').
locOwnerDetail(c3, '-', '-').
locOwnerDetail(d1, '-', '-').
locOwnerDetail(d2, '-', '-').
locOwnerDetail(d3, '-', '-').
locOwnerDetail(e1, '-', '-').
locOwnerDetail(e2, '-', '-').
locOwnerDetail(e3, '-', '-').
locOwnerDetail(f1, '-', '-').
locOwnerDetail(f2, '-', '-').
locOwnerDetail(f3, '-', '-').
locOwnerDetail(g1, '-', '-').
locOwnerDetail(g2, '-', '-').
locOwnerDetail(g3, '-', '-').
locOwnerDetail(h1, '-', '-').
locOwnerDetail(h2, '-', '-').
/* updating loc owner */
updateLocOwner('-',[],[]).
updateLocOwner(ID,List1,List2) :- player1(ID,_,_,_,[Loc|Tail],[NewPropertyLevel|TailP],_),
                                    List1 =:= [Loc|Tail], 
                                    retract(locOwnerDetail(Loc, OldPlayer, OldPropertyLevel)),
                                    asserta(locOwnerDetail(Loc, ID, NewPropertyLevel)).
updateLoc :- player1(ID,_,_,_,[Loc|Tail],[NewPropertyLevel|TailP],_),
             player2(ID2,_,_,_,[Loc2|Tail2],[NewPropertyLevel2|TailP2],_).
            
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

checkLocationDetail(Loc) :- Loc == jl,
                            locName(Loc, A),
                            !,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write("").
                            
checkLocationDetail(Loc) :- Loc == tx,
                            locName(Loc, A),
                            !,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write("").
                            
checkLocationDetail(Loc) :- Loc == fp,
                            locName(Loc, A),
                            !,
                            write('Nama Lokasi         : '), write(A), nl,
                            write('Deskripsi Lokasi    : '), write("").

checkLocationDetail(Loc) :- Loc == go,
                            locName(Loc, A),
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