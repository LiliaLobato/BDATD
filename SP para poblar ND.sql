/*
Procedimiento almacenado para tomar los datos de Northwind e insertarlos en ND
V�ctor Ortega
1-sep-2021
*/

USE Northwind
GO 

CREATE PROCEDURE POBLAR
AS
BEGIN


-- Borro las tablas

	 DELETE Northwind.[dbo].[FACT-SALES]
	 DELETE Northwind.[dbo].[DIM-CATEGORY]
	 DELETE Northwind.[dbo].[DIM-CUSTOMER]
	 DELETE Northwind.[dbo].[DIM-EMPLOYEE]
	 DELETE Northwind.[dbo].[DIM-PRODUCT]
	 DELETE Northwind.[dbo].[DIM-TIME]
	 


-- Poblar la dimensi�n Categor�a
	
	INSERT INTO Northwind.[dbo].[DIM-CATEGORY] 
	SELECT 
		  CategoryID, 
		  CategoryName
	FROM Northwind.DBO.Categories

-- Poblar la dmiensi�n Cliente

	INSERT INTO Northwind.[dbo].[DIM-CUSTOMER]
	SELECT 
			CustomerID,
			CompanyName,
			ContactName,
			ContactTitle,
			City,
			Country,
			PostalCode,
			Region
	FROM Northwind.DBO.Customers
	
	
-- Poblar la dimensi�n Empleado	

	INSERT INTO Northwind.[dbo].[DIM-EMPLOYEE]
	SELECT 
			EmployeeID,
			FirstName,
			LastName,
			Title,
			City,
			Region,
			PostalCode,
			Country
	FROM Northwind.DBO.Employees


-- Poblar la dimesni�n Producto 

	INSERT INTO Northwind.[dbo].[DIM-PRODUCT]
	SELECT 
			ProductID,
			ProductName,
			UnitPrice,
			UnitsInStock,
			UnitsOnOrder,
			QuantityPerUnit,
			ReorderLevel
	FROM Northwind.DBO.Products
	
	
-- Poblar la dimensi�n Tiempo

	INSERT INTO Northwind.[dbo].[DIM-TIME]   
	SELECT
		DISTINCT
			
			CAST (
					 SUBSTRING( CONVERT ( varchar, OrderDate, 126),1,4)+    --a�o   YYYY-MM-DD
					 SUBSTRING( CONVERT ( varchar, OrderDate, 126),6,2)+    --mes
					 SUBSTRING( CONVERT ( varchar, OrderDate, 126),9,2)    --d�a
				AS bigint) FechaNum,

				DATEPART(yy, OrderDate) as a�o,  --YEAR ( OrderDate)
				DATEPART(MM, OrderDate) as mes,
				DATEPART(DD, OrderDate) as d�a,
				OrderDate,
				DATENAME(weekday, OrderDate) as DayOfWeek

	FROM Northwind.DBO.Orders

  --POBLAR HECHOS
  INSERT INTO Northwind.dbo.[FACT-SALES] -- SELECT * FROM Northwind.dbo.[FACT-SALES] 
  SELECT
	DISTINCT
		O.EmployeeID,
		O.CustomerID, 
		OD.ProductID,
		P.CategoryID,
		CAST (
					 SUBSTRING( CONVERT ( varchar, OrderDate, 126),1,4)+    --a�o   YYYY-MM-DD
					 SUBSTRING( CONVERT ( varchar, OrderDate, 126),6,2)+    --mes
					 SUBSTRING( CONVERT ( varchar, OrderDate, 126),9,2)    --d�a
				AS bigint) FechaNum,
		
		OD.UnitPrice*OD.Quantity-OD.Discount,  --TOTALDINERO,
		1,  --TOTAL_ORDENES (1/CUENTA DE LAS FAMILIAS DE PRODUCTOS) 0.5
		OD.UnitPrice,
		OD.Quantity,
		OD.Discount
  FROM Northwind.dbo.Orders O
  INNER JOIN Northwind.DBO.[Order Details] OD ON(O.OrderID=OD.OrderID) 
  INNER JOIN Northwind.DBO.Products P  ON (P.ProductID=OD.ProductID)


END 
