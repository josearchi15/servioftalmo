import { getConnection } from "../database/connection.js"

export const getConsultas = async (req, res) => {
    console.log('Obtener todos los Consulta')
    const pool = await getConnection()
    const result = await pool.request().query("SELECT * FROM CONSULTA")
    //console.log(result.recordset)
    // res.send(result.recordset)
    res.render('consulta/formulario-consulta', { Consultas: result.recordset })
    // res.render('consulta/index')
}

export const newConsulta = async (req, res) => {
    const pool = await getConnection()
    const result = await pool.request().query(`SELECT * FROM GetPacienteByID(${req.params.id})`)
    const paciente = result.recordset[0]
    res.render('consulta/formulario-consulta', { Paciente: paciente })
}

export const getConsulta = async (req, res) => {

    const pool = await getConnection()
    const result = await pool.request().query(`SELECT * FROM CONSULTA WHERE Id_consulta = ${req.params.id}`)
    console.log(result.recordset)
    const Consulta = result.recordset[0]

    // if (result.rowsAffected[0] == 0) {
    //     return res.status(404).json({ message: "Consulta not found" })
    // }

    res.render('consulta/editar-consulta', { Consulta: Consulta }) //{ Consulta: consulta }

}

export const createConsulta = async (req, res) => {
    // const bday = Date(req.body.fechaNacimiento)
    const pool = await getConnection()
    const spCreateConsulta = await pool.request().query
        (`EXEC spCreateConsulta '${req.body.nombres}','${req.body.apellidos}','${req.body.apellidoDeCasada}','${req.body.fechaNacimiento}','spRegistro',
    	'${req.body.dpi}','${req.body.telCel}','${req.body.email}','${req.body.direccion}','${req.body.profesion}','${req.body.emergencyContact1}','${req.body.emergencyContact1Tel}','${req.body.emergencyContact2}','${req.body.emergencyContact1Tel}',
    	'${req.body.diabetes}','${req.body.especifique}','${req.body.otrosAntecedentes}'`)

    const spCreateDatosFacturacion = await pool.request().query(`exec spCreateDatosFacturacion '${req.body.facturacionNombre}','${req.body.facturacionNit}','${req.body.facturacionDireccion}'`)

    const spCreateDatosSeguro = await pool.request().query(`exec spCreateSeguroMedico '${req.body.seguroAfiliado}','${req.body.poliza}','${req.body.idAsegurado}','${req.body.noCarnet}'`)
    // res.send('Consulta created')
    // res.redirect("/consulta/" + ConsultaId);
    res.redirect("/consulta/");
}

export const updateConsulta = async (req, res) => {
    // const id = req.params.id

    // const pool = await getConnection()
    // const result = await pool.request().query(
    //     `UPDATE Consulta SET name = '${req.body.name}', 
    //     description = '${req.body.description}', 
    //     price = ${req.body.price},
    //     quantity = ${req.body.quantity} WHERE Id_CONSULTA = ${id}`)


    // if (result.rowsAffected[0] == 0) {
    //     return res.status(404).json({ message: "CONSULTA not found" })
    // }

    return res.json({ message: "CONSULTA updated" })
}

export const deleteConsulta = async (req, res) => {
    const pool = await getConnection()
    const result = await pool.request().query(`DELETE FROM CONSULTA WHERE Id_consulta = ${req.params.id}`)
    console.log(result.recordset)

    if (result.rowsAffected[0] == 0) {
        return res.status(404).json({ message: "Consulta not found" })
    }

    return res.json({ message: "Consulta deleted" })
}