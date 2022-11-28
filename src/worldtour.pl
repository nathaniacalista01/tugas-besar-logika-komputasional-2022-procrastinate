/* Konsep World Tour :
1. Pemain dapat berpindah ke petak mana saja, selain World Tour itu sendiri.
2. Pemain tidak langsung berpindah ketika sampai pada world Tour, tetapi berpindah pada round berikutnya
3. Setelah pemain berpindah menggunakan World Tour mechanism, dianggap bahwa pemain sudah melakukan gerakan. 
Pemain tidak lagi melempar dadu setelah itu.
4. Pemain dikenakan biaya $ 1000 untuk melakukan world tour.
5. Pemain yang tidak memiliki uang yang cukup atau memilih untuk tidak menggunakan World Tour, 
maka pemain akan melanjutkan melempar dadu seperti biasa

*/

/* Hanya diaktifkan bila ingin mencoba modul ini 
:- include('location.pl').
:- include('board.pl').

player1('A','WT',50,[]).
player2('B','WT',500,[]).
*/

/* Mengecek apakah pemain sedang berada di petak WT */
/* Fakta */

/* Rules */
isInWorldTour(PlayerID, Result) :- ((PlayerID = 1 , player1(_,P1Loc,_,_), (P1Loc = 'WT', Result is 1; P1Loc \= 'WT', Result is 0)) ; 
                                (PlayerID = 2, player2(_,P2Loc,_,_), (P2Loc = 'WT', Result is 1; P2Loc \= 'WT', Result is 0))),!.

/* Melakukan cek apakah uang pada Player cukup untuk melakukan 
World Tour dan apakah ingin melakukannya */
/* Fakta */
/* Rules */
wantWorldTour(PlayerID, Choice) :- ((PlayerID = 1, player1(_,_,P1Money,_), (P1Money < 1000, write('Kamu tidak memiliki uang yang cukup untuk melakukan World Tour!'), nl, Choice is 0;
                                                                            P1Money >= 1000, write('Apakah kamu ingin melakukan World Tour? 1 untuk Iya, 0 untuk Tidak : '), read(_UserChoice),
                                                                                                (_UserChoice = 1, Choice is 1; _UserChoice \= 1, Choice is 0)));
                                (PlayerID = 2, player2(_,_,P2Money,_), (P2Money < 1000, write('Kamu tidak memiliki uang yang cukup untuk melakukan World Tour!'), nl, Choice is 0;
                                                                            P2Money >= 1000, write('Apakah kamu ingin melakukan World Tour? 1 untuk Iya, 0 untuk Tidak : '), read(_UserChoice),
                                                                                                (_UserChoice = 1, Choice is 1; _UserChoice \= 1, Choice is 0)))),!.

/* Mengecek apakah petak yang diinputkan user adalah petak yang valid */
/* Mengembalikan 1 bila petak tersebut valid, mengembalikan 0 jika tidak */
/* Fakta */
/* Rules */
isLocValid(Loc, Result) :- locName(X,_), X = Loc -> Result is 1 ; Result is 0.

/* Menanyakan ke User, ke petak mana Ia ingin pergi */
/* Loc adalah lokasi akhir yang ingin dituju User */
/* AfterGo mengembalikan 1 bila petak tersebut berada setelah Go (sehingga mendapatkan uang)
    AfterGo mengembalikan 0 bila petak tersebut berada sebelum Go */

askUserTravelLocation(Loc, AfterGo, Valid) :-  write('Ke petak mana kamu ingin pergi? (Masukkan inisial saja, e.g. : \'A2\'.)'), nl, write('Input yang tidak valid berarti tidak jadi melakukan World Tour : '),
                                        read(Loc), isLocValid(Loc, Valid), 
                                        (Valid = 0, AfterGo is 0;
                                        Valid = 1, tile(_,_,Loc,Idx), (Idx > 24 , AfterGo is 0 ; Idx < 24, AfterGo is 1; Idx = 24 , AfterGo is -1)), !.

/* Melakukan World Tour */
/* Fakta */
/* Rules */
goWorldTour(PlayerID, FinalLoc, MoneyChanges ) :- asciiWorldTour, PlayerID = 1, player1(_,P1Loc,_,_), wantWorldTour(PlayerID, _Choice), 
                                                                ( _Choice = 0, MoneyChanges is 0, FinalLoc = P1Loc; 
                                                                _Choice = 1, askUserTravelLocation(ChoiceLoc, AfterGo, Valid), 
                                                                    (Valid = 0, FinalLoc = P1Loc, MoneyChanges is 0;
                                                                    Valid = 1, FinalLoc = ChoiceLoc, (AfterGo = 1 , write('Update Pass Go'), nl, MoneyChanges is 1000 ;  AfterGo = 0, MoneyChanges is -1000; AfterGo = -1, MoneyChanges is 0))),!.

goWorldTour(PlayerID, FinalLoc, MoneyChanges ) :- PlayerID = 2, player2(_,P2Loc,_,_), wantWorldTour(PlayerID, _Choice), 
                                                                ( _Choice = 0, MoneyChanges is 0, FinalLoc = P2Loc; 
                                                                _Choice = 1, askUserTravelLocation(ChoiceLoc, AfterGo, Valid),
                                                                    (Valid = 0, FinalLoc = P2Loc, MoneyChanges is 0;
                                                                    Valid = 1, FinalLoc = ChoiceLoc, (AfterGo = 1 , write('Update Pass Go'), nl, MoneyChanges is 1000 ;  AfterGo = 0, MoneyChanges is -1000; AfterGo = -1, MoneyChanges is 0))),!.

/* Ascii untuk World Tour */
asciiWorldTour :- 
        write(' _____         ______                _______   _______   _     _   _______ '), nl,                                                  
        write(' |:  |         |    |               |__   __| |  ___  | | |   | | |  ___  |'), nl,                                             
        write(' |:   `|______|______|______           | |    | |   | | | |   | | | |___| |'), nl,                         
        write(' |:______             |_____|_____     | |    | |   | | | |   | | |     __|'), nl,                   
        write(' |____|-)_,---------,_____________|    | |    | |   | | | |   | | | || |   '), nl,            
        write('            |       |                  | |    | |   | | | |   | | | | | |  '), nl,                   
        write('             |     |                   | |    | |___| | | |___| | | |  | | '), nl,                    
        write('             |____|                    |_|    |_______| |_______| |_|   |_|'), nl, nl.      

                   
                                       