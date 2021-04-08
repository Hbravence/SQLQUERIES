# Revenue for store 1 where film is rated R or PG-13

Select
i.store_id as Store, f.rating as Movie_Rating, SUM(p.amount) as store_revenue
From 
	payment p, inventory i, film f, rental r
where p.rental_id = r.rental_id 
and r.inventory_id = i.inventory_id
and i.film_id = f.film_id 
and f.rating in("PG-13", "R") 
and i.store_id = 1 
and r.rental_date between '2005-06-08' and '2005-07-19'
GROUP BY
1, 2
order by 
3 desc
;


# rentals per customer 
Select
	SUM(p.mount)
FROM 
(Select
	r.customer_id, count(distinct r.rental_id) as number_rentals
From
	rental r
group by 
1) as RPC, payment p
where
	RPC.customer_id = p.customer_id
	and RPC.number_rentals > 20

;

# create temporary table activeUsers
Select 
	c.*, -- returns all columns in customer table

from 
	customer c
		join address a on c.address_id = a.address_id

where 
	c.active = 1
Group BY 1
;


# create temporary rewardUsers
Select
	r.customer_id,
	count(r.rental_id) as number_rentals,
	max(rental_date)
From
	rental r
Group BY 1
having number_rentals >= 30
;

# Rwards users who are also active users
#columns Customer_ id, emmail, first_name

#all rewards users, columns customer_id, email, phone, for those active users do a left join 
Select c.customer_id, cl.phone, cl.email 

From customer c, customer_list cl

where left join on c.customer_id = cl.id and c.active = 1