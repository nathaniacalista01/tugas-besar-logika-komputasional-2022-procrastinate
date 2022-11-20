:- dynamic(checkLocationDetail/1).
:- dynamic(a1/1).
:- dynamic(a2/1).


/* Nama Lokasi-Lokasi */
locName(a1, 'Beijing').
locName(a2, 'Hanoi').
locName(a3, 'Oriental Avenue').
locName(cc, 'Chance Card').
locName(b1, 'Taipei').
locName(b2, 'New Delhi').
locName(b3, 'Seoul').
locName(jl, 'Jail').
locName(c1, 'Bali').
locName(c2, 'Tokyo').
locName(c3, 'Sydney').
locName(tx, 'Tax').
locName(d1, 'Singapore').
locName(d2, 'Hawaii').
locName(d3, 'Sao Paulo').
locName(fp, 'Freeport').
locName(e1, 'Prague').
locName(e2, 'Bintan').
locName(e3, 'Berlin').
locName(f1, 'Moscow').
locName(f2, 'Geneva').
locName(f3, 'Rome').
locName(g1, 'Kota Kinabalu').
locName(g2, 'London').
locName(g3, 'Paris').
locName(h1, 'New York').
locName(h2, 'Jakarta').
locName(go, 'GO').

locDesc(a1, 'Ibu Kota China').
locDesc(a2, 'Ibu Kota Vietnam').
locDesc(a3, '').
locDesc(cc, '').
locDesc(b1, 'Ibu Kota Taiwan').
locDesc(b2, 'Ibu Kota India').
locDesc(b3, 'Ibu Kota Korea').
locDesc(jl, '').
locDesc(c1, 'Ibu Kota').
locDesc(c2, 'Ibu Kota Jepang').
locDesc(c3, 'Ibu Kota Australia').
locDesc(tx, 'Tax').
locDesc(d1, 'Ibu Kota Singapura').
locDesc(d2, 'Ibu Kota').
locDesc(d3, 'Ibu Kota Brazil').
locDesc(fp, 'Freeport').
locDesc(e1, 'Ibu Kota Czech Republic').
locDesc(e2, 'Ibu Kota ').
locDesc(e3, 'Ibu Kota Jerman').
locDesc(f1, 'Ibu Kota Rusia').
locDesc(f2, 'Ibu Kota Swiss').
locDesc(f3, 'Ibu Kota Italia').
locDesc(g1, 'Ibu Kota').
locDesc(g2, 'Ibu Kota Inggris').
locDesc(g3, 'Ibu Kota Prancis').
locDesc(h1, 'Ibu Kota ').
locDesc(h2, 'Ibu Kota Indonesia').
locDesc(go, 'Start').

/*locOwner(nama, ).

locPrice(nama,).

locAcc(nama,).

locLevel(nama,).*/

checkLocationDetail(Loc) :-  locName(Loc, A),
                             locDesc(Loc, B),
                             write('Nama Lokasi: '), write(A), nl,   
                             write('Deskripsi Lokasi   : '), write(B), nl.
/*                            write('Kepemilikan        : '), write(locOwner(loc,Kepemilikan)), nl,
                            write('Biaya Sewa Saat Ini: '), write(locPrice(loc,Price)), nl, 
                            write('Biaya Akuisisi     : '), write(locAcc(loc,Acquire)) nl, 
                            write('Tingkatan Properti : '), write(locLevel(loc,Level)), nl.*/ 