-- https://www.sql-ex.ru/learn_exercises.php?LN=24
-- Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.

WITH all_prices AS (SELECT Product.model, price
FROM Product 
JOIN PC ON Product.model = PC.model 

UNION ALL

SELECT Product.model, price
FROM Product
JOIN Laptop ON Product.model = Laptop.model

UNION ALL

SELECT Product.model, price
FROM Product
JOIN Printer ON Product.model = Printer.model) 

SELECT DISTINCT model FROM all_prices
WHERE price = (SELECT MAX(price) FROM all_prices)
