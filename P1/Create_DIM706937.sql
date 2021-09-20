CREATE DATABASE DIM706937;

-- ************************************** [almacen]
CREATE TABLE [almacen]
(
 [almacen_id]  int NOT NULL ,
 [descripcion] varchar(50) NOT NULL ,


 CONSTRAINT [PK_48] PRIMARY KEY CLUSTERED ([almacen_id] ASC)
);

-- ************************************** [articulo]
CREATE TABLE [articulo]
(
 [articulo_id] int NOT NULL ,
 [codigo]      varchar(50) NOT NULL ,
 [descripcion] varchar(100) NOT NULL ,
 [color]       varchar(50) ,
 [umd]         varchar(50) NOT NULL ,


 CONSTRAINT [PK_15] PRIMARY KEY CLUSTERED ([articulo_id] ASC)
);

-- ************************************** [cliente]
CREATE TABLE [cliente]
(
 [cliente_id]  int NOT NULL ,
 [razonSocial] varchar(50) NOT NULL ,
 [colonia]     varchar(50) NOT NULL ,
 [CP]          int NOT NULL ,


 CONSTRAINT [PK_9] PRIMARY KEY CLUSTERED ([cliente_id] ASC)
);

-- ************************************** [grupo]
CREATE TABLE [grupo]
(
 [grupo_id]    int NOT NULL ,
 [description] varchar(50) NOT NULL ,


 CONSTRAINT [PK_5] PRIMARY KEY CLUSTERED ([grupo_id] ASC)
);

-- ************************************** [salida]
CREATE TABLE [salida]
(
 [salida_id] int NOT NULL ,
 [folio]     varchar(50) NOT NULL ,


 CONSTRAINT [PK_44] PRIMARY KEY CLUSTERED ([salida_id] ASC)
);

-- ************************************** [time]
CREATE TABLE [time]
(
 [time_id]     bigint NOT NULL ,
 [year]        int NOT NULL ,
 [semester]    int NOT NULL ,
 [trimester]   int NOT NULL ,
 [month]       int NOT NULL ,
 [day]         int NOT NULL ,
 [dayWeek]     varchar(50) NOT NULL ,
 [monthLetter] varchar(50) NOT NULL ,


 CONSTRAINT [PK_30] PRIMARY KEY CLUSTERED ([time_id] ASC)
);

-- ************************************** [tipo]
CREATE TABLE [tipo]
(
 [tipo_id]     int NOT NULL ,
 [descripcion] varchar(50) NOT NULL ,


 CONSTRAINT [PK_40] PRIMARY KEY CLUSTERED ([tipo_id] ASC)
);

-- ************************************** [vendedor]
CREATE TABLE [vendedor]
(
 [vendedor_id] int NOT NULL ,
 [nombre]      varchar(50) NOT NULL ,


 CONSTRAINT [PK_22] PRIMARY KEY CLUSTERED ([vendedor_id] ASC)
);

-- ************************************** [orderSalida]
CREATE TABLE [orderSalida]
(
 [time_id]           bigint NOT NULL ,
 [salida_id]         int NOT NULL ,
 [tipo_id]           int NOT NULL ,
 [almacen_id]        int NOT NULL ,
 [vendedor_id]       int ,
 [articulo_id]       int NOT NULL ,
 [cliente_id]        int ,
 [grupo_id]          int NOT NULL ,
 [cantidadArticulos] bigint NOT NULL ,
 [numeroSalidas]     bigint NOT NULL ,


 CONSTRAINT [FK_63] FOREIGN KEY ([time_id])  REFERENCES [time]([time_id]),
 CONSTRAINT [FK_66] FOREIGN KEY ([grupo_id])  REFERENCES [grupo]([grupo_id]),
 CONSTRAINT [FK_69] FOREIGN KEY ([cliente_id])  REFERENCES [cliente]([cliente_id]),
 CONSTRAINT [FK_72] FOREIGN KEY ([articulo_id])  REFERENCES [articulo]([articulo_id]),
 CONSTRAINT [FK_75] FOREIGN KEY ([vendedor_id])  REFERENCES [vendedor]([vendedor_id]),
 CONSTRAINT [FK_82] FOREIGN KEY ([almacen_id])  REFERENCES [almacen]([almacen_id]),
 CONSTRAINT [FK_86] FOREIGN KEY ([tipo_id])  REFERENCES [tipo]([tipo_id]),
 CONSTRAINT [FK_89] FOREIGN KEY ([salida_id])  REFERENCES [salida]([salida_id])
);


CREATE NONCLUSTERED INDEX [fkIdx_65] ON [orderSalida] 
 (
  [time_id] ASC
 );

CREATE NONCLUSTERED INDEX [fkIdx_68] ON [orderSalida] 
 (
  [grupo_id] ASC
 );

CREATE NONCLUSTERED INDEX [fkIdx_71] ON [orderSalida] 
 (
  [cliente_id] ASC
 );

CREATE NONCLUSTERED INDEX [fkIdx_74] ON [orderSalida] 
 (
  [articulo_id] ASC
 );

CREATE NONCLUSTERED INDEX [fkIdx_77] ON [orderSalida] 
 (
  [vendedor_id] ASC
 );

CREATE NONCLUSTERED INDEX [fkIdx_84] ON [orderSalida] 
 (
  [almacen_id] ASC
 );

CREATE NONCLUSTERED INDEX [fkIdx_88] ON [orderSalida] 
 (
  [tipo_id] ASC
 );

CREATE NONCLUSTERED INDEX [fkIdx_91] ON [orderSalida] 
 (
  [salida_id] ASC
 );
GO
