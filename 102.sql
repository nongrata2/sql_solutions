WITH all_prices AS (
  SELECT Product.model, price, maker
  FROM Product
  JOIN PC ON Product.model = PC.model

  UNION ALL
  
  SELECT Product.model, price, maker
  FROM Product
  JOIN Laptop ON Product.model = Laptop.model
  
  UNION ALL
  
  SELECT Product.model, price, maker
  FROM Product
  JOIN Printer ON Product.model = Printer.model
  )
  
SELECT DISTINCT model, price FROM all_prices
WHERE maker = 'B'
