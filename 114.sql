-- https://www.sql-ex.ru/learn_exercises.php?LN=114
-- Определить имена разных пассажиров, которым чаще других доводилось лететь на одном и том же месте. Вывод: имя и количество полетов на одном и том же месте.

WITH counted AS (SELECT name, passenger.ID_psg, place, COUNT(place) AS NN
FROM pass_in_trip
JOIN passenger ON passenger.ID_psg = pass_in_trip.ID_psg
GROUP BY place, passenger.ID_psg, passenger.name)


SELECT name, NN FROM (SELECT DISTINCT name, NN, ID_psg FROM counted
WHERE NN = (SELECT MAX(NN) FROM counted)) AS subquery
