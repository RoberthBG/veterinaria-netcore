USE MASTER
GO
IF EXISTS(SELECT * FROM  sys.databases WHERE name='veterinaria')
	DROP DATABASE VETERINARIA
GO
CREATE DATABASE VETERINARIA
GO
USE VETERINARIA
GO
CREATE TABLE Servicios(
	ID			INT NOT NULL IDENTITY(1,1),
	Titulo		VARCHAR(50) NOT NULL,
	Descripcion	VARCHAR(200) NOT NULL,
	PathImagen	VARCHAR(100),
	Precio		NUMERIC(6,2),
	Activo		BIT
	CONSTRAINT PKServicios PRIMARY KEY(ID) ,
	CONSTRAINT UQNombreServicios UNIQUE(Titulo)
)
GO
INSERT INTO Servicios(Titulo, Descripcion, Precio, PathImagen, Activo)
VALUES	('Consultas Veterinarias', 'Cuidamos la salud de tu mascota con amor y atención profesional en cada diagnóstico.', 20.00, 'assets/img/consulta.jpg', 1),
		('Vacunación y Desparasitación', 'Protegemos a tu compañero con vacunas y desparasitación, brindándole bienestar y una vida saludable.', 35.80, 'assets/img/vacunacion.jpg', 1),
		('Baño y Peluquería', 'Embellecemos a tu mascota con cariño, asegurando higiene, frescura y un look adorable.', 45.90, 'assets/img/peluqueria.jpg', 1)
GO
SELECT * FROM SERVICIOS
GO
CREATE TABLE CategoriaProductos(
	ID			INT NOT NULL IDENTITY(1,1),
	Nombre		VARCHAR(50) NOT NULL,
	Activo		CHAR(1)
	CONSTRAINT PKCategoriaProductos PRIMARY KEY(ID),
	CONSTRAINT UQNombreCategoriaProductos UNIQUE(Nombre)
)
GO
INSERT INTO CategoriaProductos(Nombre, Activo)
VALUES	('Alimentos', '1'),
		('Antiparasitario', '1')
GO
CREATE TABLE Productos(
	ID			INT NOT NULL IDENTITY(1,1),
	Nombre		VARCHAR(80) NOT NULL,
	Descripcion	VARCHAR(150) NOT NULL,
	PathImagen	VARCHAR(100),
	Precio		NUMERIC(6,2),
	CategoriaID	INT NOT NULL,
	Activo		CHAR(1)
	CONSTRAINT PKProductos PRIMARY KEY(ID),
	CONSTRAINT UQNombreProductos UNIQUE(Nombre),
	CONSTRAINT FKCategoria_Productos FOREIGN KEY(CategoriaID) 
		REFERENCES CategoriaProductos(ID)
)
GO
INSERT INTO Productos(Nombre, Descripcion, CategoriaID, Precio, PathImagen, Activo)
VALUES('NutriBites Beef Sticks','Premium Fresh Natural Pet Treats',1,13.2,'assets/img/productos/nbs1.jpg','1'),
('NutriBites Chicken & Rice Sticks','Premium Fresh Natural Pet Treats',1,8.3,'assets/img/productos/nbc2.jpg','1'),
('NutriBites Chicken Sandwiches','Premium Fresh Natural Pet Treats',1,9.5,'assets/img/productos/nbs1.jpg','1'),
('Pro Pac Ultimates Bayside Select','Alimento Super Premium para perros libre de granos',1,341.3,'assets/img/productos/pubs4.jpg','1'),
('Pro Pac Ultimates Puppy Chicken Meal & Rice','Alimento Super Premium para perros',1,315.2,'assets/img/productos/pupc5.jpg','1'),
('Pro Pac Ultimates Cat Savanna Pride','Alimento Super Premium para gatos libre de granos',1,216,'assets/img/productos/pucsp6.jpg','1'),
('Fórmula Natural Fresh Meat - Gato Pelos Largos','Alimento Super Premium Grain Free',1,43.6,'assets/img/productos/fnfmg7.jpg','1'),
('Fórmula Natural Fresh Meat - Gato Adulto Castrado Sabor Carne','Alimento Super Premium Grain Free',1,43.2,'assets/img/productos/fnfmgsc8.jpg','1'),
('Fórmula Natural Fresh Meat - Gatos Senior','Alimento Super Premium Grain Free',1,43,'assets/img/productos/fnfmgs9.jpg','1'),
('Fórmula Natural Fresh Meat - Perros Adultos Sensitive Razas Medianas y Grandes','Alimento Super Premium Grain Free',1,403,'assets/img/productos/fnfmpasrmg10.jpg','1'),
('Triverfén 22.2','Antiparasitario de espectro completo',2,65.5,'assets/img/productos/t211.jpg','1'),
('Gallomec Plus Px','Antiparasitario de espectro total específico para aves.',2,160,'assets/img/productos/gpp12.jpg','1'),
('Oxantel 5','Antiparasitario interno',2,18.9,'assets/img/productos/o513.jpg','1'),
('Ultrametrin 600','Asociación piretroide-fosforado potencializada',2,7.6,'assets/img/productos/u60014.jpg','1'),
('Proventis 10','Ectoparasiticida en tabletas palatables compuesto',2,132.4,'assets/img/productos/p1015.jpg','1'),
('Xelamec Spot On - 2ml - De 10kg a 20kg','Antiparasitario interno y externo para perros y gatos',2,179.2,'assets/img/productos/xso16.jpg','1'),
('Atrevia Trio Cats Spot On Medium (2.9 - 6.25 kg)','Ecto-endoparasitario Topical de Múltiple Acción con 12 Semanas de Protección',2,113,'assets/img/productos/atcsom17.jpg','1'),
('Suralan X-Large (40 - 60kg)','Ectoparasitario Oral de Dosis Baja de Acción',2,85.9,'assets/img/productos/sxl18.jpg','1'),
('Suralan Mini (2.5 - 5kg)','Ectoparasitario Oral de Dosis Baja de Acción Inmediata y por 5 Semanas Controla Pulgas, Garrapatas y Ácaros en Perros',2,48.2,'assets/img/productos/sm19.jpg','1'),
('Suralan Medium (10 - 20kg)','Ectoparasitario Oral de Dosis Baja de Acción Inmediata y por 5 Semanas Controla Pulgas, Garrapatas y Ácaros en Perros',2,56.7,'assets/img/productos/sm20.jpg','1')
GO

SELECT * FROM Productos
GO

--------
SELECT * FROM SERVICIOS
SELECT * FROM CategoriaProductos
SELECT * FROM Productos
