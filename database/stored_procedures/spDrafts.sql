
--spCreatePaciente 
INSERT INTO PACIENTE 
	(
		Nombres, Apellidos,Apellidos_Casada, Fecha_Nacimiento,No_Registro,
		DPI, Celular, Email, Direccion, Profesion_u_oficio, Contacto_emergencia1, Telefono_emergencia1, Contacto_emergencia2, Telefono_emergencia2,
		Historial_clinico, Especifique, Antecedente_importante
	)
VALUES (
	'Paciente5','Prueba5','',CAST('2000-01-01' as date),'A00002',
	'2222444440101','51234567','prueba2@gmail.com','BH zona 21','Enfermero','Emergencia 1','55123456','Emergencia2','55512345',
	'Diabetes;Asma','Enferemedad respiratoria','Familia de padre diabetica'
	)

--spCreateDatosDeFacturacion 
INSERT INTO DATOS_DE_FACTURACION 
	(	Id_paciente,NIT, Nombre_facturacion, Direccion )
VALUES 
	(	--4,'799513-k','Paciente3 Nombre Factura','BH zona 21'--ejemplo id inexistente
		5,'799513-k','Paciente3 Nombre Factura','BH zona 21' )

--spCreateSeguroMedico
INSERT INTO SEGURO_MEDICO
	(	Id_paciente,Nombre_aseguradora,Poliza, Id_asegurado)
VALUES 
	(	--4,'El Roble','04-05-01-11178-3','11406669' --ejemplo id inexistente
		5,'El Roble','04-05-01-11178-3','11406669'
		)


SELECT * FROM PACIENTE
SELECT * FROM DATOS_DE_FACTURACION
SELECT * FROM SEGURO_MEDICO
