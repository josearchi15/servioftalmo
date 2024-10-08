USE [master]
GO
/****** Object:  Database [SERVIOFTALMO_DRAFT5]    Script Date: 2/09/2024 17:30:41 ******/
CREATE DATABASE [SERVIOFTALMO_DRAFT5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SERVIOFTALMO_DRAFT5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SERVIOFTALMO_DRAFT5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SERVIOFTALMO_DRAFT5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SERVIOFTALMO_DRAFT5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SERVIOFTALMO_DRAFT5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET ARITHABORT OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET RECOVERY FULL 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET  MULTI_USER 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SERVIOFTALMO_DRAFT5', N'ON'
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET QUERY_STORE = ON
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SERVIOFTALMO_DRAFT5]
GO
/****** Object:  UserDefinedFunction [dbo].[getLastPacienteId]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 31/08/2024
-- Description:	Function to get last IdPaciente inserted
-- =============================================
CREATE FUNCTION [dbo].[getLastPacienteId] ()
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @IdPaciente int

	-- Add the T-SQL statements to compute the return value here
	SET @IdPaciente = (SELECT TOP 1 Id_paciente FROM PACIENTE WHERE Estado = 1 
	ORDER BY Id_paciente DESC)

	-- Return the result of the function
	RETURN @IdPaciente

END
GO
/****** Object:  Table [dbo].[PACIENTE]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACIENTE](
	[Id_paciente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[Apellidos_Casada] [varchar](100) NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[DPI] [char](13) NOT NULL,
	[No_Registro] [varchar](20) NULL,
	[Celular] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Profesion_u_oficio] [varchar](100) NULL,
	[Direccion] [varchar](200) NULL,
	[Contacto_emergencia1] [varchar](100) NULL,
	[Telefono_emergencia1] [varchar](20) NULL,
	[Contacto_emergencia2] [varchar](100) NULL,
	[Telefono_emergencia2] [varchar](20) NULL,
	[Historial_clinico] [varchar](255) NULL,
	[Especifique] [varchar](255) NULL,
	[Antecedente_importante] [varchar](255) NULL,
	[Fecha_Creacion] [date] NULL,
	[Fecha_Eliminacion] [date] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONSULTA]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONSULTA](
	[Id_consulta] [int] IDENTITY(1,1) NOT NULL,
	[Id_paciente] [int] NULL,
	[Diagnostico] [varchar](350) NULL,
	[Fecha] [date] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_consulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewConsultasByPacienteId]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW  [dbo].[viewConsultasByPacienteId] as
SELECT C.Id_consulta, CAST(C.Fecha AS VARCHAR(10)) AS FECHA_CONSULTA, CONCAT(P.Nombres, ' ', P.Apellidos) AS PACIENTE, C.Diagnostico
FROM     dbo.PACIENTE AS P INNER JOIN
                  dbo.CONSULTA AS C ON P.Id_paciente = C.Id_paciente 
WHERE C.Estado = 1 and C.Id_paciente = 3
GO
/****** Object:  UserDefinedFunction [dbo].[getConsultasByPacienteId]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getConsultasByPacienteId] (@Id_PACIENTE INT)
RETURNS TABLE
AS
RETURN(
SELECT 
	C.Id_consulta, 
	CAST(C.Fecha AS VARCHAR(10)) AS FECHA_CONSULTA, 
	CONCAT(P.Nombres, ' ', P.Apellidos) AS PACIENTE, 
	C.Diagnostico
FROM PACIENTE AS P INNER JOIN
     CONSULTA AS C ON P.Id_paciente = C.Id_paciente 
WHERE 
	C.Estado = 1 and C.Id_paciente = @Id_PACIENTE)
GO
/****** Object:  Table [dbo].[EXAMEN_OFTALMOLOGICO]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXAMEN_OFTALMOLOGICO](
	[Id_examen_oftalmologico] [int] IDENTITY(1,1) NOT NULL,
	[Id_consulta] [int] NULL,
	[Historia_clinica] [varchar](255) NULL,
	[Antecedentes] [varchar](255) NULL,
	[Agudeza_sc_OjoIzquierdo] [decimal](5, 2) NULL,
	[Agudeza_cc_OjoIzquierdo] [decimal](5, 2) NULL,
	[TensionOcular_OjoIzquierdo] [decimal](5, 2) NULL,
	[M_SPH_OjoIzquierdo] [decimal](5, 2) NULL,
	[M_CYS_OjoIzquierdo] [decimal](5, 2) NULL,
	[M_AXS_OjoIzquierdo] [decimal](5, 2) NULL,
	[K1_OjoIzquierdo] [decimal](5, 2) NULL,
	[k1_eje_OjoIzquierdo] [decimal](5, 2) NULL,
	[K2_OjoIzquierdo] [decimal](5, 2) NULL,
	[K2_eje_OjoIzquierdo] [decimal](5, 2) NULL,
	[W_SPH_OjoIzquierdo] [decimal](5, 2) NULL,
	[W_CYL_OjoIzquierdo] [decimal](5, 2) NULL,
	[W_AXS_OjoIzquierdo] [decimal](5, 2) NULL,
	[Agudeza_sc_OjoDerecho] [decimal](5, 2) NULL,
	[Agudeza_cc_OjoDerecho] [decimal](5, 2) NULL,
	[TensionOcular_OjoDerecho] [decimal](5, 2) NULL,
	[M_SPH_OjoDerecho] [decimal](5, 2) NULL,
	[M_CYS_OjoDerecho] [decimal](5, 2) NULL,
	[M_AXS_OjoDerecho] [decimal](5, 2) NULL,
	[K1_OjoDerecho] [decimal](5, 2) NULL,
	[k1_eje_OjoDerecho] [decimal](5, 2) NULL,
	[K2_OjoDerecho] [decimal](5, 2) NULL,
	[K2_eje_OjoDerecho] [decimal](5, 2) NULL,
	[W_SPH_OjoDerecho] [decimal](5, 2) NULL,
	[W_CYL_OjoDerecho] [decimal](5, 2) NULL,
	[W_AXS_OjoDerecho] [decimal](5, 2) NULL,
	[Diagnostico] [varchar](255) NULL,
	[Tratamiento] [varchar](255) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_examen_oftalmologico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getConsultaByPacienteIdConsultaId]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 01/09/2024
-- Description:	Function to get the Consulta by id and PacienteId
-- =============================================
CREATE FUNCTION [dbo].[getConsultaByPacienteIdConsultaId] 
(	
	-- Add the parameters for the function here
	@PacienteId int,
	@ConsultaId int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 
		P.Id_paciente ,CONCAT(P.Nombres,' ',P.Apellidos) NOMBRE, C.Fecha, 
		E.*
	FROM PACIENTE P
	INNER JOIN CONSULTA C ON P.Id_paciente = C.Id_paciente
	INNER JOIN EXAMEN_OFTALMOLOGICO E ON C.Id_consulta = E.Id_consulta
	WHERE P.Id_paciente = @PacienteId AND C.Id_consulta = @ConsultaId
	AND C.Estado = 1
)
GO
/****** Object:  View [dbo].[viewPacientesActivos]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewPacientesActivos] AS
SELECT Id_paciente, Nombres, Apellidos, DPI
FROM PACIENTE
WHERE Estado = 1;
GO
/****** Object:  Table [dbo].[SEGURO_MEDICO]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEGURO_MEDICO](
	[Id_seguro] [int] IDENTITY(1,1) NOT NULL,
	[Id_paciente] [int] NULL,
	[Nombre_aseguradora] [varchar](100) NULL,
	[No_carnet] [varchar](50) NULL,
	[Id_asegurado] [varchar](50) NULL,
	[Poliza] [varchar](25) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_seguro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATOS_DE_FACTURACION]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATOS_DE_FACTURACION](
	[Id_datos_facturacion] [int] IDENTITY(1,1) NOT NULL,
	[Id_paciente] [int] NULL,
	[NIT] [varchar](15) NOT NULL,
	[Nombre_facturacion] [varchar](100) NULL,
	[Direccion] [varchar](200) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_datos_facturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetPacienteById]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetPacienteById](@Id_paciente INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
		P.*, 
		DF.Nombre_facturacion, DF.NIT, DF.Direccion AS DIRECION_FACTURACION, 
		SG.Id_asegurado, SG.Nombre_aseguradora, SG.No_carnet, SG.Poliza
	FROM PACIENTE AS P
	LEFT JOIN DATOS_DE_FACTURACION AS DF
	ON P.Id_paciente = DF.Id_paciente 
	LEFT JOIN SEGURO_MEDICO AS SG
	ON P.Id_paciente  = SG.Id_paciente
    WHERE P.Id_paciente = @Id_paciente AND P.Estado = 1
)
GO
/****** Object:  View [dbo].[viewConsultas]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewConsultas] AS
SELECT 
	C.Id_consulta,
	CAST(C.Fecha AS VARCHAR(10)) AS FECHA_CONSULTA, 
	CONCAT(P.Nombres,' ',P.Apellidos) AS PACIENTE, 
	C.Diagnostico
FROM PACIENTE AS P
INNER JOIN CONSULTA AS C ON P.Id_paciente = C.Id_paciente
INNER JOIN EXAMEN_OFTALMOLOGICO AS E ON C.Id_consulta = E.Id_consulta
WHERE P.Estado = 1
GO
/****** Object:  Table [dbo].[RECETA_ANTEOJOS]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECETA_ANTEOJOS](
	[Id_receta_anteojos] [int] IDENTITY(1,1) NOT NULL,
	[Id_consulta] [int] NULL,
	[Fecha] [date] NULL,
	[Nombre] [varchar](100) NULL,
	[Od_esfera_lejos] [decimal](5, 2) NULL,
	[Od_cilindro_lejos] [decimal](5, 2) NULL,
	[Od_eje_lejos] [decimal](5, 2) NULL,
	[Od_prisma_lejos] [decimal](5, 2) NULL,
	[Od_base_lejos] [decimal](5, 2) NULL,
	[Od_color_lejos] [decimal](5, 2) NULL,
	[Os_esfera_lejos] [decimal](5, 2) NULL,
	[Os_cilindro_lejos] [decimal](5, 2) NULL,
	[Os_eje_lejos] [decimal](5, 2) NULL,
	[Os_prisma_lejos] [decimal](5, 2) NULL,
	[Os_base_lejos] [decimal](5, 2) NULL,
	[Os_color_lejos] [decimal](5, 2) NULL,
	[Od_esfera_adicion] [decimal](5, 2) NULL,
	[Od_cilindro_adicion] [decimal](5, 2) NULL,
	[Od_eje_adicion] [decimal](5, 2) NULL,
	[Os_esfera_adicion] [decimal](5, 2) NULL,
	[Os_cilindro_adicion] [decimal](5, 2) NULL,
	[Os_eje_adicion] [decimal](5, 2) NULL,
	[Estilo] [varchar](255) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_receta_anteojos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CONSULTA] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[DATOS_DE_FACTURACION] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[EXAMEN_OFTALMOLOGICO] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[PACIENTE] ADD  DEFAULT (getdate()) FOR [Fecha_Creacion]
GO
ALTER TABLE [dbo].[PACIENTE] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[RECETA_ANTEOJOS] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[SEGURO_MEDICO] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[CONSULTA]  WITH CHECK ADD FOREIGN KEY([Id_paciente])
REFERENCES [dbo].[PACIENTE] ([Id_paciente])
GO
ALTER TABLE [dbo].[DATOS_DE_FACTURACION]  WITH CHECK ADD FOREIGN KEY([Id_paciente])
REFERENCES [dbo].[PACIENTE] ([Id_paciente])
GO
ALTER TABLE [dbo].[EXAMEN_OFTALMOLOGICO]  WITH CHECK ADD FOREIGN KEY([Id_consulta])
REFERENCES [dbo].[CONSULTA] ([Id_consulta])
GO
ALTER TABLE [dbo].[RECETA_ANTEOJOS]  WITH CHECK ADD FOREIGN KEY([Id_consulta])
REFERENCES [dbo].[CONSULTA] ([Id_consulta])
GO
ALTER TABLE [dbo].[SEGURO_MEDICO]  WITH CHECK ADD FOREIGN KEY([Id_paciente])
REFERENCES [dbo].[PACIENTE] ([Id_paciente])
GO
/****** Object:  StoredProcedure [dbo].[spCreateConsulta]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 31/07/2024
-- Description:	Stored Procedure to create new Consulta
-- =============================================
CREATE PROCEDURE [dbo].[spCreateConsulta] 
	-- Add the parameters for the stored procedure here
	@Id_Paciente int, 
	@Diagnostico VARCHAR(350)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CONSULTA
		( Id_paciente, Diagnostico, Fecha)
	VALUES 
	(@Id_Paciente, @Diagnostico, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[spCreateDatosFacturacion]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 30/07/2024
-- Description:	Stored Procedure to create new Datos de Facturacion
-- =============================================
CREATE PROCEDURE [dbo].[spCreateDatosFacturacion] 
	-- Add the parameters for the stored procedure here
    @Nombre_facturacion VARCHAR(100),
	@NIT VARCHAR(15),
    @Direccion VARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @ID_PACIENTE INT
	SET @ID_PACIENTE = (SELECT TOP 1 Id_paciente FROM PACIENTE WHERE Estado = 1 
	ORDER BY Id_paciente DESC)

    -- Insert statements for procedure here
	INSERT INTO DATOS_DE_FACTURACION 
	(
		Id_paciente, NIT, Nombre_facturacion, Direccion
	)
VALUES 
	(
		@ID_PACIENTE, @NIT, @Nombre_facturacion, @Direccion	
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spCreateExamenOftalmologico]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCreateExamenOftalmologico]
	-- Add the parameters for the stored procedure here
	@Id_consulta INT,
    @Historia_clinica VARCHAR(255),
    @Antecedentes VARCHAR(255),
	--Ojo Izquierdo
    @Agudeza_sc_OjoIzquierdo DECIMAL(5,2),
	@Agudeza_cc_OjoIzquierdo DECIMAL(5,2),
	@TensionOcular_OjoIzquierdo DECIMAL(5,2),
	@M_SPH_OjoIzquierdo DECIMAL(5,2),
    @M_CYS_OjoIzquierdo DECIMAL(5,2),
    @M_AXS_OjoIzquierdo DECIMAL(5,2),
	@K1_OjoIzquierdo DECIMAL(5,2),
	@k1_eje_OjoIzquierdo DECIMAL(5,2),
    @K2_OjoIzquierdo DECIMAL(5,2),
    @K2_eje_OjoIzquierdo DECIMAL(5,2),
	@W_SPH_OjoIzquierdo DECIMAL(5,2),
    @W_CYL_OjoIzquierdo DECIMAL(5,2),
    @W_AXS_OjoIzquierdo DECIMAL(5,2),
	--Ojo Derecho
	@Agudeza_sc_OjoDerecho DECIMAL(5,2),
	@Agudeza_cc_OjoDerecho DECIMAL(5,2),
	@TensionOcular_OjoDerecho DECIMAL(5,2),
    @M_SPH_OjoDerecho DECIMAL(5,2),
    @M_CYS_OjoDerecho DECIMAL(5,2),
    @M_AXS_OjoDerecho DECIMAL(5,2),
    @K1_OjoDerecho DECIMAL(5,2),
	@K1_eje_OjoDerecho DECIMAL(5,2),
    @K2_OjoDerecho DECIMAL(5,2),
    @K2_eje_OjoDerecho DECIMAL(5,2),
    @W_SPH_OjoDerecho DECIMAL(5,2),
    @W_CYL_OjoDerecho DECIMAL(5,2),
    @W_AXS_OjoDerecho DECIMAL(5,2),
	--Final de los datos
    @Diagnostico VARCHAR(255),
    @Tratamiento VARCHAR(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @AG_SC_OI AS DECIMAL(5,2) = @Agudeza_sc_OjoIzquierdo
	DECLARE @AG_CC_OI AS DECIMAL(5,2) = @Agudeza_cc_OjoIzquierdo
	DECLARE @TO_OI AS DECIMAL(5,2) = @TensionOcular_OjoIzquierdo
	DECLARE @M_SPH_OI AS DECIMAL(5,2) = @M_SPH_OjoIzquierdo
	DECLARE @M_CYS_OI AS DECIMAL(5,2) = @M_CYS_OjoIzquierdo
	DECLARE @M_AXS_OI AS DECIMAL(5,2) = @M_AXS_OjoIzquierdo
	DECLARE @K1_OI AS DECIMAL(5,2) = @K1_OjoIzquierdo
	DECLARE @K1_EJE_OI AS DECIMAL(5,2) = @K1_eje_OjoIzquierdo
	DECLARE @K2_OI AS DECIMAL(5,2) = @K2_OjoIzquierdo
	DECLARE @K2_EJE_OI AS DECIMAL(5,2) = @K2_eje_OjoIzquierdo
	DECLARE @W_SPH_OI AS DECIMAL(5,2) = @W_SPH_OjoIzquierdo
	DECLARE @W_CYL_OI AS DECIMAL(5,2) = @W_CYL_OjoIzquierdo
	DECLARE @W_AXS_OI AS DECIMAL(5,2) = @W_AXS_OjoIzquierdo
	--Ojo Derecho
	DECLARE @AG_SC_OD AS DECIMAL(5,2) = @Agudeza_sc_OjoDerecho
	DECLARE @AG_CC_OD AS DECIMAL(5,2) = @Agudeza_cc_OjoDerecho
	DECLARE @TO_OD AS DECIMAL(5,2) = @TensionOcular_OjoDerecho
	DECLARE @M_SPH_OD AS DECIMAL(5,2) = @M_SPH_OjoDerecho
	DECLARE @M_CYS_OD AS DECIMAL(5,2) = @M_CYS_OjoDerecho
	DECLARE @M_AXS_OD AS DECIMAL(5,2) = @M_AXS_OjoDerecho
	DECLARE @K1_OD AS DECIMAL(5,2) = @K1_OjoDerecho
	DECLARE @K1_EJE_OD AS DECIMAL(5,2) = @K1_eje_OjoDerecho
	DECLARE @K2_OD AS DECIMAL(5,2) = @K2_OjoDerecho
	DECLARE @K2_EJE_OD AS DECIMAL(5,2) = @K2_eje_OjoDerecho
	DECLARE @W_SPH_OD AS DECIMAL(5,2) = @W_SPH_OjoDerecho
	DECLARE @W_CYL_OD AS DECIMAL(5,2) = @W_CYL_OjoDerecho
	DECLARE @W_AXS_OD AS DECIMAL(5,2) = @W_AXS_OjoDerecho


    -- Insert statements for procedure here
	INSERT INTO EXAMEN_OFTALMOLOGICO (
	Id_consulta,
    Historia_clinica,
    Antecedentes,
	--Ojo Izquierdo
    Agudeza_sc_OjoIzquierdo,
	Agudeza_cc_OjoIzquierdo,
	TensionOcular_OjoIzquierdo,
	M_SPH_OjoIzquierdo,
    M_CYS_OjoIzquierdo,
    M_AXS_OjoIzquierdo,
	K1_OjoIzquierdo,
	k1_eje_OjoIzquierdo,
    K2_OjoIzquierdo,
    K2_eje_OjoIzquierdo,
	W_SPH_OjoIzquierdo,
    W_CYL_OjoIzquierdo,
    W_AXS_OjoIzquierdo,
	--Ojo Derecho
	Agudeza_sc_OjoDerecho,
	Agudeza_cc_OjoDerecho,
	TensionOcular_OjoDerecho,
    M_SPH_OjoDerecho,
    M_CYS_OjoDerecho,
    M_AXS_OjoDerecho,
    K1_OjoDerecho,
	k1_eje_OjoDerecho,
    K2_OjoDerecho,
    K2_eje_OjoDerecho,
    W_SPH_OjoDerecho,
    W_CYL_OjoDerecho,
    W_AXS_OjoDerecho,
	--Final de los datos
    Diagnostico,
    Tratamiento
	)
	VALUES
	(
	@Id_consulta,
    @Historia_clinica,
    @Antecedentes,
	--Ojo Izquierdo
	@AG_SC_OI,
	@AG_CC_OI,
	@TO_OI,
	@M_SPH_OI,
	@M_CYS_OI,
	@M_AXS_OI,
	@K1_OI,
	@K1_EJE_OI,
	@K2_OI,
	@K2_EJE_OI,
	@W_SPH_OI,
	@W_CYL_OI,
	@W_AXS_OI,
	--Ojo Derecho
	@AG_SC_OD,
	@AG_CC_OD,
	@TO_OD,
	@M_SPH_OD,
	@M_CYS_OD,
	@M_AXS_OD,
	@K1_OD,
	@K1_EJE_OD,
	@K2_OD,
	@K2_EJE_OD,
	@W_SPH_OD,
	@W_CYL_OD,
	@W_AXS_OD,
	--Final de los datos
    @Diagnostico,
    @Tratamiento
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spCreatePaciente]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 29/07/2024
-- Description:	Stored Procedure to create new Paciente
-- =============================================
CREATE PROCEDURE [dbo].[spCreatePaciente] 
	-- Add the parameters for the stored procedure here
    @Nombres VARCHAR(100) ,
    @Apellidos VARCHAR(100),
    @Apellidos_Casada VARCHAR(100),
    @Fecha_Nacimiento VARCHAR(10),
    @DPI CHAR(13), 
	@No_Registro VARCHAR(20),
    @Celular VARCHAR(20),
    @Email VARCHAR(100),
    @Profesion_u_oficio VARCHAR(100),
    @Direccion VARCHAR(200),
    @Contacto_emergencia1 VARCHAR(100),
    @Telefono_emergencia1 VARCHAR(20),
    @Contacto_emergencia2 VARCHAR(100),
    @Telefono_emergencia2 VARCHAR(20),
    @Historial_clinico VARCHAR(255),
    @Especifique VARCHAR(255),
    @Antecedente_importante VARCHAR(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @F_nacimiento DATE = CAST(@Fecha_Nacimiento AS DATE)
    -- Insert statements for procedure here
	INSERT INTO PACIENTE 
	(
		Nombres, Apellidos,Apellidos_Casada, Fecha_Nacimiento,DPI,No_Registro,
		 Celular, Email, Profesion_u_oficio, Direccion, Contacto_emergencia1, Telefono_emergencia1, Contacto_emergencia2, Telefono_emergencia2,
		Historial_clinico, Especifique, Antecedente_importante
	)
VALUES 
	(
		@Nombres, @Apellidos,@Apellidos_Casada, @F_nacimiento,@DPI, @No_Registro,
		@Celular, @Email, @Profesion_u_oficio, @Direccion, @Contacto_emergencia1, @Telefono_emergencia1, 
		@Contacto_emergencia2, @Telefono_emergencia2,
		@Historial_clinico, @Especifique, @Antecedente_importante	
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spCreateSeguroMedico]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 30/07/2024
-- Description:	Stored Procedure to create new Seguro Medico
-- =============================================
CREATE PROCEDURE [dbo].[spCreateSeguroMedico]
	-- Add the parameters for the stored procedure here
	@Nombre_aseguradora VARCHAR(100),
    @Poliza VARCHAR(25),
    @Id_asegurado VARCHAR(50),
    @No_carnet VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @ID_PACIENTE INT
	SET @ID_PACIENTE = (SELECT TOP 1 Id_paciente FROM PACIENTE WHERE Estado = 1 
	ORDER BY Id_paciente DESC)

    -- Insert statements for procedure here
	INSERT INTO SEGURO_MEDICO 
	(
		Id_paciente, Nombre_aseguradora, Poliza, Id_asegurado, No_carnet
	)
VALUES 
	(
		@ID_PACIENTE, @Nombre_aseguradora, @Poliza, @Id_asegurado, @No_carnet	
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteConsulta]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 25/08/2024
-- Description:	Stored procedure to Delete Consulta (logical)
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteConsulta]
	-- Add the parameters for the stored procedure here
	@Id_paciente INT,
	@Id_consulta INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE CONSULTA	
	SET Estado = 0
	WHERE Id_paciente = @Id_paciente and Id_consulta = @Id_consulta
END
GO
/****** Object:  StoredProcedure [dbo].[spDeletePacienteById]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila	
-- Create date: 31/07/2024
-- Description:	Stored procedure to Delete Paciente (logical)
-- =============================================
CREATE PROCEDURE [dbo].[spDeletePacienteById]
	-- Add the parameters for the stored procedure here
	@Id_paciente INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE PACIENTE	
	SET Estado = 0
	WHERE Id_paciente = @Id_paciente
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateDatosFacturacionByPacienteId]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 31/08/2024
-- Description:	Stored procedure to update DatosFacturacion by IdPaciente
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateDatosFacturacionByPacienteId]
	-- Add the parameters for the stored procedure here
	@IdPaciente int,
	@Nombre_facturacion VARCHAR(100),
	@NIT VARCHAR(15),
    @Direccion VARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE DATOS_DE_FACTURACION
	SET
		Nombre_facturacion = @Nombre_facturacion,
		NIT = @NIT,
		Direccion = @Direccion
	WHERE Id_paciente = @IdPaciente
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePacienteById]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 31/08/2024
-- Description:	Stored Procedure to update Paciente by IdPaciente
-- =============================================
CREATE PROCEDURE [dbo].[spUpdatePacienteById]
	-- Add the parameters for the stored procedure here
	@IdPaciente int,
	@Nombres VARCHAR(100) ,
    @Apellidos VARCHAR(100),
    @Apellidos_Casada VARCHAR(100),
    @Fecha_Nacimiento VARCHAR(10),
    @DPI CHAR(13), 
	@No_Registro VARCHAR(20),
    @Celular VARCHAR(20),
    @Email VARCHAR(100),
    @Profesion_u_oficio VARCHAR(100),
    @Direccion VARCHAR(200),
    @Contacto_emergencia1 VARCHAR(100),
    @Telefono_emergencia1 VARCHAR(20),
    @Contacto_emergencia2 VARCHAR(100),
    @Telefono_emergencia2 VARCHAR(20),
    @Historial_clinico VARCHAR(255),
    @Especifique VARCHAR(255),
    @Antecedente_importante VARCHAR(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @F_nacimiento DATE = CAST(@Fecha_Nacimiento AS DATE)
    -- Insert statements for procedure here
	UPDATE PACIENTE
	SET 
		Nombres = @Nombres, 
		Apellidos = @Apellidos, 
		Apellidos_Casada = @Apellidos_Casada, 
		Fecha_Nacimiento = @F_nacimiento, 
		DPI = @DPI,
		No_Registro = @No_Registro, 
		Celular = @Celular, 
		Email = @Email, 
		Profesion_u_oficio = @Profesion_u_oficio, 
		Direccion = @Direccion, 
		Contacto_emergencia1 = @Contacto_emergencia1, 
		Telefono_emergencia1 = @Telefono_emergencia1, 
		Contacto_emergencia2 = @Contacto_emergencia2, 
		Telefono_emergencia2 = @Telefono_emergencia2, 
		Historial_clinico = @Historial_clinico, 
		Especifique = @Especifique, 
		Antecedente_importante = @Antecedente_importante
	WHERE Id_paciente = @IdPaciente
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateSeguroMedicoByPacienteID]    Script Date: 2/09/2024 17:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 31/08/2024
-- Description:	Stored procedure for update 
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateSeguroMedicoByPacienteID]
	-- Add the parameters for the stored procedure here
	@IdPaciente int,
	@Nombre_aseguradora VARCHAR(100),
    @Poliza VARCHAR(25),
    @Id_asegurado VARCHAR(50),
    @No_carnet VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE SEGURO_MEDICO
	SET
		Nombre_aseguradora = @Nombre_aseguradora, 
		Poliza = @Poliza, 
		Id_asegurado = @Id_asegurado, 
		No_carnet = @No_carnet
	WHERE
		Id_paciente = @IdPaciente
END
GO
USE [master]
GO
ALTER DATABASE [SERVIOFTALMO_DRAFT5] SET  READ_WRITE 
GO
