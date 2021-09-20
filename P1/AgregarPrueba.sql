USE [PinturaO2021]
GO

-- SALIDA 1
INSERT INTO [PinturaO2021].[dbo].[Salida]
  ([Folio] ,[id_cliente] ,[Fecha] ,[Subtotal]
 ,[Iva] ,[Total] ,[Id_Moneda] ,[Id_Stage]
 ,[Id_DocumentStatus] ,[FechaCaptura] ,[Id_Almacen]
 ,[observacion] ,[id_vendedor])
VALUES
  ('S99999' ,4029 ,GETDATE() ,0.00
 ,0.00 ,0.00 ,1 ,175 ,1 ,GETDATE()
 ,7 ,'AGREGADO P1' ,22)

INSERT INTO [dbo].[Salida_d]
  ([Cantidad] ,[Total] ,[Id_Salida] ,[id_articulo]
 ,[id_ubicacion] ,[subtotal] ,[iva])
VALUES
  (2 ,0.00 ,7114 ,4511
 ,10 ,0.00 ,0.00)

INSERT INTO [dbo].[Salida_d]
  ([Cantidad] ,[Total] ,[Id_Salida] ,[id_articulo]
 ,[id_ubicacion] ,[subtotal] ,[iva])
VALUES
  (2 ,0.00 ,7114 ,4118
 ,10 ,0.00 ,0.00)

-- SALIDA 2
INSERT INTO [PinturaO2021].[dbo].[Salida]
  ([Folio] ,[id_cliente] ,[Fecha] ,[Subtotal]
 ,[Iva] ,[Total] ,[Id_Moneda] ,[Id_Stage]
 ,[Id_DocumentStatus] ,[FechaCaptura] ,[Id_Almacen]
 ,[observacion] ,[id_vendedor])
VALUES
  ('S12345' ,4029 ,GETDATE() ,0.00
 ,0.00 ,0.00 ,1 ,175 ,1 ,GETDATE()
 ,7 ,'AGREGADO P1' ,22)

INSERT INTO [dbo].[Salida_d]
  ([Cantidad] ,[Total] ,[Id_Salida] ,[id_articulo]
 ,[id_ubicacion] ,[subtotal] ,[iva])
VALUES
  (2 ,0.00 ,7116 ,4511
 ,10 ,0.00 ,0.00)

INSERT INTO [dbo].[Salida_d]
  ([Cantidad] ,[Total] ,[Id_Salida] ,[id_articulo]
 ,[id_ubicacion] ,[subtotal] ,[iva])
VALUES
  (2 ,0.00 ,7116 ,4118
 ,10 ,0.00 ,0.00)

-- AQUI CORREMOS EL PROCEDIMIENTO
-- CAMBIAMOS A LA BASE DE DATOS DIM706937

-- VISUALIZAR DATOS
USE [DIM706937]
GO

SELECT TOP (1000) [time_id]
 ,[salida_id] ,[tipo_id] ,[almacen_id] ,[vendedor_id] ,[articulo_id]
 ,[cliente_id] ,[grupo_id] ,[cantidadArticulos] ,[numeroSalidas]
FROM [DIM706937].[dbo].[orderSalida]
WHERE salida_id IN (7114,7116)