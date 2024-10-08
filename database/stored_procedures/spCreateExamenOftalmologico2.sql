USE [SERVIOFTALMO_DRAFT5]
GO
/****** Object:  StoredProcedure [dbo].[spCreateExamenOftalmologico2]    Script Date: 7/08/2024 10:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[spCreateExamenOftalmologico2]
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
