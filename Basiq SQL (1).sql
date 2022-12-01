--Import File CSV--
--Sumber Kelas Skill Academy--
--Learn How to Use SELECT, FROM, LIMIT, WHERE--
SELECT * FROM DataHR 					--Mengambil semua data pada Tabel DataHR--
SELECT * FROM DataHR LIMIT 5 			--Mengambil 5 Data Pertama--
SELECT Name, Age FROM DataHR 			--Mengambil data pada kolom Name dan Age--

SELECT DISTINCT Status FROM DataHR 		--Menampilkan kategori dari Status--

SELECT * FROM DataHR					--Menampilkan Row Department Human Resources--
WHERE Department = 'Human Resources'	-- Tanda baca '' untuk tipe data text--
--Menampilkan Department selain Human Resources yaitu: Menmbahkan Tanda ! sebelum tanda =

SELECT * FROM DataHR					--Menampilkan data kolom Age dengan umur lebihdari 50--
WHERE Age>50

SELECT * FROM DataHR					--Menampilkan Row Gilbert Z Bloss dan Maryellen H Hartness--
WHERE Name IN ('Gilbert Z Bloss','Maryellen H Hartness')

SELECT * FROM DataHR					--Menampilkan data nama dengan pola D--
WHERE Name LIKE 'D%'
--Huruf D boleh diikuti pola lain, bisa diletakn detengah/depan/belakangProduct
--Dapat Digunakan berkali-kali

--Operator Logika dalam SQL (NOT, AND dan OR) #Menggabungkan 2 karakteristik--
SELECT * FROM DataHR
WHERE Status = 'Divorced' AND Age<30

SELECT * FROM DataHR
WHERE Status = 'Divorced' AND Age<30

SELECT * FROM DataHR
WHERE Not Status='Divorced' AND (Department = 'Sales' or Department = 'Human Resources')

-- data Sumarization and Aggregation 
SELECT * FROM Product
ORDER BY quantity ASC			 --ORDER BY : Mengurutakn data nilai kolom

SELECT * FROM Product
ORDER BY price DESC 			-- Menampilkan 5 data dengan harga termahal
LIMIT 5

SELECT COUNT(ID)				--Menghitung jumlah baris atau data sesuai kondisi
FROM Product

COUNT (DISTINCT Category)			--Banyak data kategori
FROM Product

SELECT
MIN (quantity) AS Min_Quantity, 	--Nilai minimum
MAX (quantity) AS Max_Quantity, 	--Nilai maximum
AVG (quantity) AS Avg_Quantity, 	--Nilai rata-rata
SUM (quantity) AS Sum_Quantity 		--Jumlah semua nilai
FROM Product

-- Mengelompokan data berdasarakan kolom tertentu dengan Group BYProduct
SELECT
category,
COUNT (*) AS n_Product
FROM Product
GROUP BY category
--Dapat Dikombinasikan dengan SUM, MAX, MIN, AVG

--Case (Kondisi)
SELECT
CASE
	WHEN price > 80 THEN 'Very Expensive'
	WHEN price > 20 THEN 'Expensive'
	ELSE 'Cheap'
END AS Keterangan,
COUNT (*) AS n_Product,
SUM (quantity) AS Total_Quantity
FROM Product
GROUP BY Keterangan

--Marge the DataProduct
SELECT *FROM Product
WHERE Category = "Furniture"
UNION ALL							--ALL (Menggabungkan tidak perduli ada yang sama ataupun tidak
SELECT *FROM Product				-- Digunakan jika kolom pada satu tabel dengan tabel yang lain
WHERE Price > 80					--tidak sama
ORDER BY ID

SELECT *FROM Product
WHERE Category = "Office Supplies"
UNION								--Tanpa ALL jika kolom pada tabel berIRISAN
dSELECT *FROM Product				-- Tidak dapat igunakan jika kolom pada satu tabel dengan tabel yang 
WHERE Price < 10					-- lain tidak sama
ORDER BY ID
