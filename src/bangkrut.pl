/* Mekanisme bangkrut
    1. Apabila (uang yang dipegang + total aset) yang kurang dari biaya denda atau sewa.
    2. Jika uang yang dipegang pemain tidak cukup, tetapi memiliki kekayaan properti yang bisa dijual (dan cukup untuk melunasi hutang)
    Hasil penjualan properti adalah 80% dari harga beli. */
    /* Note: Harus ada deteksi bangkrut dalam throwDice */

cekbangkrut(Player, BiayaSewa) :-
    uang(Player, Uang),
    aset(Player, Aset),
    TotalAset is Uang + Aset,
    TotalAset < BiayaSewa,
    write('Uang yang dipegang: '),
    write(Uang), nl,
    write('Total kekayaan properti: ')
    write(Aset), nl,
    write('Total kekayaan: ')
    write(Uang), write(' + '), write(Aset), write(' = '), write(TotalAset), nl,
    write('Biaya sewa: ')
    write(BiayaSewa), nl,
    write('Wah, uangmu kurang! Apakah kamu ingin tetap melanjutkan?'), nl, lanjut.

lanjut :-
    read(Answer),
    (Answer == 'yes' -> lanjut(y);
    Answer == 'no' -> (write('Sayang cepat sekali menyerah, selamat tinggal :)'), halt);
    write('Input tidak valid >:( !, jawab hanya (yes/no)'), nl,
    lanjut).

lanjut(y) :-
    listProperti(Player, ListProperti),
    write('Properti mana yang ingin dijual?'), 
    read(Answer), 
    jualProperti(Player, ListProperti, Answer), 
    /* Update uang sekarang, cekbangkrut lagi*/
    nl,