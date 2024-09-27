WITH counted AS (SELECT name, passenger.ID_psg, place, COUNT(place) AS NN
FROM pass_in_trip
JOIN passenger ON passenger.ID_psg = pass_in_trip.ID_psg
GROUP BY place, passenger.ID_psg, passenger.name)


SELECT name, NN FROM (SELECT DISTINCT name, NN, ID_psg FROM counted
WHERE NN = (SELECT MAX(NN) FROM counted)) AS subquery
