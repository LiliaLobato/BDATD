-- Caso 1
select c.RazonSocial, c.Colonia,c.CodigoPostal, sum(sd.Cantidad) as CantidadArticulos from [PinturaO2021].dbo.Salida s 
inner join [PinturaO2021].dbo.Salida_d sd on (s.Id_Salida=sd.Id_Salida)
inner join [PinturaO2021].dbo.Cliente c on (c.Id_Cliente=s.id_cliente)
group by c.RazonSocial, c.Colonia, c.CodigoPostal
order by c.RazonSocial;

-- Caso 2
select DATEPART(yy, Fecha) as year, count(sd.Cantidad), s.id_cliente
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
where s.id_cliente is NULL 
group by s.id_cliente, DATEPART(yy, Fecha)
order by DATEPART(yy, Fecha);

-- Caso 3
select DATEPART(yy, Fecha) as year, 
DATEPART(MM, Fecha) as month,
sum(sd.Cantidad) as CantidadArticulos,
count(sd.Cantidad) as CantidadSalidas
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
group by DATEPART(yy, Fecha), DATEPART(MM, Fecha)
order by DATEPART(yy, Fecha);

-- Caso 4
select DATEPART(yy, Fecha) as year, 
al.Descripcion,
count(sd.Cantidad) as CantidadSalidas
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
inner join [PinturaO2021].dbo.Almacen al on (s.Id_Almacen=al.Id_Almacen)
group by DATEPART(yy, Fecha),al.Descripcion
order by DATEPART(yy, Fecha);

-- Caso 5
select DATEPART(yy, Fecha) as year,
umd.descripcion,
at.descripcion,
SUM(sd.Cantidad) as CantidadArticulos
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
inner join [PinturaO2021].dbo.Articulo a on (a.id_articulo=sd.id_articulo)
inner join [PinturaO2021].dbo.umd umd on (a.id_umd=umd.id_umd)
inner join [PinturaO2021].dbo.ArticuloTipo at on (at.id_articulotipo=a.id_articulotipo)
where umd.descripcion IN ('CUB 19 L', 'CUB 19LT') AND DATEPART(yy, Fecha)='2018' and at.descripcion='ESMALTES'
group by DATEPART(yy, Fecha), umd.descripcion, at.descripcion
order by DATEPART(yy, Fecha);

-- Caso 6
select
s.Id_Salida, s.Folio, a.id_articulo,
a.codigo, a.descripcion,

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
    END,

DATENAME(weekday, Fecha) as DayOfWeek

from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
inner join [PinturaO2021].dbo.Articulo a on (sd.id_articulo=a.id_articulo)
where s.Id_Salida = '463' and s.Folio = 'S00008'
group by s.Id_Salida,s.Folio, DATENAME(weekday, Fecha), a.descripcion, a.id_articulo, a.codigo,
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
    END;

-- Caso 7
select DATEPART(yy, Fecha) as year, 
umd.descripcion,
at.descripcion,
COUNT(sd.Cantidad) as CantidadSalidas
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
inner join [PinturaO2021].dbo.Articulo a on (a.id_articulo=sd.id_articulo)
inner join [PinturaO2021].dbo.umd umd on (a.id_umd=umd.id_umd)
inner join [PinturaO2021].dbo.ArticuloTipo at on (at.id_articulotipo=a.id_articulotipo)
where umd.descripcion IN ('BOTE 1LT') AND DATEPART(yy, Fecha)='2019' and at.descripcion='VINIL ACRILICAS'
group by DATEPART(yy, Fecha), umd.descripcion, at.descripcion
order by DATEPART(yy, Fecha);

-- Caso 8
select DATEPART(yy, Fecha) as year, 
sum(sd.Cantidad) as CantidadArticulos,
count(sd.Cantidad) as CantidadSalidas
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
group by DATEPART(yy, Fecha)
order by DATEPART(yy, Fecha);

-- Caso 9
select DATEPART(yy, Fecha) as year, 
((DATEPART(quarter,Fecha))) as trimester,
DATEPART(MM, Fecha) as month,
DATENAME(weekday, Fecha) as DayOfWeek,
count(sd.Cantidad) as CantidadSalidas
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
group by DATEPART(yy, Fecha), ((DATEPART(quarter,Fecha))),
DATEPART(MM, Fecha), DATENAME(weekday, Fecha) 
order by DATEPART(yy, Fecha);

-- Caso 10
select top 3 c.RazonSocial, c.Colonia,c.CodigoPostal, c.Id_Cliente,
sum(sd.Cantidad) as CantidadArticulos 
from [PinturaO2021].dbo.Salida s 
inner join [PinturaO2021].dbo.Salida_d sd on (s.Id_Salida=sd.Id_Salida)
inner join [PinturaO2021].dbo.Cliente c on (c.Id_Cliente=s.id_cliente)
group by c.RazonSocial, c.Colonia, c.CodigoPostal, c.Id_Cliente
order by CantidadArticulos desc;

