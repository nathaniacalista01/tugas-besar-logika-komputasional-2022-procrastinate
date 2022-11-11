/* Mekanisme bangkrut
    1. Apabila (uang yang dipegang + total aset) yang kurang dari biaya denda atau sewa.
    2. Jika uang yang dipegang pemain tidak cukup, tetapi memiliki kekayaan properti yang bisa dijual (dan cukup untuk melunasi hutang)
    Hasil penjualan properti adalah 80% dari harga beli. */
:- dynamic(bangkrut/1).

cekbangkrut(X) :-
    uang(X, Uang),
    aset(X, Aset),
    TotalAset is Uang + Aset,
    TotalAset < 0,
    asserta(bangkrut(X)),
    write('Anda bangkrut!'), nl.
/* Note: Harus ada deteksi bangkrut dalam throwDice */