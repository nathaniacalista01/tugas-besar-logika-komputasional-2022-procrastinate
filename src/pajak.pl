/* Mekanisme Perpajakan */
/* Total pajak adalah total aset dikalikan dengan 10%,
   Kalau uang tidak mencukupi untuk membayar pajak, maka akan dilakukan
   proses eksekusi jual properti untuk menambah saldo */

bayarPajak(PlayerID) :-
    countProperty(PlayerID, TotalProperti),
    TotalPajak is TotalProperti * 0.1,
    nl, write('Total pajak yang dibayar adalah '), write(TotalPajak), nl,
    prosesBayar(PlayerID, TotalPajak), !.
