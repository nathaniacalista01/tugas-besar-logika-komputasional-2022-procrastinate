/* List kartu pada game tersebut 
    Jenis Kartu                     | Probabilitas  | Deskripsi
    - Kartu Tax                     |       20%     | Pemain akan ditempatkan ke tempat tax terdekat 
    - Kartu Hadiah                  |       20%     | Pemain mendapatkan uang dengan nominal tertentu
    - Kartu Get out from Jail       |       20%     | Pemain mendapatkan kesempatan untuk tidak masuk penjara
    - Kartu Go to Jail              |       20%     | Pemain langsung dimasukkan ke penjara
    - Kartu Go to World Tour        |       15%     | Pemain langsung ditempatkan kepada petak World Tour
    - Kartu Angel Card              |      4,9%     | Bila pemain berada di situasi menuju bangkrut, pemain dapat menggunakan kartu ini untuk selamat
    - Kartu Auto Win                |      0,1%     | Pemain langsung memenangkan permainan, tetapi persentase mendapatkan kartu ini sangat kecil
*/

/* Variabel untuk melihat bahwa pemain sedang berada pada petak CC */
:- dynamic(inCC/1). 


/* Randomizer untuk chance card 
    Menggunakan metode LCG
    X[n+1] = (X[n]*(a) + c) mod m
    a, c, m adalah -> a = 77, c = Money+537, m = 1000
    Nilai Seed atau X0 adalah sebesar (1234 + Money)
    Money adalah banyaknya uang player saat pengambilan chance card
    Banyaknya iterasi yang dilakukan untuk metode LCG adalah nilai round pada pelaksanaan chance card
*/

/* Fakta */
calculateRandomChance(Money, 0, 1234+Money).
/* Bila nilai iterasi sama dengan round, maka rekursif telah selesai dijalankan */

/* Rules */
calculateRandomChance(Money, Round, Result) :- 
                    (calculateRandomChance(Money, NewRound, NewResult), Result is (((NewResult*(Money+56)+Money+537) mod 1000)), Round is NewRound + 1).



/* 
Untuk menyimpan sementara

# If Else
kondisi -> hasil true ; hasil false 

*/