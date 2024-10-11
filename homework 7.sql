--1)
select* 
from customer
where last_name like 'T%'
order by first_name asc;

--2)
select*
from rental
where cast (return_date as date) BETWEEN '5/28/2005' and '6/1/2005';

--3)
select title, count(*) as times_rented
from rental r
left join inventory i
on r.inventory_id = i.inventory_id
left join film f
on i.film_id = f.film_id
group by title
order by times_rented desc
limit 10;

--4)
select first_name, sum(amount) as total_spent
from payment p
left join customer c
on p.customer_id = c.customer_id
group by first_name
order by total_spent asc;

--5)
select first_name,last_name, count(*)/1000 as total_movies
from actor a 
left join film_actor fa
on a.actor_id = fa.actor_id
left join film f
on fa.film_id = fa.film_id
where release_year = 2006
group by a.actor_id
order by total_movies desc;
--Gina Degeneres is the most cast actor of 2006

--6)
explain
select first_name, sum(amount) as total_spent
from payment p
left join customer c
on p.customer_id = c.customer_id
group by first_name
order by total_spent asc;
--It creates a sort for first_name and a sort key for the sum of p.amount and a group key of
--first_name is created so data is merged into based on shared first names
--Then the dataframes are joined together on the lines where the customer_id of both data frames
--are equal. Then the desired data is summed and selected and displayed in ascending order

explain 
select first_name,last_name, count(*)/1000 as total_movies
from actor a 
left join film_actor fa
on a.actor_id = fa.actor_id
left join film f
on fa.film_id = fa.film_id
where release_year = 2006
group by a.actor_id
order by total_movies desc;
--First a sort for first and last name are made then a sort key for the total number of movies
--divided by 1000 is made to accurately gather the total number of movies made as the data comes
--out as a multiple of 1000 for a reason i do not know i manually counted and the total count
--was always given as 1000 of what it should have been. next the data is aggragated by a.actor_id
--and joined together in a nested join. The data is then sorted by the sorts that were defined
-- and finally filtered by those whose release date was 2006

--7)
select c.name, avg(rental_rate) as avg_rental_rate
from category c
left join film_category fc
on c.category_id = fc.category_id
left join film f
on fc.film_id = f.film_id
group by c.category_id
order by avg_rental_rate desc;

--8)
select c.name, count(rental_id) as number_rented
from category c
left join film_category f
on c.category_id = f.category_id
left join inventory i
on f.film_id = i.film_id
left join rental r 
on i.inventory_id = r.inventory_id
group by c.category_id
order by number_rented desc
limit 5;

--Extra Credit)