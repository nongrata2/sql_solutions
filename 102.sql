-- https://www.sql-ex.ru/learn_exercises.php?LN=102
-- Определить имена разных пассажиров, которые летали только между двумя городами (туда и/или обратно).

SELECT name FROM (SELECT 
    p.ID_psg,
    p.name,
    COUNT(DISTINCT city) AS unique_cities_count
FROM (
    SELECT 
        pit.ID_psg, 
        t.town_from AS city
    FROM 
        pass_in_trip pit
    JOIN 
        trip t ON pit.trip_no = t.trip_no

    UNION

    SELECT 
        pit.ID_psg,
        t.town_to AS city
    FROM 
        pass_in_trip pit
    JOIN 
        trip t ON pit.trip_no = t.trip_no
) AS combined
JOIN 
    passenger p ON combined.ID_psg = p.ID_psg
GROUP BY 
    p.ID_psg, 
    p.name
) AS unique_count
WHERE unique_cities_count < 3
