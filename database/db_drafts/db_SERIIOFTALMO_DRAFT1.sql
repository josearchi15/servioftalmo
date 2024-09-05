--CREATE DATABASE SERVIOFTALMO_DRAFT1
USE SERVIOFTALMO_DRAFT1

 Create PACIENTE table
CREATE TABLE PACIENTE (
    Id_paciente INT PRIMARY KEY,
    Nombres VARCHAR(100),
    Apellidos VARCHAR(100),
    Apellidos_Casada VARCHAR(100),
    DPI VARCHAR(20),
    Celular VARCHAR(20),
    Email VARCHAR(100),
    Direccion VARCHAR(200),
    Profesion_u_oficio VARCHAR(100),
    Contacto_emergencia1 VARCHAR(100),
    Telefono_emergencia1 VARCHAR(20),
    Contacto_emergencia2 VARCHAR(100),
    Telefono_emergencia2 VARCHAR(20),
    Historial_clinico TEXT,
    Especifique TEXT,
    Antecedente_importante TEXT
);

-- Create SEGURO_MEDICO table
CREATE TABLE SEGURO_MEDICO (
    Id_seguro INT PRIMARY KEY,
    Id_paciente INT,
    Nombre_aseguradora VARCHAR(100),
    No_carnet VARCHAR(50),
    Id_asegurado VARCHAR(50),
    FOREIGN KEY (Id_paciente) REFERENCES PACIENTE(Id_paciente)
);

 Create FACTURACION table
CREATE TABLE FACTURACION (
    NIT VARCHAR(15) PRIMARY KEY,
    Id_paciente INT,
    Nombre_facturacion VARCHAR(100),
    Direccion VARCHAR(200),
    FOREIGN KEY (Id_paciente) REFERENCES PACIENTE(Id_paciente)
);

-- Create CONSULTA table
CREATE TABLE CONSULTA (
    Id_consulta INT PRIMARY KEY,
    Id_paciente INT,
    Diagnostico TEXT,
    Id_examen INT,  -- Define details of Id_examen based on specific needs
    Dato_receta_medica INT,
    Dato_receta_anteojos INT,
    FOREIGN KEY (Id_paciente) REFERENCES PACIENTE(Id_paciente)
);

-- Create RECETA_MEDICA table
CREATE TABLE RECETA_MEDICA (
    Dato_receta_medica INT PRIMARY KEY,
    id_consulta INT,
    Historia_clinica VARCHAR(255),
    Antecedentes VARCHAR(255),
    Agudeza_sc_de INT,
    Ex_externo_de INT,
    Seg_ant_de INT,
    Medios_de INT,
    Fondos_de INT,
    Agudeza_sc_iz INT,
    Ex_externo_iz INT,
    Seg_ant_iz INT,
    Medios_iz INT,
    Fondos_iz INT,
    M_esfericas INT,
    M_cilindricas INT,
    M_eje INT,
    K1 INT,
    K2 INT,
    W_esfera INT,
    W_cilindro INT,
    W_eje INT,
    W_prisma INT,
    W_base INT,
    Diagnostico VARCHAR(255),
    Tratamiento VARCHAR(255),
    FOREIGN KEY (id_consulta) REFERENCES CONSULTA(Id_consulta)
);

-- Create RECETA_ANTEOJOS table
CREATE TABLE RECETA_ANTEOJOS (
    Dato_receta_anteojos INT PRIMARY KEY,
    id_consulta INT,
    Fecha DATE,
    Nombre VARCHAR(100),
    Od_esfera_lejos INT,
    Od_cilindro_lejos INT,
    Od_eje_lejos INT,
    Od_prisma_lejos INT,
    Od_color_lejos INT,
    Os_esfera_lejos INT,
    Os_cilindro_lejos INT,
    Os_eje_lejos INT,
    Os_prisma_lejos INT,
    Os_color_lejos INT,
    Od_esfera_adicion INT,
    Od_cilindro_adicion INT,
    Od_eje_adicion INT,
    Os_esfera_adicion INT,
    Os_cilindro_adicion INT,
    Os_eje_adicion INT,
    Vision_simple VARCHAR(50),
    Bifocal VARCHAR(50),
    Multifocal VARCHAR(50),
    Antireflejante VARCHAR(50),
    Blue_screen VARCHAR(50),
    Plastico VARCHAR(50),
    Policarbonato VARCHAR(50),
    Polarizado VARCHAR(50),
    Solo_cerca VARCHAR(50),
    Dos_pares VARCHAR(50),
    FOREIGN KEY (id_consulta) REFERENCES CONSULTA(Id_consulta)
);
