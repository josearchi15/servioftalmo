use SERVIOFTALMO_DRAFT4

--TRUNCATE TABLE DATOS_DE_FACTURACION
--TRUNCATE TABLE SEGURO_MEDICO
--TRUNCATE TABLE PACIENTE

SELECT * FROM PACIENTE
SELECT * FROM DATOS_DE_FACTURACION
SELECT * FROM SEGURO_MEDICO
go
DECLARE @DATE DATE = CAST('2001-01-02' AS DATE)

EXEC spCreatePaciente 'spPaciente5','apPrueba5','','2012-12-12','SP00005',
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

CREATE VIEW getPacienteInfo
SELECT * FROM PACIENTE 
LEFT JOIN DATOS_DE_FACTURACION 
ON PACIENTE.Id_paciente = DATOS_DE_FACTURACION.Id_paciente 
LEFT JOIN SEGURO_MEDICO
ON PACIENTE.Id_paciente  = SEGURO_MEDICO.Id_paciente
WHERE PACIENTE.Id_paciente = 1016

SELECT * FROM GetPacienteByID(1013)

EXEC spCreateConsulta 1015,'Miopia'
SELECT * FROM CONSULTA

SELECT * FROM EXAMEN_OFTALMOLOGICO
EXEC spCreateExamenOftalmologico 2, 'Primer registro examen', 'miopia',1,1,1,1,1,1,2.1,1.1,1.3,1.4,3.2,2.3,6.1,1.6,2.3,3.2,'miopia grave','colocarse lentes'

SELECT * FROM getConsultaById(2)