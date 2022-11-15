/* Mekanisme Penjara */
/* Seseorang masuk penjara jika
    1. Mendapat double 3x berturut-turut
    2. Mendapat kartu 'Go to Jail' */
/* Seseorang keluar penjara jika
    1. Apa bila terdapat dadu yang double tiga kali giliran
    2. Apabila pemain sudah melempar dadu sebanyak tiga kali
    3. Apabila pemain memiliki kartu 'Get Out of Jail Free'
    4. Apabila pemain membayar uang sebesar X */

/* penjara(PlayerID, Turn) */
:- dynamic(penjara/2).

hargaKeluarPenjara(1000).

penjara(PlayerID, Turn) :-
    write('================================================================================================'), nl,
    write('Selamat Datang di Keimusho! Berikut adalah beberapa opsi pilihan yang dapat kamu ambil!'), nl,
    write('================================================================================================'), nl,
    write('1. Kamu harus menunggu sebanyak '), write(Turn), write(' turn lagi!'),  nl,
    write('2. Kamu ada kartu keluar penjara? Ketik "out" untuk keluar sekarang!'),  nl,
    write('3. Mau keluar tapi gak ada kartu? Ketik "bayar" untuk membayar'), nl,
    write('   bayaran seharga $'), hargaKeluarPenjara(X), write(X), write(' untuk keluar sekarang.'), nl,
    write('4. Ketik "throwDice." untuk melempar dadu lagi!'), nl,
    write('================================================================================================'), nl,
    read(Pilihan),
    (Pilihan == 'out' -> askIfWantToUseCard(PlayerID);
    Pilihan == 'bayar' -> bayarKeluarPenjara(PlayerID);
    nl, nl,
    write('Hey! Ketik pilihan yang bener dong (out/bayar/lempar) :"('), 
    nl, nl, 
    penjara(PlayerID, _)).
    
askIfWantToUseCard :-
    write('Apakah kamu ingin menggunakan kartu "Get Out of Jail Free"?'), nl,
    read(Answer),
    (Answer == 'yes' -> useCard;
    Answer == 'no' -> (write('Sayang sekali, kamu harus membayar dulu :('), bayarDulu);
    write('Input tidak valid >:( !, jawab hanya (yes/no)'), nl, askIfWantToUseCard).

bayarKeluarPenjara(PlayerID) :-
    hargaKeluarPenjara(hargaOut),
    (sanggupBayar(PlayerID, hargaOut) -> 
    HargaMinus is hargaOut * (-1),
    updateSaldo(PlayerID, HargaMinus);
    write('Kamu gak punya uang! jadi kamu tunggu giliran lagi aja ya...')
    ), penjara(PlayerID).

insertPenjara(Player) :-
    asserta(penjara(Player, 0)).

deletePenjara(Player) :-
    retract(penjara(Player, _)).

inJail :-
    player(PlayerID, Loc, _, _),
    Loc == jl.