use SERVIOFTALMO_DRAFT4
go
DECLARE @DATE DATE = CAST('2001-01-01' AS DATE)
EXEC spCreatePaciente 'spPaciente1','apPrueba1','',@DATE,'SP00001',
	'1111444440101','51234567','spprueba2@gmail.com','BH zona 21','spEnfermero','Emergencia 1','55123456','Emergencia2','55512345',
	'Diabetes;Asma','Enferemedad respiratoria','Familia de padre diabetica'
