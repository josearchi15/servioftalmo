USE [SERVIOFTALMO_DRAFT4]
GO
/****** Object:  StoredProcedure [dbo].[spCreateConsulta]    Script Date: 22/07/2024 21:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 08/07/2024
-- Description:	Stored Procedure to create new Consulta
-- =============================================
ALTER PROCEDURE [dbo].[spCreateConsulta] 
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
