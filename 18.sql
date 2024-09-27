-- https://www.sql-ex.ru/learn_exercises.php?LN=18
-- Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

SELECT DISTINCT maker, price FROM (Product
JOIN Printer ON Printer.model = Product.model
) WHERE price = (SELECT MIN(price) FROM Printer WHERE color = 'y') AND color = 'y'
