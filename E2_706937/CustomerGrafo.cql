##4.2
##CutomerID, número de peliculas que ha calificado y una colección de los nombres sin repetirse
MATCH (n:Customer),(a:Movie)
WHERE (n)-[:RATE]->(a)
RETURN DISTINCT n.CustomerID,count(a.Movie), collect(distinct a.Movie)
ORDER BY count(a.Movie) DESC
LIMIT 3

##4.3
##La ruta más corta entre cliente 885341 y canal ESPN. 
MATCH (n:Customer{CustomerID:"885341"}), (m:Channel{Channel:"ESPN"}),
      path = shortestpath((n)-[*]-(m))
RETURN path
ORDER BY LENGTH(path) DESC
LIMIT 1

##4.4
##Cliente con más peliculas
MATCH (n:Customer),(a:Movie)
WHERE (n)-[:RATE]->(a)
RETURN DISTINCT n.CustomerID,count(a.Movie) 
ORDER BY count(a.Movie) DESC
LIMIT 1
##Cliente con menos peliculas
MATCH (n:Customer),(a:Movie)
WHERE (n)-[:RATE]->(a)
RETURN DISTINCT n.CustomerID,count(a.Movie) 
ORDER BY count(a.Movie) ASC
LIMIT 1
##La ruta más corta entre ellos. 
MATCH (n:Customer{CustomerID:"917231"}), (m:Customer{CustomerID:"888978"}),
      path = shortestpath((n)-[*]-(m))
RETURN path
ORDER BY LENGTH(path) DESC
LIMIT 1


##4.5
##Recomienda una película a los clientes que hayan visto "101 Dalmatians" y que sean casados (MaritalStatus:"Married")
MATCH (M1:Movie{Movie:"101 Dalmatians"})<-[:RATE]-(oS1:Customer)-[:MaritalStatus_IS]->(s:MaritalStatus{MaritalStatus:"Married"})<-[:MaritalStatus_IS]-(oS2:Customer)-[:RATE]->(M2:Movie)
WHERE oS1.CustomerID <> oS2.CustomerID
RETURN M2.Movie
LIMIT 5

##4.6
##Recomienda una película a los clientes que ven el canal "Cartoon Network" y que EducationLevel sea "Bachelor"
MATCH (M1:Channel{Channel:"Cartoon Network"})<-[:WATCH]-(oS1:Customer)-[:HAS_EducationLevel_of]->(s:EducationLevel{EducationLevel:"Bachelor"})<-[:HAS_EducationLevel_of]-(oS2:Customer)-[:WATCH]->(M2:Channel)
WHERE oS1.CustomerID <> oS2.CustomerID
RETURN M2.Channel
LIMIT 5

##4.7
##Una recomendación a tu elección
MATCH (M1:Movie{Movie:"12 Angry Men"})<-[:RATE]-(oS1:Customer)-[:MaritalStatus_IS]->(s:MaritalStatus{MaritalStatus:"Never Married"})<-[:MaritalStatus_IS]-(oS2:Customer)-[:RATE]->(M2:Movie)
WHERE oS1.CustomerID <> oS2.CustomerID
RETURN M2.Movie
LIMIT 5