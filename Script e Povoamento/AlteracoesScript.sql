ALTER TABLE Produto
ADD Categoria nvarchar

GO

UPDATE Produto
SET Categoria ='0'
WHERE Preco < 1000;

UPDATE Produto
SET Categoria = '1'
WHERE Preco BETWEEN 1000 AND 2000;


UPDATE Produto
SET Categoria = '2'
WHERE Preco BETWEEN 2000 AND 3000;


UPDATE Produto
SET Categoria = '3'
WHERE Preco BETWEEN 3000 AND 4000;


UPDATE Produto
SET Categoria = '4'
WHERE Preco BETWEEN 4000 AND 5000;


UPDATE Produto
SET Categoria = '5'
WHERE Preco BETWEEN 5000 AND 6000;


UPDATE Produto
SET Categoria = '6'
WHERE Preco BETWEEN 6000 AND 7000;


UPDATE Produto
SET Categoria = '7'
WHERE Preco BETWEEN 7000 AND 8000;


UPDATE Produto
SET Categoria = '8'
WHERE Preco BETWEEN 8000 AND 9000;


UPDATE Produto
SET Categoria = '9'
WHERE Preco BETWEEN 9000 AND 10000;

ALTER TABLE Produto
ADD CategoriaPrecos nvarchar(20)

GO

UPDATE Produto
SET CategoriaPrecos = 'Barato'
WHERE Preco < 3000;

UPDATE Produto
SET CategoriaPrecos = 'Mediano'
WHERE Preco BETWEEN 3000 AND 7000;

UPDATE Produto
SET CategoriaPrecos = 'Caro'
WHERE Preco > 7000;
