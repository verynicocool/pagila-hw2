/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */
SELECT DISTINCT title
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
WHERE title NOT IN (SELECT title
                    FROM film
                    JOIN inventory USING (film_id)
                    JOIN rental USING (inventory_id)
                    JOIN customer USING (customer_id)
                    JOIN address USING (address_id)
                    JOIN city USING (city_id)
                    WHERE country_id = 103)
ORDER BY title;

