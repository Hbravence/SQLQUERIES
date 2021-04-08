#Count and Group by
Select count(title)
From film
where rental_rate = .99
;

Select count(title), rental_rate
From film
group by 2
;

# which rating do we have the most films in
#Which rating is most prevelant in each store 
Select count(title), rating
From film
group by rating
order by rating ASC
;

-- customer's first rental
drop temporary table if exists first_rental;
Create temporary table first_rental

Select
	customer_,
	min(rental_date) as first_time
From
	rental r
Group BY 1;

-- cohort sixe
DROP TEMPORARY TABLE IF EXISTS  cohort_size
CREATE TEMPORARY TABLE cohort_size
Select
	left(first_time,7) as month,
	count(custmer_id) as num
From
	first_rental
group by 1;

Select
	r.*, left(f.first_time, 7) as cohort, cs.num as cohort_size, p.amount
from 
	rental r
	JOIN first_rental f on r.customer_id = f.customer_id
	join cohort_size cs on p.rental_id = r.rental_id
	JOIN payment p ON p.rental_id=r.rental_id
;
