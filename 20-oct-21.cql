
// Víctor Ortega
// 20-oct-21

// Cierra todas las ventanas
:clear 

// Notación básica para entender cypher

Node        ()
Relation    --    -->   <--  -[]-   -[]->   <-[]-
Reference   (n)  -[r]-    (el_tipo_de_nodo)  (a)   (b)
Label       (:product)   (:Product)  (:PRODUCT)   -[:ES_PARTE_DE]->  
Properties  (:product {desc:'mouse'})      -[:ES_PARTE_DE {precio:250}]-> 
Reference   (n:product {desc:'mouse'})    (El_producto_al_que_me_refiero_es:product {desc:'mouse'})


//Crea un nodo tipo “Estudiante”, sin atributos y muestra el resultado
CREATE (n:Estudiante)
RETURN n;

//Borra todos los nodos y relaciones sí existieran
MATCH (n)
DETACH DELETE n


//Creo un nodo con el atributo desc
CREATE (p:product {desc:'mouse'})
RETURN p;

//otra forma de crear nodos sin mostrarlos
CREATE 
(:product {desc:'monitor'}),
(:product {desc:'cámara'}), 
(:product {desc:'tableta'})

//Muestre el resultado como tabla
MATCH (n)
RETURN n.desc;



//otra forma de crear nodos sin mostrarlos
CREATE 
(:product {desc:'monitor'}),
(:product {desc:'cámara'}), 
(:product {desc:'tableta'}),
(:product {desc:'teclado'}),
(:product {desc:'mouse'})


//Creo una relación entre el teclado y el monitor con el nombre CONECTADO
MATCH (p:product{desc:'teclado'}), (m:product{desc:'monitor'})
CREATE (p)-[r:CONECTADO]->(m)
RETURN p,r,m; 


/// Nodos conectados
MATCH (n), (m)
WHERE (n)-[:CONECTADO]->(m)
RETURN n, m;

// Schema del grafo
call db.schema.visualization

// Muestra el historial de comandos de Cypher ejecutados
:history

//Carga la BD de películas
:play movie-graph