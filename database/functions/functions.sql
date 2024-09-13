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


ALTER FUNCTION getConsultasByPacienteId (@Id_PACIENTE INT)
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


ALTER FUNCTION searchPacienteByIdDPI(@datoBusqueda varchar)
RETURNS TABLE
AS 
RETURN
(
	SELECT * FROM viewPacientesActivos 
	WHERE 
		CAST(Id_paciente AS varchar) LIKE @datoBusqueda 
		OR CAST(DPI AS varchar) LIKE @datoBusqueda
)
SELECT * FROM searchPacienteByIdDPI('2415')
--SELECT * FROM viewPacientesActivos 
--WHERE 
--	CAST(Id_paciente AS varchar) LIKE '51516%' 
--	OR CAST(DPI AS nvarchar) LIKE '51516%'


SELECT * FROM viewPacientesActivos
SELECT * FROM PACIENTE WHERE Id_paciente = 6

SELECT * FROM searchPacienteByIdDPI('4563')
SELECT * FROM searchPacienteByIdDPI('51516262')
SELECT * FROM viewPacientesActivos 
WHERE 
	CAST(Id_paciente AS varchar) LIKE '51516262%' 
	OR CAST(DPI AS nvarchar) LIKE '51516262%'


