DROP SCHEMA IF EXISTS inmobiliaria;
CREATE SCHEMA IF NOT EXISTS inmobiliaria;
USE inmobiliaria;

DROP TABLE IF EXISTS Propiedades;
DROP TABLE IF EXISTS Agentes;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Visitas;

CREATE TABLE Agentes (
    AgenteID INT PRIMARY KEY,
    NombreCompleto VARCHAR(100),
	Email VARCHAR(100),
    Telefono VARCHAR(20)
);

CREATE TABLE Propiedades (
    PropiedadID INT PRIMARY KEY,
    TipoDePropiedad VARCHAR(50),
    Direccion VARCHAR(100),
    Precio DECIMAL(10, 2),
    AgenteID INT,
    FOREIGN KEY (AgenteID) REFERENCES Agentes(AgenteID)
);


CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    NombreCompleto VARCHAR(100),
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);


CREATE TABLE Visitas (
    VisitaID INT PRIMARY KEY,
    PropiedadID INT,
    ClienteID INT,
    FechaVisita DATE,
    FOREIGN KEY (PropiedadID) REFERENCES Propiedades(PropiedadID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Caracteristicas (
    CaracteristicaID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE Comentarios (
    ComentarioID INT PRIMARY KEY,
    Texto TEXT,
    PropiedadID INT,
    FOREIGN KEY (PropiedadID) REFERENCES Propiedades(PropiedadID)
);

CREATE TABLE Reservas (
    ReservaID INT PRIMARY KEY,
    FechaReserva DATE,
    PropiedadID INT,
    ClienteID INT,
    FOREIGN KEY (PropiedadID) REFERENCES Propiedades(PropiedadID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Contratos (
    ContratoID INT PRIMARY KEY,
    FechaInicio DATE,
    FechaFin DATE,
    PropiedadID INT,
    ClienteID INT,
    FOREIGN KEY (PropiedadID) REFERENCES Propiedades(PropiedadID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
CREATE OR REPLACE VIEW VistaInmobiliaria AS
SELECT
    A.AgenteID,
    A.NombreCompleto AS NombreAgente,
    A.Email AS EmailAgente,
    A.Telefono AS TelefonoAgente,
    P.PropiedadID,
    P.TipoDePropiedad,
    P.Direccion AS DireccionPropiedad, 
    P.Precio,
    C.ClienteID,
    C.NombreCompleto AS NombreCliente,
    C.Email AS EmailCliente,
    C.Telefono AS TelefonoCliente
FROM
    Agentes A
    INNER JOIN Propiedades P ON A.AgenteID = P.AgenteID
    INNER JOIN Clientes C ON P.PropiedadID = C.ClienteID;
    
    CREATE OR REPLACE VIEW VistaInmobiliaria AS
SELECT
    P.PropiedadID,
    P.TipoDePropiedad,
    P.Direccion AS DireccionPropiedad,
    P.Precio,
    V.VisitaID,
    V.FechaVisita,
    C.ClienteID,
    C.NombreCompleto AS NombreCliente,
    C.Email AS EmailCliente,
    C.Telefono AS TelefonoCliente,
    A.AgenteID,
    A.NombreCompleto AS NombreAgente,
    A.Email AS EmailAgente,
    A.Telefono AS TelefonoAgente
FROM
    Propiedades P
    INNER JOIN Visitas V ON P.PropiedadID = V.PropiedadID
    INNER JOIN Clientes C ON V.ClienteID = C.ClienteID
    INNER JOIN Agentes A ON P.AgenteID = A.AgenteID;
    
    
INSERT INTO Agentes (AgenteID, NombreCompleto, Email, Telefono)
VALUES
    (1, 'Juan Pérez', 'juan@hotmail.com', '3415-123-4567'),
    (2, 'María González', 'maria@gmail.com', '3415-987-6543'),
    (3, 'Carlos Sánchez', 'carlos@hotmail.com', '3416-456-7890');
    
    
INSERT INTO Clientes (ClienteID, NombreCompleto, Email, Telefono)
VALUES
    (1, 'Laura Martínez', 'laura@gmail.com', '3416-234-5678'),
    (2, 'Pedro Rodríguez', 'pedro@hotmail.com', '3413-678-9012'),
    (3, 'Sofía López', 'sofia@gmail.com', '3416-345-6789');
    
    
INSERT INTO Propiedades (PropiedadID, TipoDePropiedad, Direccion, Precio, AgenteID)
VALUES
    (1, 'Casa', 'Bv. Rondeau 1540', 250.000, 1),
    (2, 'Apartamento', 'Rioja 2030', 150000.00, 2),
    (3, 'Casa', 'Misiones 223', 300000.00, 3);
    
    
INSERT INTO Visitas (VisitaID, PropiedadID, ClienteID, FechaVisita)
VALUES
    (1, 1, 1, '2023-10-01'),
    (2, 2, 2, '2023-10-02'),
    (3, 3, 3, '2023-10-03');
    
    
INSERT INTO Caracteristicas (CaracteristicaID, Nombre)
VALUES
    (1, 'Pileta'),
    (2, 'Garaje'),
    (3, 'Jardín');
    
    
INSERT INTO Comentarios (ComentarioID, Texto, PropiedadID)
VALUES
    (1, 'Excelente ubicación', 1),
    (2, 'Muy lujoso', 2),
    (3, 'Vistas impresionantes', 3);
    
    
INSERT INTO Reservas (ReservaID, FechaReserva, PropiedadID, ClienteID)
VALUES
    (1, '2023-09-15', 1, 1),
    (2, '2023-09-16', 2, 2),
    (3, '2023-09-17', 3, 3);
    
    
INSERT INTO Contratos (ContratoID, FechaInicio, FechaFin, PropiedadID, ClienteID)
VALUES
    (1, '2023-08-01', '2023-12-31', 1, 1),
    (2, '2023-07-15', '2023-12-15', 2, 2),
    (3, '2023-06-01', '2023-11-30', 3, 3);
    
CREATE OR REPLACE VIEW Agentes_Propiedades_Clientes AS
SELECT
    A.AgenteID,
    A.NombreCompleto AS NombreAgente,
    A.Email AS EmailAgente,
    A.Telefono AS TelefonoAgente,
    P.PropiedadID,
    P.TipoDePropiedad,
    P.Direccion AS DireccionPropiedad,
    P.Precio,
    C.ClienteID,
    C.NombreCompleto AS NombreCliente,
    C.Email AS EmailCliente,
    C.Telefono AS TelefonoCliente
FROM
    Agentes A
    INNER JOIN Propiedades P ON A.AgenteID = P.AgenteID
    INNER JOIN Clientes C ON P.PropiedadID = C.ClienteID;

CREATE OR REPLACE VIEW Propiedades_Vistas_Clientes_Agentes AS
SELECT
    P.PropiedadID,
    P.TipoDePropiedad,
    P.Direccion AS DireccionPropiedad,
    P.Precio,
    V.VisitaID,
    V.FechaVisita,
    C.ClienteID,
    C.NombreCompleto AS NombreCliente,
    C.Email AS EmailCliente,
    C.Telefono AS TelefonoCliente,
    A.AgenteID,
    A.NombreCompleto AS NombreAgente,
    A.Email AS EmailAgente,
    A.Telefono AS TelefonoAgente
FROM
    Propiedades P
    INNER JOIN Visitas V ON P.PropiedadID = V.PropiedadID
    INNER JOIN Clientes C ON V.ClienteID = C.ClienteID
    INNER JOIN Agentes A ON P.AgenteID = A.AgenteID;
    
CREATE OR REPLACE VIEW Propiedades_Caracteristicas_Comentarios AS
SELECT
    P.PropiedadID,
    P.TipoDePropiedad,
    P.Direccion AS DireccionPropiedad,
    P.Precio,
    C1.Nombre AS Caracteristica,
    C2.Texto AS Comentario
FROM
    Propiedades P
    LEFT JOIN Caracteristicas C1 ON P.PropiedadID = C1.CaracteristicaID
    LEFT JOIN Comentarios C2 ON P.PropiedadID = C2.PropiedadID;
    
CREATE OR REPLACE VIEW Propiedades_Reservas_Clientes AS
SELECT
    P.PropiedadID,
    P.TipoDePropiedad,
    P.Direccion AS DireccionPropiedad,
    P.Precio,
    R.ReservaID,
    R.FechaReserva,
    C.ClienteID,
    C.NombreCompleto AS NombreCliente,
    C.Email AS EmailCliente,
    C.Telefono AS TelefonoCliente
FROM
    Propiedades P
    INNER JOIN Reservas R ON P.PropiedadID = R.PropiedadID
    INNER JOIN Clientes C ON R.ClienteID = C.ClienteID;
    
CREATE OR REPLACE VIEW Propiedades_Contratos_Clientes AS
SELECT
    P.PropiedadID,
    P.TipoDePropiedad,
    P.Direccion AS DireccionPropiedad,
    P.Precio,
    Co.ContratoID,
    Co.FechaInicio,
    Co.FechaFin,
    C.ClienteID,
    C.NombreCompleto AS NombreCliente,
    C.Email AS EmailCliente,
    C.Telefono AS TelefonoCliente
FROM
    Propiedades P
    INNER JOIN Contratos Co ON P.PropiedadID = Co.PropiedadID
    INNER JOIN Clientes C ON Co.ClienteID = C.ClienteID;

