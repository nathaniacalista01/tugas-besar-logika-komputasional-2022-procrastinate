/* Mekanisme bangkrut
    1. Apabila (uang yang dipegang + total aset) yang kurang dari biaya denda atau sewa.
    2. Jika uang yang dipegang pemain tidak cukup, tetapi memiliki kekayaan properti yang bisa dijual (dan cukup untuk melunasi hutang)
    Hasil penjualan properti adalah 80% dari harga beli. */
    /* Note: Harus ada deteksi bangkrut dalam throwDice */

:- dynamic(uangBelumCukup/1).

sanggupBayar(Player, BiayaTanggungan) :-
    saldo(Player, Saldo),
    aset(Player, Aset),
    TotalAset is Saldo + Aset,
    (TotalAset < BiayaTanggungan ->
    asserta(uangBelumCukup(Player) ; 
    uangBelumCukup(Player), retract(uangBelumCukup(Player)))).

displayKekayaan :-
    uang(Player, Uang),
    aset(Player, Aset),
    TotalAset is Uang + Aset,
    write('Uang yang dipegang: '),
    write(Uang), nl,
    write('Total kekayaan properti: '),
    write(Aset), nl,
    write('Total kekayaan: '),
    write(Uang), write(' + '), write(Aset), write(' = '), write(TotalAset), nl.

prosesUangTidakCukup(Player, BiayaTanggungan) :-
    sanggupBayar(Player, BiayaTanggungan),
    displayKekayaan,
    write('Biaya Tanggungan: '),
    write(BiayaTanggungan), nl,
    uangHabis.

uangHabis :-
    write('Wah, uangmu kurang! Apakah kamu ingin tetap melanjutkan?'), nl,
    read(Answer),
    (Answer == 'yes' -> uangHabis(y);
    Answer == 'no' -> (write('Sayang cepat sekali menyerah, selamat tinggal :)'), halt);
    write('Input tidak valid >:( !, jawab hanya (yes/no)'), nl, lanjut).

uangHabis(y) :-
    uangBelumCukup(Player),
    listProperti(Player, ListProperti),
    write('Properti mana yang ingin dijual?'), 
    read(Answer), 
    jualProperti(Player, ListProperti, Answer), 
    /* Update uang sekarang, cekbangkrut lagi*/
    (
        uangBelumCukup(Player, BiayaTanggungan) -> uangHabis(y) ;
        (write('Uangmu sudah cukup untuk melunasi hutang, selamat bermain kembali :)'),
        retract(uangBelumCukup(Player)))
    ),
    nl.

