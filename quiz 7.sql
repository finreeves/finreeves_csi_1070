--1)
select * 
from payment
where amount >= 9.99;

select max(amount)
from payment;
--2)
select*
from rental
limit 100;

select title
from rental r
left join payment p
on r.rental_id = p.rental_id
left join inventory i
on r.inventory_id = i.inventory_id
left join film f
on i.film_id = f.film_id
where amount = 11.99;
--selected only the title column of the multi left join of every table that connected payment amount to film title

--3)
select first_name, last_name, email, address, city, country 
from staff s
left join address a
on s.address_id = a.address_id
left join city c
on a.city_id = c.city_id
left join country c2
on c.country_id = c2.country_id
--join all relevant tables into one and then print only desired columns

--4)
--I personally am interested in working data science in more specifically data analytics
--I hope to work as an in house data specialist as that seems to be a very stable career path

--5)
--crows ffoot notation like in the relationship between customer and payment represents that one
--customer can have a relationship with multiple payments where as a payment can only have 
--a relationship with one customer 