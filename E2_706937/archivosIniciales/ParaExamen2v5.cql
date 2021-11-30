
//Paso 1
//Inicia NEO4J y crea una base de datos nueva con las iniciales de tu carrera y número de expediente, por ejemplo IS123456


//Paso 2
//Copia todos los archivos csv a la carpeta import
//a la carpeta import de tu base de datos


//Paso 3 
//Inicia la base de datos y abre Neo4j Browser o el navegador de tu elección  


//Paso 4 
//Carga todos los clientes usando el siguiente código cypher 
LOAD CSV WITH HEADERS FROM "file:///Customer.csv" as row
CREATE (c:Customer)
SET c = row

//Paso 5 
//Carga todos los canales
LOAD CSV WITH HEADERS FROM "file:///Channel.csv" as row
CREATE (c:Channel)
SET c = row


//Paso 6
//Crea un índice para cliente
CREATE INDEX index_Customer FOR (n:Customer) ON (n.CustomerID)

//Paso 7
//Crea un índice para canal
CREATE INDEX index_Channel FOR (n:Channel) ON (n.Channel)


//Paso 8
//Crea las relaciones de los clientes que ven cada canal
LOAD CSV WITH HEADERS FROM "file:///ChannelCustomer.csv" AS row
MATCH (cl:Customer{CustomerID: row.CustomerID})
MATCH (ch:Channel{Channel: row.Channel})
MERGE (cl)-[r:WATCH]->(ch)


//Paso 9
//Carga todas las películas
LOAD CSV WITH HEADERS FROM "file:///Movie.csv" as row
CREATE (c:Movie)
SET c = row


//Paso 10
//Crea un índice para película
CREATE INDEX index_Movie FOR (n:Movie) ON (n.Movie)


//Paso 11
//Crea las relaciones de los clientes que califican cada película
LOAD CSV WITH HEADERS FROM "file:///MovieCustomer.csv" AS row
MATCH (cl:Customer{CustomerID: row.CustomerID})
MATCH (p:Movie{Movie: row.Movie})
MERGE (cl)-[r:RATE]->(p);


//***

//Age
    //Paso 12
    //Carga 
    LOAD CSV WITH HEADERS FROM "file:///Age.csv" as row
    CREATE (c:Age)
    SET c = row

    //Paso 13
    //Crea un índice 
    CREATE INDEX index_Age FOR (n:Age) ON (n.Age)

    //Paso 14
    //Crea las relaciones 
    LOAD CSV WITH HEADERS FROM "file:///AgeCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:Age{Age: row.Age})
    MERGE (cl)-[r:IS]->(p);
//    

//CellphoneService
    //Paso 15
    //Carga 
    LOAD CSV WITH HEADERS FROM "file:///CellphoneService.csv" as row
    CREATE (c:CellphoneService)
    SET c = row

    //Paso 16
    //Crea un índice 
    CREATE INDEX index_CellphoneService FOR (n:CellphoneService) ON (n.CellphoneService)

    //Paso 17
    //Crea las relaciones 
    LOAD CSV WITH HEADERS FROM "file:///CellphoneServiceCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:CellphoneService{CellphoneService: row.CellphoneService})
    MERGE (cl)-[r:HAS]->(p);
//   

//EducationLevel
    //Paso 15
    //Carga 
    LOAD CSV WITH HEADERS FROM "file:///EducationLevel.csv" as row
    CREATE (c:EducationLevel)
    SET c = row

    //Paso 16
    //Crea un índice 
    CREATE INDEX index_EducationLevel FOR (n:EducationLevel) ON (n.EducationLevel)

    //Paso 17
    //Crea las relaciones 
    LOAD CSV WITH HEADERS FROM "file:///EducationLevelCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:EducationLevel{EducationLevel: row.EducationLevel})
    MERGE (cl)-[r:HAS_EducationLevel_of]->(p);
//

//Gender
    //Paso 18
    //Carga 
    LOAD CSV WITH HEADERS FROM "file:///Gender.csv" as row
    CREATE (c:Gender)
    SET c = row

    //Paso 19
    //Crea un índice 
    CREATE INDEX index_Gender FOR (n:Gender) ON (n.Gender)

    //Paso 20
    //Crea las relaciones 
    LOAD CSV WITH HEADERS FROM "file:///GenderCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:Gender{Gender: row.Gender})
    MERGE (cl)-[r:IS_A]->(p);
//

