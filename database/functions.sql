CREATE FUNCTION GetPacienteById(@Id_paciente INT)
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

CREATE FUNCTION getConsultaById(@Id_Consulta INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
		P.Nombres, P.Apellidos, P.Apellidos_Casada, P.Fecha_Nacimiento, P.DPI, P.Celular, P.Email, P.Direccion, P.Profesion_u_oficio,
		C.Fecha,
		EX.*
	FROM CONSULTA AS c
	INNER JOIN PACIENTE AS P
	ON C.Id_paciente = P.Id_paciente 
	INNER JOIN EXAMEN_OFTALMOLOGICO AS EX
	ON C.Id_consulta = @Id_Consulta
)