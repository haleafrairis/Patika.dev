--Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
-- Q2. film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.
-- Q3. film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.
-- Q4. customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir?
-- Q5. film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.

-- Q1.
SELECT title, description FROM film;
-- Q2.
SELECT * FROM film
WHERE length < 75 AND length > 60;
-- Q3.
SELECT * FROM film
WHERE rental_rate = 0.99 AND replacement_cost = 12.99 OR replacement_cost = 28.99;
-- Q4.
SELECT first_name, last_name FROM customer
WHERE first_name = 'Mary';
-- 'Smith'
-- Q5.
SELECT * FROM film
WHERE NOT (length > 50 OR rental_rate = 2.99 OR rental_rate = 4.99);