//HomeOwnership
    //Paso 21
    //Carga todas  
    LOAD CSV WITH HEADERS FROM "file:///HomeOwnership.csv" as row
    CREATE (c:HomeOwnership)
    SET c = row

    //Paso 22
    //Crea un índice 
    CREATE INDEX index_HomeOwnership FOR (n:HomeOwnership) ON (n.HomeOwnership)

    //Paso 23
    //Crea las relaciones
    LOAD CSV WITH HEADERS FROM "file:///HomeOwnershipCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:HomeOwnership{HomeOwnership: row.HomeOwnership})
    MERGE (cl)-[r:IS_A_HomeOwnership]->(p);
//

//InternetConnection
    //Paso 24
    //Carga 
    LOAD CSV WITH HEADERS FROM "file:///InternetConnection.csv" as row
    CREATE (c:InternetConnection)
    SET c = row

    //Paso 25
    //Crea un índice 
    CREATE INDEX index_InternetConnection FOR (n:InternetConnection) ON (n.InternetConnection)

    //Paso 26
    //Crea las relaciones 
    LOAD CSV WITH HEADERS FROM "file:///InternetConnectionCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:InternetConnection{InternetConnection: row.InternetConnection})
    MERGE (cl)-[r:HAS_A_InternetConnection_WITH]->(p);
//

//MaritalStatus
    //Paso 27
    //Carga  
    LOAD CSV WITH HEADERS FROM "file:///MaritalStatus.csv" as row
    CREATE (c:MaritalStatus)
    SET c = row

    //Paso 28
    //Crea un índice 
    CREATE INDEX index_MaritalStatus FOR (n:MaritalStatus) ON (n.MaritalStatus)

    //Paso 29
    //Crea las relaciones 
    LOAD CSV WITH HEADERS FROM "file:///MaritalStatusCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:MaritalStatus{MaritalStatus: row.MaritalStatus})
    MERGE (cl)-[r:MaritalStatus_IS]->(p);
//

//MobileOperatingSystem
    //Paso 29
    //Carga 
    LOAD CSV WITH HEADERS FROM "file:///MobileOperatingSystem.csv" as row
    CREATE (c:MobileOperatingSystem)
    SET c = row

    //Paso 30
    //Crea un índice 
    CREATE INDEX index_MobileOperatingSystem FOR (n:MobileOperatingSystem) ON (n.MobileOperatingSystem)

    //Paso 31
    //Crea las relaciones 
    LOAD CSV WITH HEADERS FROM "file:///MobileOperatingSystemCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:MobileOperatingSystem{MobileOperatingSystem: row.MobileOperatingSystem})
    MERGE (cl)-[r:HAS_A_MobileOperatingSystem_WITH]->(p);
//


//NumCars
    //Paso 32
    //Carga 
    LOAD CSV WITH HEADERS FROM "file:///NumCars.csv" as row
    CREATE (c:NumCars)
    SET c = row

    //Paso 33
    //Crea un índice 
    CREATE INDEX index_NumCars FOR (n:NumCars) ON (n.NumCars)

    //Paso 34
    //Crea las relaciones 
    LOAD CSV WITH HEADERS FROM "file:///NumCarsCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:NumCars{NumCars: row.NumCars})
    MERGE (cl)-[r:HAS_NumCars]->(p);
//


//PPVFreq
    //Paso 35
    //Cargas 
    LOAD CSV WITH HEADERS FROM "file:///PPVFreq.csv" as row
    CREATE (c:PPVFreq)
    SET c = row

    //Paso 36
    //Crea un índice
    CREATE INDEX index_PPVFreq FOR (n:PPVFreq) ON (n.PPVFreq)

    //Paso 37
    //Crea las relaciones
    LOAD CSV WITH HEADERS FROM "file:///PPVFreqCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:PPVFreq{PPVFreq: row.PPVFreq})
    MERGE (cl)-[r:HAS_PPVFreq]->(p);
//

//StreamingRadio
    //Paso 38
    //Carga 
    LOAD CSV WITH HEADERS FROM "file:///StreamingRadio.csv" as row
    CREATE (c:StreamingRadio)
    SET c = row

    //Paso 39
    //Crea un índice 
    CREATE INDEX index_StreamingRadio FOR (n:StreamingRadio) ON (n.StreamingRadio)

    //Paso 40
    //Crea las relaciones 
    LOAD CSV WITH HEADERS FROM "file:///StreamingRadioCustomer.csv" AS row
    MATCH (cl:Customer{CustomerID: row.CustomerID})
    MATCH (p:StreamingRadio{StreamingRadio: row.StreamingRadio})
    MERGE (cl)-[r:HAS_StreamingRadio]->(p);
//