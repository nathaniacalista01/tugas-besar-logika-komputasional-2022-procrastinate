:- include('location.pl').
:- include('pemain.pl').

/* propertyPrice(Loc, Price, PropertyLevel). */
/* 0 == land
   1 == bangunan tingkat 1 
   2 == bangungan tingkat 2
   3 == bangunan tingkat 3
   4 == landmark */

propertyColor(a1, "light green").
propertyColor(a3, "light green").
propertyColor(b1, "green").
propertyColor(b2, "green").
propertyColor(b3, "green").
propertyColor(c1, "light blue").
propertyColor(c2, "light blue").
propertyColor(c3, "light blue").
propertyColor(d1, "blue").
propertyColor(d2, "blue").
propertyColor(d3, "blue").
propertyColor(e1, "magenta").
propertyColor(e2, "magenta").
propertyColor(e3, "magenta").
propertyColor(f1, "purple").
propertyColor(f2, "purple").
propertyColor(f3, "purple").
propertyColor(g1, "orange").
propertyColor(g2, "orange").
propertyColor(g3, "orange").
propertyColor(h1, "red").
propertyColor(h2, "red").

propertyPrice(a1, 200, 0).
propertyPrice(a3, 210, 0).
propertyPrice(b1, 220, 0).
propertyPrice(b2, 230, 0).
propertyPrice(b3, 240, 0).
propertyPrice(c1, 250, 0).
propertyPrice(c2, 260, 0).
propertyPrice(c3, 270, 0).
propertyPrice(d1, 280, 0).
propertyPrice(d2, 290, 0).
propertyPrice(d3, 300, 0).
propertyPrice(e1, 310, 0).
propertyPrice(e2, 320, 0).
propertyPrice(e3, 330, 0).
propertyPrice(f1, 340, 0).
propertyPrice(f2, 350, 0).
propertyPrice(f3, 360, 0).
propertyPrice(g1, 370, 0).
propertyPrice(g2, 380, 0).
propertyPrice(g3, 390, 0).
propertyPrice(h1, 400, 0).
propertyPrice(h2, 410, 0).

propertyPrice(a1, 1000, 1).
propertyPrice(a3, 1010, 1).
propertyPrice(b1, 1020, 1).
propertyPrice(b2, 1030, 1).
propertyPrice(b3, 1040, 1).
propertyPrice(c1, 1050, 1).
propertyPrice(c2, 1060, 1).
propertyPrice(c3, 1070, 1).
propertyPrice(d1, 1080, 1).
propertyPrice(d2, 1090, 1).
propertyPrice(d3, 1100, 1).
propertyPrice(e1, 1110, 1).
propertyPrice(e2, 1120, 1).
propertyPrice(e3, 1130, 1).
propertyPrice(f1, 1140, 1).
propertyPrice(f2, 1150, 1).
propertyPrice(f3, 1160, 1).
propertyPrice(g1, 1170, 1).
propertyPrice(g2, 1180, 1).
propertyPrice(g3, 1190, 1).
propertyPrice(h1, 1200, 1).
propertyPrice(h2, 1210, 1).

propertyPrice(a1, 2000, 2).
propertyPrice(a3, 2010, 2).
propertyPrice(b1, 2020, 2).
propertyPrice(b2, 2030, 2).
propertyPrice(b3, 2040, 2).
propertyPrice(c1, 2050, 2).
propertyPrice(c2, 2060, 2).
propertyPrice(c3, 2070, 2).
propertyPrice(d1, 2080, 2).
propertyPrice(d2, 2090, 2).
propertyPrice(d3, 2100, 2).
propertyPrice(e1, 2110, 2).
propertyPrice(e2, 2120, 2).
propertyPrice(e3, 2130, 2).
propertyPrice(f1, 2140, 2).
propertyPrice(f2, 2150, 2).
propertyPrice(f3, 2160, 2).
propertyPrice(g1, 2170, 2).
propertyPrice(g2, 2180, 2).
propertyPrice(g3, 2190, 2).
propertyPrice(h1, 2200, 2).
propertyPrice(h2, 2210, 2).

