USE DIM706937
GO

CREATE PROCEDURE POBLAR4
AS
BEGIN

-- Borro las tablas

	 DELETE [DIM706937].[dbo].[orderSalida]
	 DELETE [DIM706937].[dbo].[almacen]
	 DELETE [DIM706937].[dbo].[articulo]
	 DELETE [DIM706937].[dbo].[cliente]
	 DELETE [DIM706937].[dbo].[grupo]
	 DELETE [DIM706937].[dbo].[salida]
	 DELETE [DIM706937].[dbo].[time]
	 DELETE [DIM706937].[dbo].[tipo]
	 DELETE [DIM706937].[dbo].[vendedor]

-- ************************************** [almacen] 2
	INSERT INTO [DIM706937].[dbo].[almacen] 
	SELECT 
		  Id_Almacen, 
		  Descripcion
	FROM [PinturaO2021].[dbo].[Almacen]

-- ************************************** [articulo] 881
INSERT INTO [DIM706937].[dbo].[articulo]
	SELECT 
		  A.id_articulo, 
		  A.codigo,
		  A.descripcion,
		  CASE 
		    WHEN (A.descripcion LIKE '%BLANCO%') THEN 'Blanco' 
		    WHEN (A.descripcion LIKE '%NEGRO%') THEN 'Negro' 
		    WHEN (A.descripcion LIKE '%ROJO%') THEN 'Rojo' 
		    WHEN (A.descripcion LIKE '%AMARILLO%') THEN 'Amarillo' 
		    WHEN (A.descripcion LIKE '%AZUL%') THEN 'Azul'
		    WHEN (A.descripcion LIKE '%NARANJA%') THEN 'Naranja'
		    WHEN (A.descripcion LIKE '%VERDE%') THEN 'Verde'
		    WHEN (A.descripcion LIKE '%CREMA%') THEN 'Crema'
		    WHEN (A.descripcion LIKE '%MARFIL%') THEN 'Marfil'
		    WHEN (A.descripcion LIKE '%CASTAÑO%') THEN 'Castaño'
		    WHEN (A.descripcion LIKE '%GRIS%') THEN 'Gris'
		    WHEN (A.descripcion LIKE '%BERMELLON%') THEN 'Bermellon'
		    WHEN (A.descripcion LIKE '%TURQUESA%') THEN 'Turquesa'
		    WHEN (A.descripcion LIKE '%OCRE%') THEN 'Ocre'
		    WHEN (A.descripcion LIKE '%VIOLETA%') THEN 'Violeta'
		    WHEN (A.descripcion LIKE '%AGUAMARINA%') THEN 'Aguamarina'
		    WHEN (A.descripcion LIKE '%AQUA%') THEN 'Aqua'
		    WHEN (A.descripcion LIKE '%OSTRA%') THEN 'Ostra'
		    WHEN (A.descripcion LIKE '%ORO%') THEN 'Oro'
		    WHEN (A.descripcion LIKE '%COBRE%') THEN 'Cobre'
		    WHEN (A.descripcion LIKE '%OSTION%') THEN 'Ostion'
		    WHEN (A.descripcion LIKE '%ROSADO%') THEN 'Rosado'
		    WHEN (A.descripcion LIKE '%MELON%') THEN 'Melon'
		    WHEN (A.descripcion LIKE '%SANDALO%') THEN 'Sandalo'
		    WHEN (A.descripcion LIKE '%LILA%') THEN 'Lila'
		    WHEN (A.descripcion LIKE '%BASE PASTEL%') THEN 'Base Pastel'
		    WHEN (A.descripcion LIKE '%BASE PATEL%') THEN 'Base Pastel'
		    WHEN (A.descripcion LIKE '%BASE TINT%') THEN 'Base Tinto'
		    WHEN (A.descripcion LIKE '%TRANSPARENTE%') THEN 'Transparente'
		    WHEN (A.descripcion LIKE '%ROBLE%') THEN 'Roble'
		    WHEN (A.descripcion LIKE '%NOGAL%') THEN 'Nogal'
		    WHEN (A.descripcion LIKE '%MAPLE%') THEN 'Maple'
		    WHEN (A.descripcion LIKE '%CAOBA%') THEN 'Caoba'
		    WHEN (A.descripcion LIKE '%VAINILLA%') THEN 'Vainilla'
		    WHEN (A.descripcion LIKE '%BASE DEEP%') THEN 'Base Deep'
		    WHEN (A.descripcion LIKE '%BEIGE%') THEN 'Beige'
		    WHEN (A.descripcion LIKE '%CELESTE%') THEN 'Celeste'
		    WHEN (A.descripcion LIKE '%ROSA%') THEN 'Rosa'
		    WHEN (A.descripcion LIKE '%DURAZNO%') THEN 'Durazno'
		    WHEN (A.descripcion LIKE '%CAFÉ%') THEN 'Café'
		    WHEN (A.descripcion LIKE '%NIEBLA%') THEN 'Niebla'
		    WHEN (A.descripcion LIKE '%ALMENDRA%') THEN 'Almendra'
		    WHEN (A.descripcion LIKE '%COCOA%') THEN 'Cocoa'
		    WHEN (A.descripcion LIKE '%BASE NEUTRA%') THEN 'Base Neutra'
		    WHEN (A.descripcion LIKE '%APIO%') THEN 'Apio'
		    WHEN (A.descripcion LIKE '%MANDARINA%') THEN 'Mandarina'
		    WHEN (A.descripcion LIKE '%GAMUZA%') THEN 'Gamuza'
		    WHEN (A.descripcion LIKE '%CHAMPAÑA%') THEN 'Champaña'
		    WHEN (A.descripcion LIKE '%ORQUIDEA%') THEN 'Orquidea'
		    WHEN (A.descripcion LIKE '%TERRACOTA%') THEN 'Terracota'
		    WHEN (A.descripcion LIKE '%ULTRAMAR%') THEN 'Ultramar'
		    WHEN (A.descripcion LIKE '%CROMO%') THEN 'Cromo'
		    WHEN (A.descripcion LIKE '%PINO%') THEN 'Pino'
		    WHEN (A.descripcion LIKE '%MAGENTA%') THEN 'Magenta'
		    WHEN (A.descripcion LIKE '%ESMERALDA%') THEN 'Esmeralda'
		END AS color,
		umd.descripcion
	FROM [PinturaO2021].[dbo].[Articulo] A
	INNER JOIN [PinturaO2021].[dbo].[umd] umd ON(A.id_umd=umd.id_umd)

