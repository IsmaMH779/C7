#1. Actores que tienen de primer nombre ‘Scarlett’.
select * from actor where first_name = 'Scarlett';

#2. Actores que tienen de apellido ‘Johansson’.
select * from actor where last_name = 'johansson';

#3. Actores que contengan una ‘O’ en su nombre.
select * from actor where first_name like '%o%';

#4. Actores que contengan una ‘O’ en su nombre y en una ‘A’ en su apellido.
select * from actor where first_name like '%o%' and last_name like '%a%';

#5. Actores que contengan dos ‘O’ en su nombre y en una ‘A’ en su apellido.
select * from actor where first_name like '%o%' and last_name like '%a%';

#6. Actores donde su tercera letra sea ‘B’.
select * from actor where first_name like '__B%';

#7. Ciudades que empiezan por ‘a’.
select * from city where city like 'a%';

#8. Ciudades que acaban por ‘s’.
select * from city where city like '%s';

#9. Ciudades del country 61.
select * from country where country_id = 61;

#10. Ciudades del country ‘Spain’.
select * from country where country = 'spain';

#11. Ciudades con nombres compuestos.
select * from country where country like '% %';

#12. Peliculas con una duracion entre 80 y 100.
select * from film where length > 80 and length < 100;

#13. Peliculas con un rental_rate entre 1 y 3.
select * from film where rental_rate > 1 and rental_rate <3;

#14. Peliculas con un titulo de más de 12 letras.
select * from film where length(title) > 12;

#15. Peliculas con un rating de PG o G.
select * from film where rating = 'PG' or rating = 'G';

#16. Peliculas que no tengan un rating de NC-17.
select * from film where rating != 'NC-17';

#17. Peliculas con un rating PG y duracion de más de 120.
select * from film where rating = 'PG' and length > 120;

#18. ¿Cuantos actores hay?
select count(*) from actor;

#19. ¿Cuantas ciudades tiene el country ‘Spain’?
select country,count(city) as num_Ciudades from country as co
join city as ci
on co.country_id = ci.country_id
where country = 'spain';

#20. ¿Cuantos countries hay que empiezan por ‘a’?
select count(*) from country where country like 'a%';

#21. Media de duración de peliculas con PG.
select (sum(length) / count(length)) as promedio from film where rating = 'PG';

#22. Suma de rental_rate de todas las peliculas.
select sum(rental_rate) as suma from film;

#23. Pelicula con mayor duración.
select max(length) from film;

#24. Pelicula con menor duración.
select min(length) from film;

#25. Mostrar las ciudades del country Spain (multitabla).
select country,city as num_Ciudades from country as co
join city as ci
on co.country_id = ci.country_id
where country = 'spain';

#26. Mostrar el nombre de la película y el nombre de los actores.
select title,first_name 
from film_actor as fa
join film as f
on fa.film_id = f.film_id
join actor as a
on fa.actor_id = a.actor_id
order by title;

#27. Mostrar el nombre de la película y el de sus categorías.
select name,title
from film_category as fc
join film as f
on fc.film_id = f.film_id
join category as c
on fc.category_id = c.category_id
order by name;

#28. Mostrar el country, la ciudad y dirección de cada miembro del staff.

select first_name, address, ci.city, cy.country
from staff as st
join address as ad
on ad.address_id = st.address_id
join city as ci
on ad.city_id = ci.city_id
join country as cy
on cy.country_id = ci.country_id;

#29. Mostrar el country, la ciudad y dirección de cada customer.
select first_name, address , city, country
from customer as cu
join address as ad
on cu.address_id = ad.address_id
join city as ci
on ci.city_id = ad.city_id
join country as co
on co.country_id = ci.country_id;

#30. Numero de peliculas de cada rating
select rating, count(title) from film group by rating;

#31. Cuantas peliculas ha realizado el actor ED CHASE.
select first_name ,last_name, count(title)
from film_actor as fa
join actor as a
on fa.actor_id = a.actor_id
join film as f
on f.film_id = fa.film_id
where first_name = 'ED' and last_name =  'chase';

#32. Media de duracion de las peliculas cada categoria.
select ca.name as caregoria,(sum(length) / count(length)) as media
from film as f
join film_category as fc
on fc.film_id = f.film_id
join category as ca
on ca.category_id = fc.category_id
group by ca.name;






