# revenue per video title
select 
    f.title as "Film Title" , count(r.rental_id), f.rental_rate as rate ,count(r.rental_id) * f.rental_rate as revenue
from 
    inventory i, rental r, film f
where 
    f.film_id=i.film_id 
and 
    i.inventory_id=r.inventory_id
group by
1
order by 
4 desc
;


#revenue = price * number of rentals 
sum()
# What customer has paid us the most amount of money 
select
	p.custmer_id, SUM(p.amount)
from 
	payment p
group by
	1
order by
	2 desc
;

# what store has historically brought in the most revenue
#sales_By_store
select
	i.store_id as "Store ID", sum(p.amount) as Revenue
from 
	inventory i, payment p, rental r
where
	p.rental_id = r.rental_id 
	and
	r.inventory_id = i.inventory_id
group by 
	1
order by
	2 desc
	;


-- Partions LEFT
CREATE PARTITION FUNCTION MonthlyRangeLeft_pf (DATE)
AS RANGE LEFT FOR VALUES
('2016-01-31', '2016-02-29', '2016-03-31');

-- PATITION RIGHT
CREATE PARTITION FUNCTION MonthlyRangeRight_pf (DATE)
AS RANGE RIGHT FOR VALUES
('2016-01-01','2016-02-01', '2016-03-01');