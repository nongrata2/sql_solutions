SELECT DISTINCT maker, price FROM (Product
JOIN Printer ON Printer.model = Product.model
) WHERE price = (SELECT MIN(price) FROM Printer WHERE color = 'y') AND color = 'y'
