

//Crear los nodos Artículo
LOAD CSV WITH HEADERS FROM "file:///Articulo.csv" AS row
CREATE (n:Articulo)
SET n = row,
n.id_articulo = toInteger(row.id_articulo),
n.id_articulotipo = toInteger(row.id_articulotipo),
n.id_articulogrupo = toInteger(row.id_articulogrupo),
n.precio = toFloat(row.precio)


//Creo índice en Artículo
CREATE INDEX index_Articulo FOR (n:Articulo) ON (n.id_articulo)


//Crear los nodos ArtiucloGrupo
LOAD CSV WITH HEADERS FROM "file:///ArticuloGrupo.csv" AS row
CREATE (n:ArticuloGrupo)
SET n = row,
n.id_articulogrupo = toInteger(row.id_articulogrupo)

//Creo índice para ArtículoGrupo
CREATE INDEX index_ArticuloGrupo FOR (n:ArticuloGrupo) ON (n.id_articulogrupo)

//Creo la relación entre ArtículoGrupo y Artículo
MATCH (ag:ArticuloGrupo)
MATCH (a:Articulo)
WHERE ag.id_articulogrupo = a.id_articulogrupo
MERGE (ag)-[:TIENE_GRUPOS_DE]->(a)


//En caso de comenter un error borro los índices y la base de datos. Modifico mi script y lo ejecuto nuevamente

//Si quisiera quitar lel índice de ArtículoGrupo
DROP INDEX ON :ArticuloGrupo(id_articulogrupo)

//Si quisiera quitar lel índice de Artículo
DROP INDEX ON :Articulo(id_articulo)

//Sí quisiera borrar el contenido de la base de datos
MATCH (n) DETEACH DELETE n