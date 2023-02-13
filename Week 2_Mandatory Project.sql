use mavenmovies;

/* Problem 1. Write a SQL query to count the number of characters except the spaces for each actor.
Return first 10 actors name length along with their name.*/
select * from actor;
select first_name, last_name, length(concat(trim(first_name), trim(last_name))) as Character_Count 
from actor where actor_id between 1 and 10;

#2nd method
select first_name, last_name, length(concat(trim(first_name), trim(last_name))) as Character_Count 
from actor where actor_id limit 10; 

/* Problem 2. List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names.*/
select * from actor_award;
select actor_id, concat(first_name, ' ', last_name) as Actor_name, length(concat(first_name, last_name)) as Name_length, awards
from actor_award where awards like '%Oscar%';

#2nd method
select locate('oscar', awards) from actor_award;
select substr(awards, locate('oscar', awards), 5) from actor_award where awards like'%oscar%';
select actor_id, concat(first_name, ' ', last_name) as Actor_name, length(concat(first_name, last_name)) as Name_length, awards,
substr(awards, locate('oscar', awards), 5) as 'Extracted Award' from actor_award where awards like'%oscar%';

/* Problem 3. Find the actors who have acted in the film ‘Frost Head’.*/
show tables;
select * from actor;
select * from film_actor;
select a.actor_id, concat(a.first_name,' ',a.last_name) as Actor_Name, title from actor a
join film_actor fa on a.actor_id=fa.actor_id
join film f on fa.film_id=f.film_id
where f.title='Frost Head';

#2nd method
select * from film_list;
select FID, title, actors from film_list where title='Frost Head';

/* Problem 4. Pull all the films acted by the actor ‘Will Wilson’.*/
select f.film_id, f.title, concat(a.first_name, ' ', a.last_name) as Actor_name from film f
join film_actor fa on f.film_id = fa.film_id
join actor a on fa.actor_id = a.actor_id
where a. first_name='Will' and a.last_name='Wilson';

#2nd method
select * from film_list;
select FID, title, actors from film_list where actors like '%Will Wilson%';

/* Problem 5. Pull all the films which were rented and return in the month of May.*/
show tables;
select * from rental;
select * from inventory;
select * from film;
select rental_id, film.title, rental_date, customer_id, return_date from rental
join inventory on rental.inventory_id = inventory.inventory_id 
join film on inventory.film_id = film.film_id 
where month(rental_date)= 05 and month(return_date)= 05;

/* Problem 6. Pull all the films with ‘Comedy’ category.*/
select * from film_list;
select FID, title, category from film_list where category='Comedy';

# 2nd Method
select FID, title, category from film_list where category like '%Comedy%';

