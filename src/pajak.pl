:- inlcude('bangkrut.pl')
/* Mekanisme Perpajakan */
/* Total pajak adalah total aset dikalikan dengan 10%,
   Kalau uang tidak mencukupi untuk membayar pajak, maka akan dilakukan
   proses eksekusi jual properti untuk menambah saldo */

pajak(Player, TotalAset) :-
    TotalPajak is TotalAset * (-1) * 0.1,
    sanggupBayar(Player, TotalPajak) -> uangHabis(y);
    (updateSaldo(Player, TotalPajak),
    write('Total pajak yang harus dibayar adalah '), 
    write(TotalPajak), nl).