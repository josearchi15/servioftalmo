USE [SERVIOFTALMO_DRAFT5]
GO
/****** Object:  StoredProcedure [dbo].[spCreateSeguroMedico]    Script Date: 21/07/2024 18:16:35 ******/
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
