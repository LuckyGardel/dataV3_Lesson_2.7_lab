USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT *
FROM category;

SELECT *
FROM film_category;

SELECT COUNT(fc.film_id) AS "number of films", c.name 
FROM film_category fc
JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT *
FROM payment;

SELECT *
FROM staff;

SELECT SUM(p.amount) AS "revenue", s.first_name
FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date) = 8
GROUP BY p.staff_id;

-- 3. Which actor has appeared in the most films?

SELECT *
FROM actor;

SELECT * 
FROM film_actor;

SELECT COUNT(fa.actor_id) AS "number of films performed", a.*
FROM film_actor fa
JOIN actor a
ON fa.actor_id = a.actor_id
GROUP BY fa.actor_id
ORDER BY COUNT(fa.actor_id) DESC;

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT *
FROM customer;

SELECT * 
FROM rental;

SELECT COUNT(r.customer_id) AS "number of rents", c.*
FROM customer c 
JOIN rental r
ON r.customer_id = c.customer_id
GROUP BY r.customer_id
ORDER BY COUNT(r.customer_id) DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT *
FROM staff;

SELECT * 
FROM address;

SELECT s.first_name,s.last_name, a.address
FROM staff s
JOIN address a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.

SELECT *
FROM film;

SELECT * 
FROM film_actor;

SELECT COUNT(fa.actor_id) AS "number of actors",f.title, f.film_id
FROM film_actor fa
JOIN film f
ON fa.film_id = f.film_id
GROUP BY f.title
ORDER BY COUNT(fa.actor_id) DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- 	  List the customers alphabetically by last name.

SELECT *
FROM payment;

SELECT *
FROM customer;

SELECT SUM(p.amount) AS "Amount Paid",c.first_name,c.last_name
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name ASC;

-- 8. List number of films per category.

-- This is the same answer as question 1.