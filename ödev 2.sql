-- SORU 1 -------------------------------
SELECT 
    COUNT(CASE WHEN invoice_id IS NULL THEN 1 END) as fatura_ID,
    COUNT(CASE WHEN customer_id IS NULL THEN 1 END) as Müsteri_ID,
    COUNT(CASE WHEN invoice_date IS NULL THEN 1 END) as Fatura_tarih,
    COUNT(CASE WHEN billing_address IS NULL THEN 1 END) as Adres,
    COUNT(CASE WHEN billing_city IS NULL THEN 1 END) as Sehir,
    COUNT(CASE WHEN billing_state IS NULL THEN 1 END) as Durum,
    COUNT(CASE WHEN billing_country IS NULL THEN 1 END) as Ulke,
	COUNT(CASE WHEN billingpostal_code IS NULL THEN 1 END) as posta_kodu
FROM invoice;

--Row count:
--Durum için 202 adet
--Posta kodu için 28 adet
----------------------------------------------

-- SORU 2 ------------------------------------
SELECT invoice_id, total as eski_deger, total*2 as yeni_deger
FROM invoice
ORDER BY yeni_deger DESC;
----------------------------------------------

--SORU 3 -------------------------------------
SELECT 
    invoice_id, customer_id,
    LEFT(billing_address, 3) || RIGHT(billing_address, 4) AS "Açık_Adres", invoice_date
FROM address
WHERE EXTRACT(YEAR FROM invoice_date) = 2013  
  AND EXTRACT(MONTH FROM invoice_date) = 8 
ORDER BY invoice_date DESC; 
---------------------------------------------

