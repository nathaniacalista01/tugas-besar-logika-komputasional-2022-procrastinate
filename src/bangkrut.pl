/* Mekanisme bangkrut
    1. Apabila (uang yang dipegang + total aset) yang kurang dari biaya denda atau sewa.
    2. Jika uang yang dipegang pemain tidak cukup, tetapi memiliki kekayaan properti yang bisa dijual (dan cukup untuk melunasi hutang)
    Hasil penjualan properti adalah 80% dari harga beli. */
    /* Note: Harus ada deteksi bangkrut dalam throwDice */

:- dynamic(uangBelumCukup/1).

sanggupBayar(PlayerID, BiayaTanggungan) :-
    
    uangPlayer(PlayerID, TotalUang), 
    (TotalUang >= BiayaTanggungan ->
    (uangBelumCukup(PlayerID) -> retract(uangBelumCukup(PlayerID)); true, !);
    asserta(uangBelumCukup(PlayerID)), false).

displayKekayaan(PlayerID) :-
    uangPlayer(PlayerID, Saldo), countProperty(PlayerID, TotalProperty), asetPlayer(PlayerID, AsetA),
    write('Uang yang dipegang: '), write(Saldo), nl,
    write('Total kekayaan properti: '), write(TotalProperty), nl,
    write('Total kekayaan: '), write(Saldo), write(' + '), write(TotalProperty), write(' = '), write(AsetA), nl.

prosesBayar(PlayerID, BiayaTanggungan) :-
    sanggupBayar(PlayerID, BiayaTanggungan) -> (pembayaran(PlayerID, BiayaTanggungan));
    (displayKekayaan(PlayerID), write('Biaya Tanggungan: '), write(BiayaTanggungan), nl, uangHabis).

uangHabis :-
    write('Wah, uangmu kurang! Apakah kamu ingin tetap melanjutkan?'), nl, read(Answer),
    (Answer == 'yes' -> hampirBangkrut;
    Answer == 'no' -> (write('Sayang cepat sekali menyerah, selamat tinggal :)'), halt);
    write('Input tidak valid >:( !, jawab hanya (yes./no.)'), nl, lanjut).

hampirBangkrut :-
    uangBelumCukup(PlayerID),
    writeLoc(PlayerID),
    /*listProperti(PlayerID, ListProperti),*/
    write('Properti mana yang ingin dijual? (Isi dengan kode Property dalam huruf kecil)'), 
    read(Answer), 

    /*jualProperti(PlayerID, ListProperti, Answer),*/
    (
        prosesBayar(PlayerID, BiayaTanggungan) -> (write('Uangmu sudah cukup untuk melunasi hutang, selamat bermain kembali :)'),
        retract(uangBelumCukup(PlayerID))) ; (hampirBangkrut)
    ).

pembayaran(PlayerID, BiayaTanggungan) :-
    uangPlayer(PlayerID, Saldo), UangBaru is Saldo - BiayaTanggungan,
    ((PlayerID == 'A') -> (updateMoney1(UangBaru)) ; (updateMoney2(UangBaru))),
    write('Uang mu telah terpotong menjadi: '), write(UangBaru).
