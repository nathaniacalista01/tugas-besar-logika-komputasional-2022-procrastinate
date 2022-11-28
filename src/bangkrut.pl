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
    (displayKekayaan(PlayerID), write('Biaya Tanggungan: '), write(BiayaTanggungan), nl, tidakSanggupBayar(PlayerID,BiayaTanggungan)).

tidakSanggupBayar(PlayerID,BiayaTanggungan):- asetPlayer(PlayerID,Asset),
                                                (Asset >= BiayaTanggungan,
                                                    write('Wah, uangmu kurang! Apakah kamu ingin tetap melanjutkan?'),nl,read(Answer),
                                                    (Answer == 'yes',writeLoc(PlayerID),write('Properti mana yang ingin kamu jual? (masukkan nomor yang valid)'), nl, read(Answer2),
                                                        sellPropertyN(PlayerID,Answer2,Price), updateMoneyBangkrut(PlayerID,Price),
                                                        uangPlayer(PlayerID,Uang), 
                                                            (Uang >= BiayaTanggungan, write('Horee, kamu sudah bisa bayar uang tanggunganmu'),updateMoneyFinished(PlayerID,BiayaTanggungan),nl; 
                                                            Uang < BiayaTanggungan, tidakSanggupBayar(PlayerID,BiayaTanggungan));
                                                    Answer == 'no', write('Sayang sekali, kamu cepat menyerah, selamat tinggal :(('), quit);
                                                Asset < BiayaTanggungan, write('Sayang sekali, semua asset kamu tidak cukup untuk membayar denda ini'),!,
                                                retract(start(_Z)),asserta(start(0))).

updateMoneyBangkrut(PlayerID,Price) :- (PlayerID == 'A', player1(_,_,Money1,_),NewMoney is Money1 + Price,updateMoney1(NewMoney);
                                        PlayerID == 'V',player2(_,_,Money2,_), NewMoney is Money2 + Price, updateMoney2(NewMoney)).

updateMoneyFinished(PlayerID,BiayaTanggungan) :- (PlayerID == 'A', player1(_,_,Money1,_),NewMoney is Money1 - BiayaTanggungan, updateMoney1(NewMoney);
                                                    PlayerID == 'V', player2(_,_,Money2,_),NewMoney is Money2 - BiayaTanggungan, updateMoney2(NewMoney)).
pembayaran(PlayerID, BiayaTanggungan) :-
    uangPlayer(PlayerID, Saldo), UangBaru is Saldo - BiayaTanggungan,
    ((PlayerID == 'A') -> (updateMoney1(UangBaru)) ; (updateMoney2(UangBaru))),
    write('Uang mu telah terpotong menjadi: '), write(UangBaru), nl.
