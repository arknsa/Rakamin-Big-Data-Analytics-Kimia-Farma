# **Kimia Farma Big Data Analytics Project Based Internship**
SQL Code : BigQuery -> [Lihat Disini](https://github.com/arknsa/Rakamin-Big-Data-Analytics-Kimia-Farma/blob/main/Integrated_Big-Data_Kimia-Farma.sql) <br>
Data Visualization : Google Looker Studio -> [Lihat Disini](https://lookerstudio.google.com/reporting/d0658e1c-3b0f-4330-8eb9-5a4c6efe86d9) <br>
Analytics Dataset : Spreadsheet -> [Lihat Disini](https://docs.google.com/spreadsheets/d/1ZJjGioO-NGQ2hxZkUqzeDdlVdotU801xvUfFmCDZIX0/edit?usp=sharing) <br>
<br>

---

## 📂 **Introduction**
Big Data Analytics Kimia Farma merupakan project-based virtual internship experience yang difasilitasi oleh [Rakamin Academy](https://www.rakamin.com/virtual-internship-experience/kimiafarma-big-data-analytics-virtual-internship-program). Pada project ini saya berperan sebagai Big Data Analytics yang diminta untuk menganalisis dan membuat laporan penjualan perusahaan menggunakan data-data yang telah disediakan. Dari project ini, saya juga banyak belajar tentang data warehouse, datalake, dan datamart. Aplikasi penggunaan SQL di BigQuery serta visualisasi di Google Looker Studio. <br>
<br>

**Objectives**
- Membuat design datamart untuk dilakukan analisa.
- Membuat Dashboard Performance Analytics Kimia Farma Business Tahun 2020-2023.
<br>

**Dataset** <br>
Dataset yang diberikan terdiri dari tabel-tabel berikut :
- kf_final_transaction
- kf_inventory
- kf_kantor_cabang
- kf_product
<br>

## 📂 **Design Datamart**
### Tabel Aggregate
Tabel agregat adalah tabel yang dibuat dengan mengumpulkan dan menghitung data dari tabel basis. Tabel aggregat ini berisi informasi yang lebih ringkas dan digunakan untuk menganalisis data lebih cepat dan efisien. Hasil tabel ini akan digunakan untuk sumber pembuatan dashboard laporan penjualan.

<details>
  <summary> Klik untuk melihat Query </summary>
    <br>
    
```sql
CREATE TABLE `kimia_farma.kf_analytics_data` AS #Membuat table analytics_data pada datased kimia_farma
SELECT #Menggunakan fungsi select untuk memilih tiap kolom dari tabel yang kita inginkan
    ft.transaction_id,
    ft.date,
    ft.branch_id,
    kc.branch_name,
    kc.kota,
    kc.provinsi,
    kc.rating AS rating_cabang, #Mengubah nama kolom menjadi rating_cabang
    ft.customer_name,
    ft.product_id,
    p.product_name,
    p.price AS actual_price, #Mengubah nama kolom menjadi actual_price
    ft.discount_percentage,
    CASE #Membuat fungsi case untuk mengkondisikan nilai berdasarkan beberapa kriteria, mirip dengan penggunaan if-else dalam bahasa pemrograman lainnya.
        WHEN ft.price <= 50000 THEN 0.10
        WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
        WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
        WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
        WHEN ft.price > 500000 THEN 0.30
    END AS persentase_gross_laba,
    (p.price - (p.price * ft.discount_percentage)) AS nett_sales,
    (p.price - (p.price * ft.discount_percentage)) * CASE
        WHEN p.price <= 50000 THEN 0.10
        WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
        WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
        WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS nett_profit,
    ft.rating AS rating_transaksi
FROM #Mengambil tabel kf_final_transaction dari dataset kimia_farma
    `kimia_farma.kf_final_transaction` ft
INNER JOIN #Menggabungkan tabel kf_kantor_cabang menggunakan inner join
    `kimia_farma.kf_kantor_cabang` kc ON ft.branch_id = kc.branch_id
INNER JOIN #Menggabungkan tabel kf_product menggunakan inner join
    `kimia_farma.kf_product` p ON ft.product_id = p.product_id
INNER JOIN #Menggabungkan tabel kf_inventory menggunakan inner join
    `kimia_farma.kf_inventory` i ON ft.branch_id = i.branch_id AND ft.product_id = i.product_id;
```
    
<br>
</details>
<br>
<p align="center">
    <kbd> <img width="750" alt="sql bigquery" src="https://github.com/arknsa/Rakamin-Big-Data-Analytics-Kimia-Farma/blob/main/SQL-BigQuery.jpg"> </kbd> <br>
    Gambar 1 — SQL BigQUery dari PT. Kimia Farma Tahun 2020-2023
</p>
<br>
<br>

<p align="center">
    <kbd> <img width="750" alt="sample aggregat" src="https://github.com/arknsa/Rakamin-Big-Data-Analytics-Kimia-Farma/blob/main/kf_analytics_data.jpg"> </kbd> <br>
    Gambar 2 — Datamart dari PT. Kimia Farma Tahun 2020-2023
</p>
<br>

---

## 📂 **Data Visualization**

[Lihat pada halaman Looker Data Studio](https://lookerstudio.google.com/u/0/reporting/d0658e1c-3b0f-4330-8eb9-5a4c6efe86d9/page/tEnnC/edit).

<p align="center">
    <kbd> <img width="1000" alt="Kimia_Farma_page-0001" src="https://github.com/arknsa/Rakamin-Big-Data-Analytics-Kimia-Farma/blob/main/Rakamin_KF_Analytics_Data_Visualization.jpg"> </kbd> <br>
    Gambar 3 — Sales Report Dashboard PT. Kimia Farma Tahun 2020-2023
</p>
<br>

---

