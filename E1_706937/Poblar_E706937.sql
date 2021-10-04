USE E706937
GO

CREATE PROCEDURE POBLAR_EX
AS
BEGIN

-- Borro las tablas

	 DELETE [E706937].[dbo].[DimCuentaBancaria];
	 DELETE [E706937].[dbo].[DimProveedor];
	 DELETE [E706937].[dbo].[DimTime];
	 DELETE [E706937].[dbo].[FactPago];

-- ************************************** [DimCuentaBancaria] 3
	INSERT INTO [E706937].[dbo].[DimCuentaBancaria] 
	select id_CuentaBancaria, Numero, Banco, tc.Descripcion
	from [PinturaO2021].[dbo].CuentaBancaria c
	inner join [PinturaO2021].[dbo].TipoDeCuenta tc on(c.Id_CuentaTipo=tc.Id_CuentaTipo);

-- ************************************** [DimProveedor] 20
	INSERT INTO [E706937].[dbo].[DimProveedor] 
	select Id_Proveedor, RazonSocial, Colonia
	from [PinturaO2021].[dbo].Proveedor;

-- ************************************** [DimTime] 448
	INSERT INTO [E706937].[dbo].[DimTime] 
	SELECT
		DISTINCT
			CAST (
					 SUBSTRING( CONVERT ( varchar, Fecha, 126),1,4)+    --año   YYYY-MM-DD
					 SUBSTRING( CONVERT ( varchar, Fecha, 126),6,2)+    --mes
					 SUBSTRING( CONVERT ( varchar, Fecha, 126),9,2)    --día
				AS bigint) time_id,

				DATEPART(yy, Fecha) as year,
				DATEPART(MM, Fecha) as month,
				DATENAME(weekday, Fecha) as DayOfWeek,
				((DATEPART(quarter,Fecha))) as trimester,
				((DATEPART(quarter,Fecha)-1)/2)+1 as semester
	FROM [PinturaO2021].[dbo].[Pago];

-- ************************************** [FactPago] 476
	with mov as (
		select Id_pago, count(Id_pago_d) as movimientos
		from PinturaO2021.dbo.Pago_d
		group by Id_pago
	)
	INSERT INTO [E706937].[dbo].[FactPago] 
	SELECT DISTINCT
		P.Id_pago,
		CAST (
			SUBSTRING( CONVERT ( varchar, P.Fecha, 126),1,4)+    --año   YYYY-MM-DD
			SUBSTRING( CONVERT ( varchar, P.Fecha, 126),6,2)+    --mes
			SUBSTRING( CONVERT ( varchar, P.Fecha, 126),9,2)    --día
		AS bigint) time_id,
		c.id_CuentaBancaria,
		p.Id_Proveedor,
		p.Total, --TotalPago
		mov.movimientos --cantidadMovimientos		
	FROM [PinturaO2021].[dbo].[CuentaBancaria] C
	INNER JOIN [PinturaO2021].[dbo].[Pago] P ON(P.Id_CuentaBancaria=C.id_CuentaBancaria)
	INNER JOIN [PinturaO2021].[dbo].[Pago_d] PD ON (PD.Id_pago=P.Id_pago)
	JOIN mov ON (mov.Id_pago = p.Id_pago);



END