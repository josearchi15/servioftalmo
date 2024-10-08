USE [SERVIOFTALMO_DRAFT4]
GO
/****** Object:  StoredProcedure [dbo].[spCreateDatosFacturacion]    Script Date: 21/07/2024 18:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 08/07/2024
-- Description:	Stored Procedure to create new Datos de Facturacion
-- =============================================
ALTER PROCEDURE [dbo].[spCreateDatosFacturacion] 
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
		@ID_PACIENTE, @Nombre_facturacion, @NIT, @Direccion	
	)
END
