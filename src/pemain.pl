/* Player Status */
/* player(PlayerID, Loc, Money, Property) */
:- dynamic(player/4).

player(99999, a1, 0, 0).

updateLoc(PlayerID, NewLoc) :-
    retract(player(PlayerID, _, _, _)),
    assertz(player(PlayerID, NewLoc, _, _)), !.

updateMoney(PlayerID, NewMoney) :-
    retract(player(PlayerID, _, _, _)),
    assertz(player(PlayerID, _, NewMoney, _)), !.

infoPlayer(PlayerID) :-
    write('================================================'), nl,
    write('              Informasi Player ('), write(PlayerID), write(') '), nl,
    write('================================================'), nl,
    write('1. Lokasi                   : '), 
    player(PlayerID, Loc, _, _), write(Loc), nl,
    write('2. Total Uang               : '),
    player(PlayerID, _, Money, _), write(Money), nl,
    write('3. Total Nilai Properti     : '),
    player(PlayerID, _, _, Property), write(Property), nl,
    write('4. Total Aset               : '),
    TotalAsset is Money + Property, write(TotalAsset), nl,
    write('================================================'), nl,
    daftarProperti(PlayerID),
    daftarCard(PlayerID), !.