-- ************************************** [cliente] 930
	INSERT INTO [DIM706937].[dbo].[cliente]
	SELECT 
		  Id_Cliente, 
		  RazonSocial,
		  Colonia,
		  CodigoPostal
	FROM [PinturaO2021].[dbo].[Cliente]

-- ************************************** [grupo] 45
	INSERT INTO [DIM706937].[dbo].[grupo]
	SELECT 
		  id_articulogrupo, 
		  descripcion
	FROM [PinturaO2021].[dbo].[ArticuloGrupo]

-- ************************************** [salida] 6510
	INSERT INTO [DIM706937].[dbo].[salida]
	SELECT 
		  Id_Salida, 
		  Folio
	FROM [PinturaO2021].[dbo].[Salida]

-- ************************************** [time] 3256
	INSERT INTO [DIM706937].[dbo].[time] 
	SELECT
		DISTINCT
			CAST (
					 SUBSTRING( CONVERT ( varchar, Fecha, 126),1,4)+    --año   YYYY-MM-DD
					 SUBSTRING( CONVERT ( varchar, Fecha, 126),6,2)+    --mes
					 SUBSTRING( CONVERT ( varchar, Fecha, 126),9,2)    --día
				AS bigint) time_id,

				DATEPART(yy, Fecha) as year,
				((DATEPART(quarter,Fecha)-1)/2)+1 as semester,
				((DATEPART(quarter,Fecha))) as trimester,
				DATEPART(MM, Fecha) as month,
				DATEPART(DD, Fecha) as day,
				DATENAME(weekday, Fecha) as DayOfWeek,
				DATENAME(MM, Fecha) AS monthLetter
	FROM [PinturaO2021].[dbo].[Salida]

-- ************************************** [tipo] 10
	INSERT INTO [DIM706937].[dbo].[tipo] 
	SELECT 
		  id_articulotipo, 
		  descripcion
	FROM [PinturaO2021].[dbo].[ArticuloTipo]

-- ************************************** [vendedor] 5
	INSERT INTO [DIM706937].[dbo].[vendedor]
	SELECT 
		  Id_vendedor, 
		  Nombre
	FROM [PinturaO2021].[dbo].[vendedor]

-- ************************************** [orderSalida] 15045
	INSERT INTO [DIM706937].[dbo].[orderSalida]
	SELECT DISTINCT
		CAST (
			SUBSTRING( CONVERT ( varchar, S.Fecha, 126),1,4)+    --año   YYYY-MM-DD
			SUBSTRING( CONVERT ( varchar, S.Fecha, 126),6,2)+    --mes
			SUBSTRING( CONVERT ( varchar, S.Fecha, 126),9,2)    --día
		AS bigint) time_id,
		S.Id_Salida,
		A.id_articulotipo,
		S.Id_Almacen,
		S.id_vendedor,
		A.id_articulo,
		S.id_cliente,
		A.id_articulogrupo,
		Sd.Cantidad, --cantidadArticulos,
		1 --cantidadSalidas		
	FROM [PinturaO2021].[dbo].[Articulo] A
	INNER JOIN [PinturaO2021].[dbo].[Salida_d] Sd ON(Sd.id_articulo=A.id_articulo)
	INNER JOIN [PinturaO2021].[dbo].[Salida] S ON(S.Id_Salida=Sd.Id_Salida)


END