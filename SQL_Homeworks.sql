-- HW1
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

-- HW2
-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit ve 16.99 küçük olma koşuluyla sıralayınız ( BETWEEN - AND yapısını kullanınız.)
-- Q2. actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya 'Nick' veya 'Ed' değerleri olması koşuluyla sıralayınız. ( IN operatörünü kullanınız.)
-- Q3. film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99, 2.99, 4.99 VE replacement_cost 12.99, 15.99, 28.99 olma koşullarıyla sıralayınız. ( IN operatörünü kullanınız.)


-- Q1.
SELECT * FROM film
WHERE replacement_cost BETWEEN 12.99 AND 16.99;
-- Q2.
SELECT first_name, last_name FROM actor
WHERE first_name IN ('Penelope','Nick','Ed');
-- Q3.
SELECT * FROM film
WHERE rental_rate IN (0.99,2.99,4.99) AND replacement_cost IN (12.99, 15.99, 28.99)

-- HW3
-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.
-- Q2. country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları sıralayınız.
-- Q3. film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sıralayınız.
-- Q4. film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sıralayınız.

-- Q1.
SELECT country FROM country
WHERE country LIKE 'A%a';
-- Q1.
SELECT country FROM country
WHERE country ILIKE 'a%a';
-- Q1.
SELECT country FROM country
WHERE country ~~ 'A%a';
-- Q1.
SELECT country FROM country
WHERE country ~~* 'a%a';
-- Q2.
SELECT country FROM country
WHERE country ~~* '%_____N';
-- Q2.
SELECT country FROM country
WHERE country ~~ '%_____n';
-- Q2.
SELECT country FROM country
WHERE country LIKE '%_____n';
-- Q2.
SELECT country FROM country
WHERE country ILIKE '%_____N';
-- Q3.
SELECT title FROM film
WHERE title ~~* '%t%t%t%t%';
-- Q3.
SELECT title FROM film
WHERE title ILIKE '%t%t%t%t%';
-- Q4.
SELECT * FROM film
WHERE title ~~ 'C%' AND length > 90 AND rental_rate IN (2.99); 


-- HW4
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


-- HW5
-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.
-- Q2. film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci(6,7,8,9,10) 5 filmi(6,7,8,9,10) sıralayınız.
-- Q3. customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi sıralayınız.

-- Q1.
SELECT title FROM film
WHERE title LIKE '%n'
ORDER BY length DESC
LIMIT 5;
-- Q2.
SELECT title FROM film
WHERE title LIKE '%n'
ORDER BY length
OFFSET 5
LIMIT 5;
-- Q3.
SELECT last_name FROM customer
WHERE store_id = 1
ORDER BY last_name DESC
LIMIT 4;


-- HW6
-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?
-- Q2. film tablosunda bulunan filmlerden kaç tanesi 'C' karakteri ile başlar?
-- Q3. film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
-- Q4. film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?

-- Q1.
SELECT AVG(rental_rate) FROM film;

-- Q2.
SELECT COUNT(*) FROM film
WHERE title LIKE 'C%';

-- Q3.
SELECT MAX(length) FROM film
WHERE rental_rate IN (0.99);

-- Q4.
SELECT COUNT(DISTINCT(replacement_cost)) FROM film
WHERE length > 150;


-- HW7
-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
-- Q2. film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı 50 den fazla olan 
   replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.
-- Q3. customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir?
-- Q4.  city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra en fazla şehir sayısı barındıran 
   country_id bilgisini ve şehir sayısını paylaşınız.
   
-- Q1.
SELECT rating FROM film
GROUP BY rating;

-- Q2.
SELECT replacement_cost,count(*) FROM film
GROUP BY replacement_cost
HAVING count(*) > 50;

-- Q3.
SELECT store_id,count(*) FROM customer
GROUP BY store_id;

-- Q4.
SELECT country_id,count(*) FROM city
GROUP BY country_id
ORDER BY count(*) DESC
LIMIT 1;

-- HW8
-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. test veritabanınızda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo oluşturalım.
-- Q2. Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
-- Q3. Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.
-- Q4. Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.

-- Q1.
CREATE TABLE employee (id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, birthday DATE, email VARCHAR(100)); 

-- Q2.
3 sample is here..
insert into employee (name, birthday, email) values ('Any Mundie', '2006-08-05', 'amundie0@mail.ru');
insert into employee (name, birthday, email) values ('Adorne Bingham', '2006-01-01', 'abingham1@over-blog.com');
insert into employee (name, birthday, email) values ('Fidelia Boerderman', '2013-10-02', 'fboerderman2@freewebs.com');
added +

-- Q3.
1 sample is here..
UPDATE employee 
SET name = 'Çizmeli Kedi', 	 
    birthday = '2022-01-01',
    email = 'cizmelikedi@gmail.com' 
	WHERE id = 5
	RETURNING *;

-- Q4.
1 sample is here..
DELETE FROM employee
WHERE name = 'Avis Winckworth';


-- HW9
-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country) isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
-- Q2. customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz 
       INNER JOIN sorgusunu yazınız.
-- Q3. customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz 
       INNER JOIN sorgusunu yazınız.


-- Q1.
SELECT city,country FROM city
INNER JOIN country ON city.country_id = country.country_id;

-- Q2.
SELECT payment_id, first_name, last_name FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id;

-- Q3.
SELECT rental_id, first_name, last_name FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id;


-- HW10
-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country) isimlerini birlikte görebileceğimiz LEFT JOIN sorgusunu yazınız.
-- Q2. customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz 
       RIGHT JOIN sorgusunu yazınız.
-- Q3. customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz 
       FULL JOIN sorgusunu yazınız.


-- Q1.
SELECT city,country FROM city
LEFT JOIN country ON city.country_id = country.country_id;

-- Q2.
SELECT first_name, last_name, payment_id FROM payment
RIGHT JOIN customer ON customer.customer_id = payment.customer_id;

-- Q3.
SELECT first_name, last_name, rental_id FROM customer
FULL JOIN rental ON customer.customer_id = rental.customer_id;


-- HW11
-- Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
-- Q1. actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım.
-- Q2. actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım.
-- Q3. actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım.
-- Q4. İlk 3 sorguyu tekrar eden veriler için de yapalım.


-- Q1.
(SELECT first_name FROM actor)
UNION
(SELECT first_name FROM customer)
ORDER BY first_name;

-- Q2.
(SELECT first_name FROM actor)
INTERSECT
(SELECT first_name FROM customer)
ORDER BY first_name;

-- Q3.
(SELECT first_name FROM actor)
EXCEPT
(SELECT first_name FROM customer)
ORDER BY first_name;

--Q4.
(SELECT first_name FROM actor)
UNION ALL
(SELECT first_name FROM customer)
ORDER BY first_name;
--------------------------------
(SELECT first_name FROM actor)
INTERSECT ALL
(SELECT first_name FROM customer)
ORDER BY first_name;
--------------------------------
(SELECT first_name FROM actor)
EXCEPT ALL
(SELECT first_name FROM customer)
ORDER BY first_name;
ORDER BY first_name;
