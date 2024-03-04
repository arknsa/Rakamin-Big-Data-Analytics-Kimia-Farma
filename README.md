# **Project-Based Virtual Intern : Big Data Analytics PT. KIMIA FARMA, TBK x Rakamin Academy!**
Code : BigQuery -> [] ()
Data Visualization : Google Looker Studio -> []()
Analytics Dataset : Spreadsheet -> []()
<br>

---

## 📂 **Introduction**
Big Data Analytics Kimia Farma merupakan project-based virtual internship experience yang difasilitasi oleh [Rakamin Academy](). Pada project ini saya berperan sebagai Big Data Analytics yang diminta untuk menganalisis dan membuat laporan penjualan perusahaan menggunakan data-data yang telah disediakan. Dari project ini, saya juga banyak belajar tentang data warehouse, datalake, dan datamart. Aplikasi penggunaan SQL di BigQuery serta visualisasi di Google Looker Studio. <br>
<br>

**Objectives**
- Membuat design datamart untuk dilakukan analisa.
- Membuat Dashboard Performance Analytics Kimia Farma Business Year 2020-2023.

- **Dataset** <br>
Dataset yang diberikan terdiri dari tabel-tabel berikut :
- kf_final_transaction
- kf_inventory
- kf_kantor_cabang
- kf_product
- <br>

## 📂 **Design Datamart**
### Tabel Aggregate
Tabel agregat adalah tabel yang dibuat dengan mengumpulkan dan menghitung data dari tabel basis. Tabel aggregat ini berisi informasi yang lebih ringkas dan digunakan untuk menganalisis data lebih cepat dan efisien. Hasil tabel ini akan digunakan untuk sumber pembuatan dashboard laporan penjualan.

<details>
  <summary> Klik untuk melihat Query </summary>
    <br>
    
```sql
CREATE TABLE agg_table (
SELECT
    tanggal,
    MONTHNAME(tanggal) AS bulan,        -- kolom nama bulan
    id_invoice,
    cabang_sales AS lokasi_cabang,
    nama AS pelanggan,
    nama_barang AS produk,
    lini AS merek,
    jumlah AS jumlah_produk_terjual,
    harga AS harga_satuan,
    (jumlah * harga) AS total_pendapatan  -- kolom baru total pendapatan
FROM base_table
ORDER BY 1, 4, 5, 6, 7, 8, 9, 10
);
```
    
<br>
</details>
<br>

<p align="center">
    <kbd> <img width="750" alt="sample aggregat" src="https://user-images.githubusercontent.com/115857221/222876809-62000814-75b6-4f82-b6b7-05d00e618315.png"> </kbd> <br>
    Gambar 2 — Sampel Hasil Pembuatan Tabel Aggregat
</p>
<br>

---

## 📂 **Data Visualization**

[Lihat pada halaman Looker Data Studio](https://lookerstudio.google.com/reporting/3c67b292-3be2-484d-bc29-27bd0b4015fd).

<p align="center">
    <kbd> <img width="1000" alt="Kimia_Farma_page-0001" src="https://user-images.githubusercontent.com/115857221/222877035-53371a89-081d-4ec5-9e72-65b0176a96fd.jpg"> </kbd> <br>
    Gambar 3 — Sales Report Dashboard PT. Kimia Farma
</p>
<br>

---

