CREATE TABLE `kimia_farma.kf_analytics_data` AS
SELECT
    ft.transaction_id,
    ft.date,
    ft.branch_id,
    kc.branch_name,
    kc.kota,
    kc.provinsi,
    kc.rating AS rating_cabang,
    ft.customer_name,
    ft.product_id,
    p.product_name,
    p.price AS actual_price,
    ft.discount_percentage,
    CASE
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
FROM
    `kimia_farma.kf_final_transaction` ft
INNER JOIN
    `kimia_farma.kf_kantor_cabang` kc ON ft.branch_id = kc.branch_id
INNER JOIN
    `kimia_farma.kf_product` p ON ft.product_id = p.product_id
INNER JOIN
    `kimia_farma.kf_inventory` i ON ft.branch_id = i.branch_id AND ft.product_id = i.product_id;
