SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Archila
-- Create date: 22/07/2024
-- Description:	Stored Procedure to create new Examen Oftalmologico
-- =============================================
CREATE PROCEDURE spCreateExamenOftalmologico 
	-- Add the parameters for the stored procedure here
	@Id_consulta INT,
    @Historia_clinica VARCHAR(255),
    @Antecedentes VARCHAR(255),
    @Agudeza_visual_sc_OjoDerecho INT,
	@Agudeza_visual_oc_OjoDerecho INT,
	@Tension_ocular_OjoDerecho INT,
    @Agudeza_visual_sc_OjoIzquierdo INT,
	@Agudeza_visual_oc_OjoIzquierdo INT,
	@Tension_ocular_OjoIzquierdo INT,
    @M_SPH DECIMAL(5,2),
    @M_CYS DECIMAL(5,2),
    @M_AXS DECIMAL(5,2),
    @K1 DECIMAL(5,2),
    @K2 DECIMAL(5,2),
    @W_SPH DECIMAL(5,2),
    @W_CYL DECIMAL(5,2),
    @W_AXS DECIMAL(5,2),
    @W_PSM DECIMAL(5,2),
    @W_BAS DECIMAL(5,2),
    @Diagnostico VARCHAR(255),
    @Tratamiento VARCHAR(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO EXAMEN_OFTALMOLOGICO (
	Id_consulta,
    Historia_clinica,
    Antecedentes,
    Agudeza_visual_sc_OjoDerecho,
	Agudeza_visual_oc_OjoDerecho,
	Tension_ocular_OjoDerecho,
    Agudeza_visual_sc_OjoIzquierdo,
	Agudeza_visual_oc_OjoIzquierdo,
	Tension_ocular_OjoIzquierdo,
    M_SPH,
    M_CYS,
    M_AXS,
    K1,
    K2,
    W_SPH,
    W_CYL,
    W_AXS,
    W_PSM,
    W_BAS,
    Diagnostico,
    Tratamiento
	)
	VALUES
	(
	@Id_consulta,
    @Historia_clinica,
    @Antecedentes,
    @Agudeza_visual_sc_OjoDerecho,
	@Agudeza_visual_oc_OjoDerecho,
	@Tension_ocular_OjoDerecho,
    @Agudeza_visual_sc_OjoIzquierdo,
	@Agudeza_visual_oc_OjoIzquierdo,
	@Tension_ocular_OjoIzquierdo,
    @M_SPH,
    @M_CYS,
    @M_AXS,
    @K1,
    @K2,
    @W_SPH,
    @W_CYL,
    @W_AXS,
    @W_PSM,
    @W_BAS,
    @Diagnostico,
    @Tratamiento)
END
GO
