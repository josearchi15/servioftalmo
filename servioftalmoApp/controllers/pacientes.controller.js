import { getConnection } from "../database/connection.js"

export const newPaciente = async (req, res) => {
    console.log('Nuevo Paciente')
    res.render('paciente/formulario-paciente')
}

export const getPacientes = async (req, res) => {
    console.log('Obtener todos los pacientes')
    const pool = await getConnection()
    const result = await pool.request().query("SELECT * FROM viewPacientesActivos")
    res.render('paciente/buscar-paciente', { Pacientes: result.recordset })
    // res.render('paciente/index')
}

export const getPaciente = async (req, res) => {

    const pool = await getConnection()
    const result = await pool.request().query(`SELECT * FROM GetPacienteByID(${req.params.id})`)
    // console.log(result.recordset[0])
    const Paciente = result.recordset[0]
    console.log(typeof (result.recordset[0].Id_Paciente))
    console.log(result.recordset[0])
    // if (result.rowsAffected[0] == 0) {
    //     return res.status(404).json({ message: "Paciente not found" })
    // }

    res.render('paciente/editar-paciente', { Paciente: Paciente }) //{ Paciente: paciente }

}

export const createPaciente = async (req, res) => {
    // const bday = Date(req.body.fechaNacimiento)
    const pool = await getConnection()
    const spCreatePaciente = await pool.request().query(
        `EXEC spCreatePaciente '${req.body.nombres}','${req.body.apellidos}','${req.body.apellidoDeCasada}','${req.body.fechaNacimiento}','${req.body.No_Registro}',
    	'${req.body.dpi}','${req.body.telCel}','${req.body.email}','${req.body.profesion}','${req.body.direccion}','${req.body.emergencyContact1}','${req.body.emergencyContact1Tel}','${req.body.emergencyContact2}','${req.body.emergencyContact1Tel}',
    	'${req.body.diabetes} ${req.body.presionAltaBaja} ${req.body.enfermedadesCardiacas} ${req.body.doloresDeCabeza} ${req.body.asma} ${req.body.fracturas} ${req.body.convulsiones} ${req.body.problemasTorax}',
        '${req.body.especifique}','${req.body.otrosAntecedentes}'`)

    const spCreateDatosFacturacion = await pool.request().query(`EXEC spCreateDatosFacturacion '${req.body.facturacionNombre}','${req.body.facturacionNit}','${req.body.facturacionDireccion}'`)

    const spCreateDatosSeguro = await pool.request().query(`EXEC spCreateSeguroMedico '${req.body.seguroAfiliado}','${req.body.poliza}','${req.body.idAsegurado}','${req.body.noCarnet}'`)
    res.redirect("/pacientes/");
}

export const updatePaciente = async (req, res) => {
    try {
        const pool = await getConnection()
        const result = await pool.request().query(`EXEC spDeletePacienteById ${req.params.id}`)
        res.redirect("/pacientes/");

    } catch (error) {
        console.log(error)
        res.redirect("/pacientes/");
    }
}

export const deletePaciente = async (req, res) => {
    try {
        const pool = await getConnection()
        const result = await pool.request().query(`EXEC spDeletePacienteById ${req.params.id}`)
        res.redirect("/pacientes/");

    } catch (error) {
        console.log(error)
        res.redirect("/pacientes/");
    }
}