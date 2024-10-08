USE [SERVIOFTALMO_DRAFT4]
GO
/****** Object:  StoredProcedure [dbo].[spCreatePaciente]    Script Date: 21/07/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 05/07/2024
-- Description:	Stored Procedure to create new Paciente
-- =============================================
ALTER PROCEDURE [dbo].[spCreatePaciente] 
	-- Add the parameters for the stored procedure here
    @Nombres VARCHAR(100) ,
    @Apellidos VARCHAR(100),
    @Apellidos_Casada VARCHAR(100),
    @Fecha_Nacimiento VARCHAR(10),
	@No_Registro VARCHAR(10),
    @DPI CHAR(13), 
    @Celular VARCHAR(20),
    @Email VARCHAR(100),
    @Direccion VARCHAR(200),
    @Profesion_u_oficio VARCHAR(100),
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
		Nombres, Apellidos,Apellidos_Casada, Fecha_Nacimiento,No_Registro,
		DPI, Celular, Email, Direccion, Profesion_u_oficio, Contacto_emergencia1, Telefono_emergencia1, Contacto_emergencia2, Telefono_emergencia2,
		Historial_clinico, Especifique, Antecedente_importante
	)
VALUES 
	(
		@Nombres, @Apellidos,@Apellidos_Casada, @F_nacimiento,@No_Registro,
		@DPI, @Celular, @Email, @Direccion, @Profesion_u_oficio, @Contacto_emergencia1, @Telefono_emergencia1, 
		@Contacto_emergencia2, @Telefono_emergencia2,
		@Historial_clinico, @Especifique, @Antecedente_importante	
	)
END
