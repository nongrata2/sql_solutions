-- https://www.sql-ex.ru/learn_exercises.php?LN=110
-- Определить имена разных пассажиров, когда-либо летевших рейсом, который вылетел в субботу, а приземлился в воскресенье.

WITH table_new AS (SELECT DISTINCT passenger.ID_psg, name FROM 
( pass_in_trip 
JOIN passenger ON passenger.ID_psg = pass_in_trip.ID_psg
JOIN trip ON pass_in_trip.trip_no = trip.trip_no
)
WHERE datename(weekday, date) = 'Saturday' AND time_out > time_in
)

SELECT name FROM table_new
