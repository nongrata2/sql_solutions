-- https://www.sql-ex.ru/learn_exercises.php?LN=142
-- Среди пассажиров, летавших на самолетах только одного типа, определить тех, кто прилетал в один и тот же город не менее 2-х раз. Вывести имена пассажиров.

WITH plane_counting AS (SELECT pass_in_trip.ID_psg,
COUNT(DISTINCT plane) AS plane_count FROM trip
JOIN pass_in_trip
ON trip.trip_no = pass_in_trip.trip_no
JOIN passenger
ON passenger.ID_psg = pass_in_trip.ID_psg

GROUP BY pass_in_trip.ID_psg
)

SELECT name FROM (SELECT DISTINCT sybTable.ID_psg FROM plane_counting
JOIN passenger
ON plane_counting.ID_psg = passenger.ID_psg
JOIN (SELECT town_to, COUNT(town_to) AS NN, pass_in_trip.ID_psg, name, plane FROM trip
JOIN pass_in_trip
ON trip.trip_no = pass_in_trip.trip_no
JOIN passenger
ON passenger.ID_psg = pass_in_trip.ID_psg

GROUP BY town_to, pass_in_trip.ID_psg, name, plane) AS sybTable
ON sybTable.ID_psg = plane_counting.ID_psg
WHERE plane_count = 1 AND NN > 1) AS subTable2
JOIN passenger
ON passenger.ID_psg = subTable2.ID_psg
