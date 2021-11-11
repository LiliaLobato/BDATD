##Crear los nodos Almacen (2)
LOAD CSV WITH HEADERS FROM "file:///almacen.csv" AS row
CREATE (n:Almacen)
SET n = row,
n.almacen_id = toInteger(row.almacen_id)
##Creo índice en Almacen
CREATE INDEX index_Almacen FOR (n:Almacen) ON (n.almacen_id)

##Crear los nodos Articulo (881)
LOAD CSV WITH HEADERS FROM "file:///articulo.csv" AS row
CREATE (n:Articulo)
SET n = row,
n.articulo_id = toInteger(row.articulo_id)
##Creo índice en Articulo
CREATE INDEX index_Articulo FOR (n:Articulo) ON (n.articulo_id)

##Crear los nodos Cliente (930)
LOAD CSV WITH HEADERS FROM "file:///cliente.csv" AS row
CREATE (n:Cliente)
SET n = row,
n.cliente_id = toInteger(row.cliente_id),
n.CP = toInteger(row.CP)
##Creo índice en Cliente
CREATE INDEX index_Cliente FOR (n:Cliente) ON (n.cliente_id)

##Crear los nodos Grupo (45)
LOAD CSV WITH HEADERS FROM "file:///grupo.csv" AS row
CREATE (n:Grupo)
SET n = row,
n.grupo_id = toInteger(row.grupo_id)
##Creo índice en Grupo
CREATE INDEX index_Grupo FOR (n:Grupo) ON (n.grupo_id)

##Crear los nodos Salida (6513)
LOAD CSV WITH HEADERS FROM "file:///salida.csv" AS row
CREATE (n:Salida)
SET n = row,
n.salida_id = toInteger(row.salida_id)
##Creo índice en Salida
CREATE INDEX index_Salida FOR (n:Salida) ON (n.salida_id)

##Crear los nodos Time (3257)
LOAD CSV WITH HEADERS FROM "file:///time.csv" AS row
CREATE (n:Time)
SET n = row,
n.time_id = toInteger(row.time_id),
n.year = toInteger(row.year),
n.semester = toInteger(row.semester),
n.trimester = toInteger(row.trimester),
n.month = toInteger(row.month),
n.day = toInteger(row.day)
##Creo índice en Time
CREATE INDEX index_Time FOR (n:Time) ON (n.time_id)

##Crear los nodos Tipo (10)
LOAD CSV WITH HEADERS FROM "file:///tipo.csv" AS row
CREATE (n:Tipo)
SET n = row,
n.tipo_id = toInteger(row.tipo_id)
##Creo índice en Tipo
CREATE INDEX index_Tipo FOR (n:Tipo) ON (n.tipo_id)

##Crear los nodos Vendedor (5)
LOAD CSV WITH HEADERS FROM "file:///vendedor.csv" AS row
CREATE (n:Vendedor)
SET n = row,
n.vendedor_id = toInteger(row.vendedor_id)
##Creo índice en Vendedor
CREATE INDEX index_Vendedor FOR (n:Vendedor) ON (n.vendedor_id)

##Crear los nodos orderSalida (15049)
LOAD CSV WITH HEADERS FROM "file:///orderSalida.csv" AS row
CREATE (n:orderSalida)
SET n = row,
n.time_id = toInteger(row.time_id),
n.salida_id = toInteger(row.salida_id),
n.tipo_id = toInteger(row.tipo_id),
n.almacen_id = toInteger(row.almacen_id),
n.vendedor_id = toInteger(row.vendedor_id),
n.articulo_id = toInteger(row.articulo_id),
n.cliente_id = toInteger(row.cliente_id),
n.grupo_id = toInteger(row.grupo_id),
n.cantidadArticulos = toInteger(row.cantidadArticulos),
n.numeroSalidas = toInteger(row.numeroSalidas)
##Creo índice en orderSalida
CREATE INDEX index_orderSalidaTime FOR (n:orderSalida) ON (n.time_id)
CREATE INDEX index_orderSalidaSalida FOR (n:orderSalida) ON (n.salida_id)
CREATE INDEX index_orderSalidaTipo FOR (n:orderSalida) ON (n.tipo_id) ##ERROR
CREATE INDEX index_orderSalidaAlmacen FOR (n:orderSalida) ON (n.almacen_id)
CREATE INDEX index_orderSalidaVendedor FOR (n:orderSalida) ON (n.vendedor_id)
CREATE INDEX index_orderSalidaArticulo FOR (n:orderSalida) ON (n.articulo_id)
CREATE INDEX index_orderSalidaCliente FOR (n:orderSalida) ON (n.cliente_id)
CREATE INDEX index_orderSalidaGrupo FOR (n:orderSalida) ON (n.grupo_id)

#########################################################################
##Creo la relación entre orderSalida y Time (15049)
MATCH (os:orderSalida)
MATCH (t:Time)
WHERE os.time_id = t.time_id
MERGE (t)-[:TIENE_FECHA_DE]->(os)
##Creo la relación entre orderSalida y Salida (15049)
MATCH (os:orderSalida)
MATCH (s:Salida)
WHERE os.salida_id = s.salida_id
MERGE (s)-[:TIENE_FOLIO]->(os)
##Creo la relación entre orderSalida y Almacen (15049)
MATCH (os:orderSalida)
MATCH (a:Almacen)
WHERE os.almacen_id = a.almacen_id
MERGE (a)-[:SALE_DE]->(os)
##Creo la relación entre orderSalida y Vendedor (14138)
MATCH (os:orderSalida)
MATCH (v:Vendedor)
WHERE os.vendedor_id = v.vendedor_id
MERGE (v)-[:VENDIDO_POR]->(os)
##Creo la relación entre orderSalida y Articulo (15049)
MATCH (os:orderSalida)
MATCH (a:Articulo)
WHERE os.articulo_id = a.articulo_id
MERGE (a)-[:TIENE_ARTICULO]->(os)
##Creo la relación entre orderSalida y Cliente (14138)
MATCH (os:orderSalida)
MATCH (c:Cliente)
WHERE os.cliente_id = c.cliente_id
MERGE (c)-[:COMPRADO_POR]->(os)
##Creo la relación entre orderSalida y Grupo (15049)
MATCH (os:orderSalida)
MATCH (g:Grupo)
WHERE os.grupo_id = g.grupo_id
MERGE (g)-[:TIENE_GRUPO]->(os)
##Creo la relación entre orderSalida y Tipo (15049)
MATCH (os:orderSalida)
MATCH (t:Tipo)
WHERE os.tipo_id = t.tipo_id
MERGE (t)-[:TIENE_TIPO]->(os)


##En caso de comenter un error borro los índices y la base de datos. 
##Modifico mi script y lo ejecuto nuevamente
##Si quisiera quitar lel índice de ArtículoGrupo
DROP INDEX ON :ArticuloGrupo(id_articulogrupo)
##Si quisiera quitar lel índice de Artículo
DROP INDEX ON :Articulo(id_articulo)
##Sí quisiera borrar el contenido de la base de datos
MATCH (n) DETEACH DELETE n