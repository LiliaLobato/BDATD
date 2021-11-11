##Grafo de un almacén y los artículos relacionados a el
MATCH (n:Almacen{descripcion:'SUR'}),(oS:orderSalida),(a:Articulo)
WHERE (n)-[:SALE_DE]->(oS)<-[:TIENE_ARTICULO]-(a)
RETURN DISTINCT n.descripcion, a.descripcion;

##Grafo de un vendedor y los artículos relacionados a el
MATCH (n:Vendedor{nombre:'Alvaro'}),(oS:orderSalida),(a:Articulo)
WHERE (n)-[:VENDIDO_POR]->(oS)<-[:TIENE_ARTICULO]-(a)
RETURN DISTINCT n.nombre, a.descripcion;

##Grafo de una orden de salida y los artículos relacionados a el
MATCH (oS:orderSalida),(a:Articulo)
WHERE (oS)<-[:TIENE_ARTICULO]-(a)
RETURN DISTINCT oS.salida_id, a.descripcion;

##Nombre de los clientes, los colores base de artículos (como colección), el tipo de artículo (como colección), y el grupo de artículo (como colección)
MATCH (c:Cliente)-[:COMPRADO_POR]->(oS:orderSalida)<-[:TIENE_ARTICULO]-(a:Articulo),
(oS)<-[:TIENE_TIPO]-(t:Tipo),
(oS)<-[:TIENE_GRUPO]-(g:Grupo) 
RETURN c.razonSocial, COLLECT(distinct a.color), 
COLLECT(distinct t.descripcion), COLLECT(distinct g.description)

##Nombre  de  los  almacenes,  los  colores  bases  de  artículos  (como  colección),  el  tipo  de artículo (como colección), y el grupo de artículo (como colección).
MATCH (c:Almacen)-[:SALE_DE]->(oS:orderSalida)<-[:TIENE_ARTICULO]-(a:Articulo),
(oS)<-[:TIENE_TIPO]-(t:Tipo),
(oS)<-[:TIENE_GRUPO]-(g:Grupo) 
RETURN c.descripcion, COLLECT(distinct a.color), 
COLLECT(distinct t.descripcion), COLLECT(distinct g.description)

##La ruta más corta entre un artículo A y uno B. 
MATCH (n:Articulo{articulo_id:3870}), (m:Articulo{articulo_id:4044}),
      path = shortestpath((n)-[*]-(m))
RETURN path
ORDER BY LENGTH(path) DESC
LIMIT 1

##Recomendación de artículos basada en la misma orden de salida.
MATCH (a1:Articulo)-[:TIENE_ARTICULO]->(oS1:orderSalida)<-[:TIENE_FOLIO]-(s:Salida)-[:TIENE_FOLIO]->(oS2:orderSalida)<-[:TIENE_ARTICULO]-(a2:Articulo)
WHERE a1.descripcion <> a2.descripcion
RETURN a1.descripcion, a2.descripcion, count(s.folio)  
ORDER BY   count(s.folio) DESC
LIMIT 5

##Recomendación de artículos basados en el almacén.
MATCH (a1:Articulo)-[:TIENE_ARTICULO]->(oS1:orderSalida)<-[:SALE_DE]-(al:Almacen)-[:SALE_DE]->(oS2:orderSalida)<-[:TIENE_ARTICULO]-(a2:Articulo)
WHERE al.descripcion = "SUR"
RETURN a1.descripcion, a2.descripcion, count(al.almacen_id)  
ORDER BY   count(al.almacen_id) DESC
LIMIT 5

##Recomendación de  artículos  basada  en  el  código  postal  del  cliente.
MATCH (a1:Articulo{articulo_id:3935})-[:TIENE_ARTICULO]->(oS1:orderSalida)<-[:COMPRADO_POR]-(c:Cliente)-[:COMPRADO_POR]->(oS2:orderSalida)<-[:TIENE_ARTICULO]-(a2:Articulo)
WHERE a1.descripcion <> a2.descripcion
RETURN c.CP, a1.descripcion, a2.descripcion, count(c.CP)  
ORDER BY   count(c.CP) DESC
LIMIT 5

