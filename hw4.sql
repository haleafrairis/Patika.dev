-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
-- Q2. film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
-- Q3. film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye eşittir?
-- Q4. country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
-- Q5. city tablosundaki şehir isimlerinin kaç tanesi 'R' veya 'r' karakteri ile biter?

-- Q1.
SELECT DISTINCT replacement_cost FROM film;
-- Q2.
SELECT COUNT(DISTINCT replacement_cost) FROM film;
-- Q3.
SELECT COUNT(*) FROM film
WHERE title LIKE 'T%' AND rating IN ('G');
-- Q4.
SELECT COUNT(*) FROM country
WHERE country LIKE '_____';
-- Q5.
SELECT COUNT(*) FROM city
WHERE city ~~* '%r';
-- Q5.
SELECT COUNT(*) FROM city
WHERE city ILIKE '%r';
