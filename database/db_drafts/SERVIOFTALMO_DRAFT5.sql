-- Create Database SERVIOFTALMO_DRAFT5
CREATE DATABASE SERVIOFTALMO_DRAFT5;
GO

-- Use the Database
USE SERVIOFTALMO_DRAFT5;
GO

-- Create PACIENTE table
CREATE TABLE PACIENTE (
    Id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100)NOT NULL,
    Apellidos_Casada VARCHAR(100),
    Fecha_Nacimiento DATE NOT NULL,
    DPI CHAR(13) NOT NULL, 
	No_Registro VARCHAR(20),
    Celular VARCHAR(20),
    Email VARCHAR(100),
    Profesion_u_oficio VARCHAR(100),
    Direccion VARCHAR(200),
    Contacto_emergencia1 VARCHAR(100),
    Telefono_emergencia1 VARCHAR(20),
    Contacto_emergencia2 VARCHAR(100),
    Telefono_emergencia2 VARCHAR(20),
    Historial_clinico VARCHAR(255),
    Especifique VARCHAR(255),
    Antecedente_importante VARCHAR(255),
    Fecha_Creacion DATE DEFAULT GETDATE(),
    Fecha_Eliminacion DATE,
    Estado BIT DEFAULT 1
);
GO

-- Create SEGURO_MEDICO table
CREATE TABLE SEGURO_MEDICO (
    Id_seguro INT IDENTITY(1,1) PRIMARY KEY,
    Id_paciente INT,
    Nombre_aseguradora VARCHAR(100),
    No_carnet VARCHAR(50),
    Id_asegurado VARCHAR(50),
    Poliza VARCHAR(25),
    Estado BIT DEFAULT 1,
    FOREIGN KEY (Id_paciente) REFERENCES PACIENTE(Id_paciente) --ON DELETE CASCADE
);
GO

-- Create DATOS_DE_FACTURACION table
CREATE TABLE DATOS_DE_FACTURACION (
    Id_datos_facturacion INT IDENTITY(1,1) PRIMARY KEY,  -- Added surrogate key
    Id_paciente INT,
    NIT VARCHAR(15) NOT NULL,
    Nombre_facturacion VARCHAR(100),
    Direccion VARCHAR(200),
    Estado BIT DEFAULT 1,
    FOREIGN KEY (Id_paciente) REFERENCES PACIENTE(Id_paciente) --ON DELETE CASCADE
);
GO

-- Create CONSULTA table
CREATE TABLE CONSULTA (
    Id_consulta INT IDENTITY(1,1) PRIMARY KEY,
    Id_paciente INT,
    Diagnostico VARCHAR(350),
	Fecha DATE,
    Estado BIT DEFAULT 1,
    FOREIGN KEY (Id_paciente) REFERENCES PACIENTE(Id_paciente) --ON DELETE CASCADE
);
GO

-- Create EXAMEN_OFTALMOLOGICO table
CREATE TABLE EXAMEN_OFTALMOLOGICO (
    Id_examen_oftalmologico INT IDENTITY(1,1) PRIMARY KEY,
    Id_consulta INT,
    Historia_clinica VARCHAR(255),
    Antecedentes VARCHAR(255),
	--Ojo Izquierdo
    Agudeza_sc_OjoIzquierdo DECIMAL(5,2),
	Agudeza_cc_OjoIzquierdo DECIMAL(5,2),
	TensionOcular_OjoIzquierdo DECIMAL(5,2),
	M_SPH_OjoIzquierdo DECIMAL(5,2),
    M_CYS_OjoIzquierdo DECIMAL(5,2),
    M_AXS_OjoIzquierdo DECIMAL(5,2),
	K1_OjoIzquierdo DECIMAL(5,2),
	k1_eje_OjoIzquierdo DECIMAL(5,2),
    K2_OjoIzquierdo DECIMAL(5,2),
    K2_eje_OjoIzquierdo DECIMAL(5,2),
	W_SPH_OjoIzquierdo DECIMAL(5,2),
    W_CYL_OjoIzquierdo DECIMAL(5,2),
    W_AXS_OjoIzquierdo DECIMAL(5,2),
	--Ojo Derecho
	Agudeza_sc_OjoDerecho DECIMAL(5,2),
	Agudeza_cc_OjoDerecho DECIMAL(5,2),
	TensionOcular_OjoDerecho DECIMAL(5,2),
    M_SPH_OjoDerecho DECIMAL(5,2),
    M_CYS_OjoDerecho DECIMAL(5,2),
    M_AXS_OjoDerecho DECIMAL(5,2),
    K1_OjoDerecho DECIMAL(5,2),
	k1_eje_OjoDerecho DECIMAL(5,2),
    K2_OjoDerecho DECIMAL(5,2),
    K2_eje_OjoDerecho DECIMAL(5,2),
    W_SPH_OjoDerecho DECIMAL(5,2),
    W_CYL_OjoDerecho DECIMAL(5,2),
    W_AXS_OjoDerecho DECIMAL(5,2),
	--Final de los datos
    Diagnostico VARCHAR(255),
    Tratamiento VARCHAR(255),
    Estado BIT DEFAULT 1,
    FOREIGN KEY (Id_consulta) REFERENCES CONSULTA(Id_consulta) --ON DELETE CASCADE
);
GO

-- Create RECETA_ANTEOJOS table
CREATE TABLE RECETA_ANTEOJOS (
    Id_receta_anteojos INT IDENTITY(1,1) PRIMARY KEY,
    Id_consulta INT,
    Fecha DATE,
    Nombre VARCHAR(100),
    Od_esfera_lejos DECIMAL(5,2),
    Od_cilindro_lejos DECIMAL(5,2),
    Od_eje_lejos DECIMAL(5,2),
    Od_prisma_lejos DECIMAL(5,2),
	Od_base_lejos DECIMAL(5,2),
    Od_color_lejos DECIMAL(5,2),
    Os_esfera_lejos DECIMAL(5,2),
    Os_cilindro_lejos DECIMAL(5,2),
    Os_eje_lejos DECIMAL(5,2),
    Os_prisma_lejos DECIMAL(5,2),
	Os_base_lejos DECIMAL(5,2),
    Os_color_lejos DECIMAL(5,2),
    Od_esfera_adicion DECIMAL(5,2),
    Od_cilindro_adicion DECIMAL(5,2),
    Od_eje_adicion DECIMAL(5,2),
    Os_esfera_adicion DECIMAL(5,2),
    Os_cilindro_adicion DECIMAL(5,2),
    Os_eje_adicion DECIMAL(5,2),
    Estilo VARCHAR(255),
    Estado BIT DEFAULT 1,
    FOREIGN KEY (Id_consulta) REFERENCES CONSULTA(Id_consulta) --ON DELETE CASCADE
);
GO
