use SERVIOFTALMO_DRAFT4
SELECT * FROM PACIENTE
SELECT * FROM SEGURO_MEDICO
SELECT * FROM DATOS_DE_FACTURACION
go
DECLARE @DATE DATE = CAST('2001-01-02' AS DATE)

EXEC spCreatePaciente 'spPaciente4','apPrueba4','',@DATE,'SP00002',
	'2222444440101','51234567','spprueba3@gmail.com','BH zona 21','spEnfermero','Emergencia 1','55123456','Emergencia2','55512345',
	'Diabetes;Asma','Enferemedad respiratoria','Familia de padre diabetica'
GO


UPDATE PACIENTE 
SET Estado = 0 
WHERE Id_paciente = 9

SELECT IDENT_CURRENT('PACIENTE') 

SELECT TOP 1 Id_paciente FROM PACIENTE WHERE Estado = 1 
ORDER BY Id_paciente DESC

exec spCreateSeguroMedico 'Seguros El Roble','164-202401-3','1325686','659980-5500'
exec spCreateDatosFacturacion 'PacienteFact','4650356-K','direccion facturacion 1'