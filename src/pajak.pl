:- inlcude('bangkrut.pl').
/* Mekanisme Perpajakan */
/* Total pajak adalah total aset dikalikan dengan 10%,
   Kalau uang tidak mencukupi untuk membayar pajak, maka akan dilakukan
   proses eksekusi jual properti untuk menambah saldo */

bayarPajak(PlayerID) :-
    uangPlayer(PlayerID, Saldo),
    asetPlayer(PlayerID, TotalAset),
    TotalPajak is TotalAset * 0.1,
    (sanggupBayar(PlayerID, TotalPajak) -> (prosesBayar(PlayerID, TotalPajak)) ; (updateMoney(PlayerID, TotalPajak))),
    nl,
    write('Total pajak yang dibayar adalah '), 
    write(TotalPajak), nl.