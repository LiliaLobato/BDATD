CREATE DATABASE E706937;

-- ************************************** [DimCuentaBancaria]
CREATE TABLE [DimCuentaBancaria]
(
 [id_CuentaBancaria] int NOT NULL ,
 [Numero]            varchar(50) NOT NULL ,
 [Banco]             varchar(50) NOT NULL ,
 [TipoCuenta]        nvarchar(10) NOT NULL ,


 CONSTRAINT [PK_89] PRIMARY KEY CLUSTERED ([id_CuentaBancaria] ASC)
);

-- ************************************** [DimProveedor]
CREATE TABLE [DimProveedor]
(
 [id_proveedor] int NOT NULL ,
 [razonSocial]  varchar(250) NOT NULL ,
 [colonia]      varchar(50) NOT NULL ,

 CONSTRAINT [PK_85] PRIMARY KEY CLUSTERED ([id_proveedor] ASC)
);
GO


-- ************************************** [time]
CREATE TABLE [DimTime]
(
 [id_time]   bigint NOT NULL ,
 [year]      int NOT NULL ,
 [month]     int NOT NULL ,
 [dayWek]    varchar(50) NOT NULL ,
 [trimester] int NOT NULL ,
 [semester]  int NOT NULL ,


 CONSTRAINT [PK_79] PRIMARY KEY CLUSTERED ([id_time] ASC)
);
GO

-- ************************************** [FactPago]
CREATE TABLE [FactPago]
(
 [id_Pago]           int NOT NULL ,
 [id_time]           bigint NOT NULL ,
 [id_CuentaBancaria] int NOT NULL ,
 [id_proveedor]      int NOT NULL ,
 [totalPago]        int NOT NULL ,
 [numMovimientos]   int NOT NULL ,


 CONSTRAINT [PK_125] PRIMARY KEY CLUSTERED ([id_Pago] ASC),
 CONSTRAINT [FK_113] FOREIGN KEY ([id_time])  REFERENCES [DimTime]([id_time]),
 CONSTRAINT [FK_116] FOREIGN KEY ([id_CuentaBancaria])  REFERENCES [DimCuentaBancaria]([id_CuentaBancaria]),
 CONSTRAINT [FK_119] FOREIGN KEY ([id_proveedor])  REFERENCES [DimProveedor]([id_proveedor])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_115] ON [FactPago] 
 (
  [id_time] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_118] ON [FactPago] 
 (
  [id_CuentaBancaria] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_121] ON [FactPago] 
 (
  [id_proveedor] ASC
 )

GO