-- Caso 11
select top 3 at.descripcion,
SUM(sd.Cantidad) as CantidadArticulos
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
inner join [PinturaO2021].dbo.Articulo a on (a.id_articulo=sd.id_articulo)
inner join [PinturaO2021].dbo.ArticuloTipo at on (at.id_articulotipo=a.id_articulotipo)
group by at.descripcion
order by CantidadArticulos desc;

-- Caso 12
select ag.descripcion,
SUM(sd.Cantidad) as CantidadArticulos
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
inner join [PinturaO2021].dbo.Articulo a on (a.id_articulo=sd.id_articulo)
inner join [PinturaO2021].dbo.ArticuloGrupo ag on (ag.id_articulogrupo=a.id_articulogrupo)
group by ag.descripcion
order by ag.descripcion;

-- Caso 13
select 
v.Nombre, DATEPART(yy, Fecha) as year, 
DATENAME(MM, Fecha) AS monthLetter,
DATENAME(weekday, Fecha) as DayOfWeek,
sum(sd.Cantidad) as CantidadArticulos
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
inner join [PinturaO2021].dbo.Cliente c on (s.id_cliente=c.Id_Cliente)
inner join [PinturaO2021].dbo.vendedor v on (v.Id_vendedor=c.Id_Vendedor)
where v.Id_vendedor='20'
group by DATEPART(yy, Fecha), v.Nombre, DATENAME(MM, Fecha), DATENAME(weekday, Fecha)
order by DATEPART(yy, Fecha), DATENAME(MM, Fecha), DATENAME(weekday, Fecha);

-- Caso 14
select 
DATEPART(yy, Fecha) as year,
a.descripcion,
ag.descripcion,
at.descripcion,
count(sd.Cantidad) as CantidadSalidas
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
inner join [PinturaO2021].dbo.Articulo a on (a.id_articulo=sd.id_articulo)
inner join [PinturaO2021].dbo.ArticuloGrupo ag on (ag.id_articulogrupo=a.id_articulogrupo)
inner join [PinturaO2021].dbo.ArticuloTipo at on (at.id_articulotipo=a.id_articulotipo)
where DATEPART(yy, Fecha) = '2019'
group by DATEPART(yy, Fecha), a.descripcion, ag.descripcion , at.descripcion
order by DATEPART(yy, Fecha), a.descripcion, ag.descripcion , at.descripcion;

-- Caso 15
SELECT
    DATEPART(yy, s.Fecha) as year,
    count(sd.Cantidad) as CantidadSalidas,
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
    END AS color
    FROM [PinturaO2021].[dbo].[Articulo] A   
    INNER JOIN [PinturaO2021].[dbo].[umd] umd ON(A.id_umd=umd.id_umd)
	inner join [PinturaO2021].dbo.Salida_d sd on (sd.id_articulo=a.id_articulo)
	inner join [PinturaO2021].dbo.Salida s on (sd.Id_Salida=s.Id_Salida)
	where DATEPART(yy, s.Fecha) >= '2015'
	group by CASE
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
    END, DATEPART(yy, s.Fecha)
        order by count(sd.Cantidad) DESC, CASE
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
    END;

-- Caso 16
SELECT 
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
		a.descripcion,
    sum(sd.Cantidad) as CantidadArticulos
	FROM [PinturaO2021].[dbo].[Articulo] A
	INNER JOIN [PinturaO2021].[dbo].[umd] umd ON(A.id_umd=umd.id_umd)
	inner join [PinturaO2021].dbo.Salida_d sd on (sd.id_articulo=a.id_articulo)
	where CASE 
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
		END is not null
	group by CASE
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
    END, a.descripcion
        order by  CASE
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
    END, a.descripcion;

-- Caso 17
select distinct
at.descripcion,
a.descripcion,
umd.descripcion
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
inner join [PinturaO2021].dbo.Articulo a on (a.id_articulo=sd.id_articulo)
inner join [PinturaO2021].dbo.umd umd on (a.id_umd=umd.id_umd)
inner join [PinturaO2021].dbo.ArticuloTipo at on (at.id_articulotipo=a.id_articulotipo)
order by at.descripcion, a.descripcion;

-- Caso 18
select
DATEPART(yy, Fecha) as year,
DATENAME(MM, Fecha) AS monthLetter,
DATENAME(weekday, Fecha) as DayOfWeek,
s.Id_Salida, s.Folio
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
where DATEPART(yy, Fecha) = '2011' and DATENAME(MM, Fecha) = 'December' and DATENAME(weekday, Fecha) = 'Monday'
group by DATEPART(yy, Fecha), DATENAME(MM, Fecha), s.Id_Salida, DATENAME(weekday, Fecha), s.Folio
order by DATEPART(yy, Fecha);

-- Caso 19
select 
DATEPART(yy, Fecha) as year, 
sum(sd.Cantidad) as CantidadArticulos
from [PinturaO2021].dbo.Salida s
inner join [PinturaO2021].dbo.Salida_d sd on (sd.Id_Salida=s.Id_Salida)
group by DATEPART(yy, Fecha)
order by DATEPART(yy, Fecha);