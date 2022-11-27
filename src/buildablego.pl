:- dynamic(buildAccess/1).

goBuildProperti() :-
    checkInGo(), askIfWantToBuild().

/* CheckInGo selalu dijalankan setelah melempar dadu */
checkInGo() :-
    /* Gain Access Build Go*/
    player1(Id,Loc,Money,Property,List1,List2),
    tile(_,_,Loc,LocNumber),
    /* Cek Lokasi Player apakah ada di Go */
    LocNumber =:= 1,
    /* Memberikan player access untuk build properti */
    asserta(buildAccess(1)),!.

/* Tanyakan apakah ingin membangun properti */
askIfWantToBuild() :-
    /* Cek apakah player berada di Go */
    buildAccess(1),
    write('Apakah anda ingin membangun properti? (y/n)'),nl,
    read(Answer),
    /* Jika ya, maka tampilkan list properti yang bisa dibangun */
    /* Tampilkan list properti yang bisa dibangun */
    (Answer == 'yes' -> (
        write('List properti yang bisa dibangun : '),nl,
        /* printListPropertiPlayer yg bukan landmark */,
        /* commandUpgradeProperti */,
        afterBuild()
    );

    ((Answer == 'no' -> (
        write('Baiklah jika anda tidak ingin membangun properti :)'),nl,
        retract(buildAccess(1)),!
    ); 
        write('Input tidak valid >:( !, jawab hanya (yes/no)',nl)))),!.

afterBuild() :-
    retract(buildAccess(_)),!.