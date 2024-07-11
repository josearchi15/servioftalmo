import { getConnection } from "../database/connection.js"

export const getPacientes = async (req, res) => {
    const pool = await getConnection()
    const result = await pool.request().query("SELECT * FROM PACIENTE")
    console.log(result.recordset)
    // res.send(result.recordset)
    res.render('paciente/index', { Pacientes: result })
}

export const getPaciente = async (req, res) => {
    const pool = await getConnection()
    const result = await pool.request().query(`SELECT * FROM Pacientes WHERE id = ${req.params.id}`)
    // console.log(result.recordset)
    // res.send(result.recordset)

    if (result.rowsAffected[0] == 0) {
        return res.status(404).json({ message: "Paciente not found" })
    }

    return res.json(result.recordset[0])

}

export const createPaciente = async (req, res) => {
    // const pool = await getConnection()
    // const result = await pool.request().query(`INSERT INTO Pacientes (name, price, quantity, description) VALUES ('${req.body.name}', ${req.body.price}, ${req.body.quantity}, '${req.body.description}')`)
    const PacienteoId = req.body.PacienteID
    // console.log(result)
    console.log(`el id del Paciente enviado por el front es: ${PacienteoId}`)
    // res.send('Paciente created')
    res.redirect("/Pacientes/" + PacienteoId);
}

export const updatePaciente = async (req, res) => {
    const id = req.params.id

    const pool = await getConnection()
    const result = await pool.request().query(
        `UPDATE Pacientes SET name = '${req.body.name}', 
        description = '${req.body.description}', 
        price = ${req.body.price},
        quantity = ${req.body.quantity} WHERE id = ${id}`)


    if (result.rowsAffected[0] == 0) {
        return res.status(404).json({ message: "Paciente not found" })
    }

    return res.json({ message: "Paciente updated" })
}

export const deletePaciente = async (req, res) => {
    const pool = await getConnection()
    const result = await pool.request().query(`DELETE FROM Pacientes WHERE id = ${req.params.id}`)
    console.log(result.recordset)

    if (result.rowsAffected[0] == 0) {
        return res.status(404).json({ message: "Paciente not found" })
    }

    return res.json({ message: "Paciente deleted" })
}