##Recomendación de artículos basados en la colonia del cliente.
MATCH (a1:Articulo{articulo_id:3935})-[:TIENE_ARTICULO]->(oS1:orderSalida)<-[:COMPRADO_POR]-(c:Cliente)-[:COMPRADO_POR]->(oS2:orderSalida)<-[:TIENE_ARTICULO]-(a2:Articulo)
WHERE a1.descripcion <> a2.descripcion
RETURN c.colonia, a1.descripcion, a2.descripcion, count(c.colonia)  
ORDER BY   count(c.colonia) DESC
LIMIT 5

##Recomendación de artículos basados en el grupo. 
MATCH (a1:Articulo)-[:TIENE_ARTICULO]->(oS1:orderSalida)<-[:TIENE_GRUPO]-(g:Grupo)-[:TIENE_GRUPO]->(oS2:orderSalida)<-[:TIENE_ARTICULO]-(a2:Articulo)
WHERE a1.descripcion <> a2.descripcion
RETURN g.description, a1.descripcion, a2.descripcion, count(g.grupo_id)  
ORDER BY   count(g.grupo_id) DESC
LIMIT 5

##Recomendación de artículos basada en el tipo.
MATCH (a1:Articulo)-[:TIENE_ARTICULO]->(oS1:orderSalida)<-[:TIENE_TIPO]-(t:Tipo)-[:TIENE_TIPO]->(oS2:orderSalida)<-[:TIENE_ARTICULO]-(a2:Articulo)
WHERE a1.descripcion <> a2.descripcion
RETURN t.descripcion, a1.descripcion, a2.descripcion, count(t.tipo_id)  
ORDER BY   count(t.tipo_id) DESC
LIMIT 5


##Recomendación de un artículo A basada en que dos artículos B y C aparezcan en la misma orden de salida.
MATCH (aB:Articulo)-[:TIENE_ARTICULO]->(oS1:orderSalida)<-[:TIENE_FOLIO]-(s1:Salida)-[:TIENE_FOLIO]->(oS2:orderSalida)<-[:TIENE_ARTICULO]-(aC:Articulo)-[:TIENE_ARTICULO]->(oS3:orderSalida)<-[:TIENE_FOLIO]-(s2:Salida)-[:TIENE_FOLIO]->(oS4:orderSalida)<-[:TIENE_ARTICULO]-(aA:Articulo)
WHERE (aB)-[:TIENE_ARTICULO]->(:orderSalida)<-[:TIENE_FOLIO]-(:Salida)-[:TIENE_FOLIO]->(:orderSalida)<-[:TIENE_ARTICULO]-(aA) AND aB.descripcion <> aC.descripcion
RETURN aB,oS1, s1, oS2, aA, oS3, s2, oS4, aC
LIMIT 1

MATCH (aB:Articulo)-[:TIENE_ARTICULO]->(oS1:orderSalida)<-[:TIENE_FOLIO]-(s1:Salida)-[:TIENE_FOLIO]->(oS2:orderSalida)<-[:TIENE_ARTICULO]-(aC:Articulo)-[:TIENE_ARTICULO]->(oS3:orderSalida)<-[:TIENE_FOLIO]-(s2:Salida)-[:TIENE_FOLIO]->(oS4:orderSalida)<-[:TIENE_ARTICULO]-(aA:Articulo)
WHERE (aB)-[:TIENE_ARTICULO]->(:orderSalida)<-[:TIENE_FOLIO]-(:Salida)-[:TIENE_FOLIO]->(:orderSalida)<-[:TIENE_ARTICULO]-(aA) AND aB.descripcion <> aC.descripcion
RETURN aB,oS1, s1, oS2, aA, oS3, s2, oS4, aC
LIMIT 5