-- https://www.sql-ex.ru/learn_exercises.php?LN=6
-- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT DISTINCT maker, speed FROM Product
JOIN Laptop ON Product.model = Laptop.model
WHERE hd >= 10
