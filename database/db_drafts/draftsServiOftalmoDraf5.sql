SELECT * FROM viewPacientesActivos
SELECT * FROM PACIENTE
exec spDeletePacienteById 3, 12134134331, 40

UPDATE PACIENTE	
	SET Estado = 1
	WHERE Id_paciente = 3
	AND (DPI = 12134134331   OR No_Registro = 40)

SELECT * FROM CONSULTA
SELECT * FROM EXAMEN_OFTALMOLOGICO

EXEC spPruebaDecimales 10, 'historiaPrueba','antecedentesPrueba','0.01'

EXEC spCreateExamenOftalmologico 
10, 'historiaPrueba','antecedentesPrueba',
--oi
'0.01','0.01','0.01',
'0.01','0.01','0.01',
'0.01','0.01','0.01','0.01',
'0.01','0.01','0.01',
--od
'0.01','0.01','0.01',
'0.01','0.01','0.01',
'0.01','0.01','0.01','0.01',
'0.01','0.01','0.01',
'diagnositicoPrueba','tratamiento1'

USE SERVIOFTALMO_DRAFT5
--TRUNCATE TABLE EXAMEN_OFTALMOLOGICO
--TRUNCATE TABLE CONSULTA


--******************************  
EXEC spCreateExamenOftalmologico2 20, 'ASDFA',
  'ASDFASAS',
   '5.33',
   '466',
  '65464',
   '656.3',
   '1.2',
  '10'
  DECLARE @PRUEBA DECIMAL(5,2) = '1000'
  SELECT @PRUEBA	

SELECT * FROM CONSULTA
SELECT * FROM EXAMEN_OFTALMOLOGICO










