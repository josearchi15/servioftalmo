import { getConnection } from "../database/connection.js"

export const getPacientes = async (req, res) => {
    console.log('Obtener todos los pacientes')
    const pool = await getConnection()
    const result = await pool.request().query("SELECT * FROM viewPacientesActivos")
    res.render('paciente/buscar-paciente', { Pacientes: result.recordset })
    // res.render('paciente/index')
}

export const newPaciente = async (req, res) => {
    console.log('Nuevo Paciente')
    res.render('paciente/formulario-paciente')
}

export const getPaciente = async (req, res) => {

    const pool = await getConnection()
    const result = await pool.request().query(`SELECT * FROM GetPacienteByID(${req.params.id})`)
    // console.log(result.recordset[0])
    const Paciente = result.recordset[0]
    console.log(typeof (result.recordset[0].Id_Paciente))
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
    	'${req.body.dpi}','${req.body.telCel}','${req.body.email}','${req.body.direccion}','${req.body.profesion}','${req.body.emergencyContact1}','${req.body.emergencyContact1Tel}','${req.body.emergencyContact2}','${req.body.emergencyContact1Tel}',
    	'${req.body.diabetes} ${req.body.presionAltaBaja} ${req.body.enfermedadesCardiacas} ${req.body.doloresDeCabeza} ${req.body.asma} ${req.body.fracturas} ${req.body.convulsiones} ${req.body.problemasTorax}',
        '${req.body.especifique}','${req.body.otrosAntecedentes}'`)

    const spCreateDatosFacturacion = await pool.request().query(`EXEC spCreateDatosFacturacion '${req.body.facturacionNombre}','${req.body.facturacionNit}','${req.body.facturacionDireccion}'`)

    const spCreateDatosSeguro = await pool.request().query(`EXEC spCreateSeguroMedico '${req.body.seguroAfiliado}','${req.body.poliza}','${req.body.idAsegurado}','${req.body.noCarnet}'`)
    res.redirect("/pacientes/");
}

export const updatePaciente = async (req, res) => {
    // const id = req.params.id

    // const pool = await getConnection()
    // const result = await pool.request().query(
    //     `UPDATE Pacientes SET name = '${req.body.name}', 
    //     description = '${req.body.description}', 
    //     price = ${req.body.price},
    //     quantity = ${req.body.quantity} WHERE Id_paciente = ${id}`)


    // if (result.rowsAffected[0] == 0) {
    //     return res.status(404).json({ message: "Paciente not found" })
    // }

    return res.json({ message: "Paciente updated" })
}

export const deletePaciente = async (req, res) => {
    const pool = await getConnection()
    const result = await pool.request().query(`DELETE FROM PACIENTE WHERE Id_paciente = ${req.params.id}`)
    console.log(result.recordset)

    if (result.rowsAffected[0] == 0) {
        return res.status(404).json({ message: "Paciente not found" })
    }

    return res.json({ message: "Paciente deleted" })
}