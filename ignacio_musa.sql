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
    Direccio VARCHAR(100),
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