propertyPrice(a1, 3000, 3).
propertyPrice(a3, 3010, 3).
propertyPrice(b1, 3020, 3).
propertyPrice(b2, 3030, 3).
propertyPrice(b3, 3040, 3).
propertyPrice(c1, 3050, 3).
propertyPrice(c2, 3060, 3).
propertyPrice(c3, 3070, 3).
propertyPrice(d1, 3080, 3).
propertyPrice(d2, 3090, 3).
propertyPrice(d3, 3100, 3).
propertyPrice(e1, 3110, 3).
propertyPrice(e2, 3120, 3).
propertyPrice(e3, 3130, 3).
propertyPrice(f1, 3140, 3).
propertyPrice(f2, 3150, 3).
propertyPrice(f3, 3160, 3).
propertyPrice(g1, 3170, 3).
propertyPrice(g2, 3180, 3).
propertyPrice(g3, 3190, 3).
propertyPrice(h1, 3200, 3).
propertyPrice(h2, 3210, 3).

propertyPrice(a1, 4000, 4).
propertyPrice(a3, 4010, 4).
propertyPrice(b1, 4020, 4).
propertyPrice(b2, 4030, 4).
propertyPrice(b3, 4040, 4).
propertyPrice(c1, 4050, 4).
propertyPrice(c2, 4060, 4).
propertyPrice(c3, 4070, 4).
propertyPrice(d1, 4080, 4).
propertyPrice(d2, 4090, 4).
propertyPrice(d3, 4100, 4).
propertyPrice(e1, 4110, 4).
propertyPrice(e2, 4120, 4).
propertyPrice(e3, 4130, 4).
propertyPrice(f1, 4140, 4).
propertyPrice(f2, 4150, 4).
propertyPrice(f3, 4160, 4).
propertyPrice(g1, 4170, 4).
propertyPrice(g2, 4180, 4).
propertyPrice(g3, 4190, 4).
propertyPrice(h1, 4200, 4).
propertyPrice(h2, 4210, 4).

biayaSewa(Loc, PropertyLevel, Price) :- PropertyLevel == 0,
                                        !,
                                        propertyPrice(Loc, Priceproperty, PropertyLevel),
                                        Price is 0.1 * Priceproperty.
biayaSewa(Loc, PropertyLevel, Price) :- PropertyLevel == 1,
                                        !,
                                        propertyPrice(Loc, Priceproperty, PropertyLevel),
                                        Price is 0.12 * Priceproperty. 
biayaSewa(Loc, PropertyLevel, Price) :- PropertyLevel == 2,
                                        !,
                                        propertyPrice(Loc, Priceproperty, PropertyLevel),
                                        Price is 0.175 * Priceproperty.
biayaSewa(Loc, PropertyLevel, Price) :- PropertyLevel == 3,
                                        !,
                                        propertyPrice(Loc, Priceproperty, PropertyLevel),
                                        Price is 0.2 * Priceproperty.
biayaSewa(Loc, PropertyLevel, Price) :- PropertyLevel == 4,
                                        !,
                                        propertyPrice(Loc, Priceproperty, PropertyLevel),
                                        Price is 0.3 * Priceproperty.
                                          

checkPropertyDetail(Loc) :- locName(Loc, A),
                            locDesc(Loc, B),
                            propertyPrice(Loc, Price0, 0),
                            propertyPrice(Loc, Price1, 1),
                            propertyPrice(Loc, Price2, 2),
                            propertyPrice(Loc, Price3, 3),
                            propertyPrice(Loc, Price4, 4),
                            biayaSewa(Loc, 0, RentPrice0),
                            biayaSewa(Loc, 1, RentPrice1),
                            biayaSewa(Loc, 2, RentPrice2),
                            biayaSewa(Loc, 3, RentPrice3),
                            biayaSewa(Loc, 4, RentPrice4),
                            !,
                            write('================================================'), nl,
                            write('              Informasi Properti '), nl, 
                            write('================================================'), nl,
                            write('Nama Properti         : '), write(A), nl, 
                            write('Deskripsi Properti    : '), write(B), nl, nl, 
                            write('Harga Tanah           : '), write(Price0), nl,
                            write('Harga Bangunan 1      : '), write(Price1), nl,
                            write('Harga Bangunan 2      : '), write(Price2), nl,
                            write('Harga Bangunan 3      : '), write(Price3), nl,
                            write('Harga Landmark        : '), write(Price4), nl, nl,
                            write('Biaya Sewa Tanah      : '), write(RentPrice0), nl,
                            write('Biaya Sewa Bangunan 1 : '), write(RentPrice1), nl,
                            write('Biaya Sewa Bangunan 2 : '), write(RentPrice2), nl,
                            write('Biaya Sewa Bangunan 3 : '), write(RentPrice3), nl,
                            write('Biaya Sewa Landmark   : '), write(RentPrice4), nl, 
                            write('================================================').