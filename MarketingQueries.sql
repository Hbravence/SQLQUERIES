# How many rentals we have each month
select
	f.title, MAX(r.rental_date) as "Last Rental Date", MIN(r.rental_date) as "First rental date"
FROM 
	rental r, inventory i, film f 
WHERE
	r.inventory_id = i.inventory_id
	and
	i.film_id = f.film_id
GROUP BY
	f.film_id


#you can yse concat to add to rows together 
#last rental time by customer
select
	concat(c.first_name, "",c.last_name) as name ,MAX(r.rental_date)
FROM
	rental r, customer c
WHERE
	c.customer_id = r.customer_id
GROUP BY
	c.customer_id
;

# revenue by each month
select
	left(p.payment_date, 7), count(p.amount)
FROM payment p

GROUP BY
1


#How many distinct renters per month
select
	left(r.rental_date, 7) as month, count(r.rental_id) as total_rentals, 
	count(distinct r.customer_id) as unique_renters, count(r.rental_id)/count(distinct r.customer_id) as avg_num_rental_per_renter
FROM
	rental r

GROUP BY
	1
	;

# The Number of Distinct films rented each month
#date time, film id, count. groupby date
select left(r.rental_date, 7) as month ,count(r.rental_id) as total_rentals, count(distinct f.film_id) as unique_films_rented,
	count(r.rental_id)/count(distinct i.film_id) as rentals_per_film
FROM 
	film f, inventory i, rental r
WHERE 
	f.film_id = i.film_id and
	i.inventory_id = r.inventory_id
group by
1
;