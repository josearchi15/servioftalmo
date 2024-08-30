CREATE VIEW viewPacientesActivos AS
SELECT 
FROM PACIENTE
WHERE Estado = 1;

UPDATE PACIENTE SET Estado = 0 WHERE Id_paciente < 1013

SELECT * FROM viewPacientesActivos

SELECT * FROM PACIENTE

SELECT * FROM GetPacienteById(1015)


ALTER VIEW viewConsultas AS
SELECT 
	C.Id_consulta,
	CAST(C.Fecha AS VARCHAR(10)) AS FECHA_CONSULTA, 
	CONCAT(P.Nombres,' ',P.Apellidos) AS PACIENTE, 
	C.Diagnostico
FROM PACIENTE AS P
INNER JOIN CONSULTA AS C ON P.Id_paciente = C.Id_paciente
INNER JOIN EXAMEN_OFTALMOLOGICO AS E ON C.Id_consulta = E.Id_consulta
WHERE P.Estado = 1

SELECT * FROM viewConsultas