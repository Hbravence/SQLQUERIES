# connecting different tables
# Customer id, name(first and last), mailing address

select customer.customer_id, customer.first_name, customer.last_name, address.address
from customer, address
where customer.address_id = address.address_id
;

#list of ever film, with name of film, genre, language of said film 
select film.title, language.name, film_category.category_id, category.name
from film, film_category, language, category
where film.film_id = film_category.film_id, language.language_id = film.language_id,  film_category.category_id = category.category_id
;


#how Many times has each movie been rented, which is not individual copys 
select count(rental.rental_id),film.title,
from inventory,rental, film
where film.film_id = inventory.film_id and inventory.inventory_id = rental.inventory_id
group by
1
;