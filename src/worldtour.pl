/* Konsep World Tour :
1. Pemain dapat berpindah ke petak mana saja, selain World Tour itu sendiri.
2. Pemain tidak langsung berpindah ketika sampai pada world Tour, tetapi berpindah pada round berikutnya
3. Setelah pemain berpindah menggunakan World Tour mechanism, dianggap bahwa pemain sudah melakukan gerakan. 
Pemain tidak lagi melempar dadu setelah itu.
4. Pemain dikenakan biaya $ 100 untuk melakukan world tour.
5. Pemain yang tidak memiliki uang yang cukup atau memilih untuk tidak menggunakan World Tour, 
maka pemain akan melanjutkan melempar dadu seperti biasa

*/

:- include ('location.pl').

player1('A','WT',300,[]).

/* Mengecek apakah pemain sedang berada di petak WT */
/* Fakta */

/* Rules */
isInWorldTour(PlayerID, Result) :- (PlayerID = 1 , player1(_,P1Loc,_,_,_,_,_), (P1Loc = 'WT', Result is 1; P1Loc \= 'WT', Result is 0)) ; 
                                (PlayerID = 2, player2(_,P2Loc,_,_,_,_,_), (P2Loc = 'WT', Result is 1; P2Loc \= 'WT', Result is 0)),!.

/* Melakukan cek apakah uang pada Player cukup untuk melakukan 
World Tour dan apakah ingin melakukannya */
/* Fakta */
/* Rules */
wantWorldTour(PlayerID, Choice) :- ((PlayerID = 1, player1(_,_,P1Money,_,_,_,_), (P1Money < 100, write('Kamu tidak memiliki uang yang cukup untuk melakukan World Tour!', nl, Choice is 0;
                                                                            P1Money >= 100, write('Apakah kamu ingin melakukan World Tour? 1 untuk Iya, 0 untuk Tidak : '), read(_UserChoice),
                                                                                                (_UserChoice = 1, Choice is 1; _UserChoice \= 1, Choice is 0))));
                                (PlayerID = 2, player2(_,_,P2Money,_,_,_,_), (P2Money < 100, write('Kamu tidak memiliki uang yang cukup untuk melakukan World Tour!', nl, Choice is 0;
                                                                            P2Money >= 100, write('Apakah kamu ingin melakukan World Tour? 1 untuk Iya, 0 untuk Tidak : '), read(_UserChoice),
                                                                                                (_UserChoice = 1, Choice is 1; _UserChoice \= 1, Choice is 0))))),!.

/* Mengecek apakah petak yang diinputkan user adalah petak yang valid */
/* Mengembalikan 1 bila petak tersebut valid, mengembalikan 0 jika tidak */
/* Fakta */
/* Rules */
isLocValid(Loc, Result) :- locName(X,_), X = Loc, Result is 1.

/* Menanyakan ke User, ke petak mana Ia ingin pergi */
/* Loc adalah lokasi akhir yang ingin dituju User */
/* AfterGo mengembalikan 1 bila petak tersebut berada setelah Go (sehingga mendapatkan uang)
    AfterGo mengembalikan 0 bila petak tersebut berada sebelum Go */

/* askUserTravelLocation(Loc, AfterGo). */

/* Melakukan World Tour */
/* Fakta */
/* Rules */

/*
goWorldTour(PlayerID, FinalLoc, MoneyChanges ) :- PlayerID = 1, player1(_,P1Loc,P1Money,_,_,_,_), wantWorldTour(PlayerID, _Choice), 
                                                                ( Choice = 0, MoneyChanges is 0, FinalLoc is P1Loc; 
                                                                    Choice = 1, ).
                                                                    */