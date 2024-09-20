import { getConnection } from "../database/connection.js"

export const searchPaciente = async (req, res) => {
    try {
        console.log(`SELECT * FROM searchPacienteByIdDPI('${req.query.PacienteIdDPI}')`)
        const pool = await getConnection()
        const result = await pool.request().query(
            `SELECT * FROM viewPacientesActivos 
            WHERE CAST(Id_paciente AS varchar) LIKE '${req.query.PacienteIdDPI}%' 
            OR CAST(DPI AS nvarchar) LIKE '${req.query.PacienteIdDPI}%'
            OR Nombres LIKE '${req.query.PacienteIdDPI}%'
		OR Apellidos LIKE '${req.query.PacienteIdDPI}%'`)
        res.render('paciente/buscar-paciente', { Pacientes: result.recordset })
    } catch (error) {
        console.log(error)
    }
}

export const newPaciente = async (req, res) => {
    try {
        console.log('Nuevo Paciente')
        res.render('paciente/formulario-paciente')

    } catch (error) {
        res.redirect('/')
    }
}

export const getPacientes = async (req, res) => {
    try {
        console.log('Obtener todos los pacientes')
        const pool = await getConnection()
        const result = await pool.request().query("SELECT * FROM viewPacientesActivos")

        res.render('paciente/buscar-paciente', { Pacientes: result.recordset })

    } catch (error) {
        console.log(error)
        res.redirect('/pacientes/')
    }
}

export const getPaciente = async (req, res) => {

    try {
        const pool = await getConnection()
        const result = await pool.request().query(`SELECT * FROM GetPacienteByID(${req.params.id})`)
        const Paciente = result.recordset[0]
        const fecha = Paciente["Fecha_Nacimiento"]
        const objFecha = JSON.stringify(fecha)
        const fecha_front = objFecha.slice(1, 11)
        console.log(fecha_front)
        console.log(`Prueba: ${typeof (objFecha)}`)

        res.render('paciente/editar-paciente', { Paciente: Paciente, Fecha_Nacimiento: fecha_front })

    } catch (error) {
        console.log(error)
        res.redirect("/pacientes/");
    }

}

export const createPaciente = async (req, res) => {
    // const bday = Date(req.body.fechaNacimiento)

    try {
        const pool = await getConnection()
        const spCreatePaciente = await pool.request().query(
            `EXEC spCreatePaciente '${req.body.nombres}','${req.body.apellidos}','${req.body.apellidoDeCasada}','${req.body.fechaNacimiento}','${req.body.No_Registro}',
            '${req.body.dpi}','${req.body.telCel}','${req.body.email}','${req.body.profesion}','${req.body.direccion}','${req.body.emergencyContact1}','${req.body.emergencyContact1Tel}','${req.body.emergencyContact2}','${req.body.emergencyContact1Tel}',
            '${req.body.diabetes} ${req.body.presionAltaBaja} ${req.body.enfermedadesCardiacas} ${req.body.doloresDeCabeza} ${req.body.asma} ${req.body.fracturas} ${req.body.convulsiones} ${req.body.problemasTorax}',
            '${req.body.especifique}','${req.body.otrosAntecedentes}'`)
        const spCreateDatosFacturacion = await pool.request().query(`EXEC spCreateDatosFacturacion '${req.body.facturacionNombre}','${req.body.facturacionNit}','${req.body.facturacionDireccion}'`)
        const spCreateDatosSeguro = await pool.request().query(`EXEC spCreateSeguroMedico '${req.body.seguroAfiliado}','${req.body.poliza}','${req.body.idAsegurado}','${req.body.noCarnet}'`)

        const message = "Paciente creado exitosamente"
        req.flash('success_msg', message);
        console.log("antes del error")

        // const pool = await getConnection()
        const Pacientes = await pool.request().query("SELECT * FROM viewPacientesActivos")

        // throw new Error("Error lanzado a proposito*****create");

        res.render("paciente/buscar-paciente", { Pacientes: Pacientes.recordset, success_msg: req.flash('success_msg') });

    } catch (error) {
        console.log(error)

        const pool = await getConnection()
        const result = await pool.request().query("SELECT * FROM viewPacientesActivos")

        const message = "Hubo un error en la creacion del paciente, intentelo de nuevo en unos minutos"
        req.flash('success_msg', message);
        res.render("paciente/buscar-paciente", { Pacientes: result.recordset, success_msg: req.flash('error_msg') });  //***********************************revisar el render por redirect */
    }
}

export const updatePaciente = async (req, res) => {
    try {
        const pool = await getConnection()
        const updatePaciente = await pool.request().query(
            `EXEC spUpdatePacienteById ${req.params.id},'${req.body.nombres}','${req.body.apellidos}','${req.body.apellidoDeCasada}','${req.body.fechaNacimiento}','${req.body.No_Registro}',
            '${req.body.dpi}','${req.body.telCel}','${req.body.email}','${req.body.profesion}','${req.body.direccion}','${req.body.emergencyContact1}','${req.body.emergencyContact1Tel}','${req.body.emergencyContact2}','${req.body.emergencyContact1Tel}',
            '${req.body.diabetes} ${req.body.presionAltaBaja} ${req.body.enfermedadesCardiacas} ${req.body.doloresDeCabeza} ${req.body.asma} ${req.body.fracturas} ${req.body.convulsiones} ${req.body.problemasTorax}',
            '${req.body.especifique}','${req.body.otrosAntecedentes}'`)

        const updateDatosFacturacion = await pool.request().query(
            `EXEC spUpdateDatosFacturacionByPacienteId ${req.params.id},'${req.body.facturacionNombre}','${req.body.facturacionNit}','${req.body.facturacionDireccion}'`)

        const udpateSeguroMedico = await pool.request().query(
            `EXEC spUpdateSeguroMedicoByPacienteID ${req.params.id},'${req.body.seguroAfiliado}','${req.body.poliza}','${req.body.idAsegurado}','${req.body.noCarnet}'`)

        res.redirect("/pacientes/");

    } catch (error) {
        console.log(error)
        res.redirect("/pacientes/");
    }
}

export const deletePaciente = async (req, res) => {
    try {
        // throw new Error("**********Error de prueba");

        const pool = await getConnection()
        const deleted = await pool.request().query(`EXEC spDeletePacienteById ${req.params.id}`)

        const message = `El paciente con id: ${req.params.id} fue eliminado exitosamente.`
        req.flash('success_msg', message);

        const result = await pool.request().query("SELECT * FROM viewPacientesActivos")
        console.log(`Eliminando paciente..`)
        res.render("paciente/buscar-paciente", { Pacientes: result.recordset, success_msg: req.flash('success_msg') });

    } catch (error) {
        console.log(error)

        const pool = await getConnection()
        const result = await pool.request().query("SELECT * FROM viewPacientesActivos")

        // const message = "Hubo un error en la eliminacion del paciente, intentelo de nuevo en unos minutos"
        const message = "Hubo un error en la eliminacion del paciente, intentelo de nuevo mas tarde"
        req.flash('error_msg', message);

        console.log(message)
        res.render("paciente/buscar-paciente", { Pacientes: result.recordset, error_msg: req.flash('error_msg') });
    }
}