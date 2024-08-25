import { getConnection } from "../database/connection.js"

export const getConsultas = async (req, res) => {
    console.log('Obtener todos los Consulta')
    const pool = await getConnection()
    const result = await pool.request().query(`SELECT * FROM getConsultasByPacienteId(${req.params.id})`)
    res.render('consulta/buscar-consulta', { PacienteId: req.params.id, Consultas: result.recordset })

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

    res.render('consulta/editar-consulta', { Consulta: Consulta }) //{ Consulta: consulta }

}

export const createConsulta = async (req, res) => {
    // const bday = Date(req.body.fechaNacimiento)

    try {
        const pool = await getConnection()
        const spCreateConsulta = await pool.request().query(`EXEC spCreateConsulta ${req.params.id},'${req.body.diagnostico}'`)
        const consulta = await pool.request().query(`SELECT TOP 1 Id_consulta FROM CONSULTA WHERE Id_paciente = ${req.params.id} ORDER BY Id_consulta DESC`)
        const idConsulta = consulta.recordset[0].Id_consulta
        console.log('******************', consulta.recordset[0], idConsulta)
        console.log('******************', req.body)

        const Agudeza_sc_OjoIzquierdo = Number(req.body.Agudeza_sc_OjoIzquierdo)
        const Agudeza_cc_OjoIzquierdo = Number(req.body.Agudeza_cc_OjoIzquierdo)
        const TensionOcular_OjoIzquierdo = Number(req.body.TensionOcular_OjoIzquierdo)
        const M_SPH_OjoIzquierdo = Number(req.body.M_SPH_OjoIzquierdo)
        const M_CYS_OjoIzquierdo = Number(req.body.M_CYS_OjoIzquierdo)
        const M_AXS_OjoIzquierdo = Number(req.body.M_AXS_OjoIzquierdo)
        const K1_OjoIzquierdo = Number(req.body.K1_OjoIzquierdo)
        const K1_eje_OjoIzquierdo = Number(req.body.K1_eje_OjoIzquierdo)
        const K2_OjoIzquierdo = Number(req.body.K2_OjoIzquierdo)
        const K2_eje_OjoIzquierdo = Number(req.body.K2_eje_OjoIzquierdo)
        const W_SPH_OjoIzquierdo = Number(req.body.W_SPH_OjoIzquierdo)
        const W_CYL_OjoIzquierdo = Number(req.body.W_CYL_OjoIzquierdo)
        const W_AXS_OjoIzquierdo = Number(req.body.W_AXS_OjoIzquierdo)
        const Agudeza_sc_OjoDerecho = Number(req.body.Agudeza_sc_OjoDerecho)
        const Agudeza_cc_OjoDerecho = Number(req.body.Agudeza_cc_OjoDerecho)
        const TensionOcular_OjoDerecho = Number(req.body.TensionOcular_OjoDerecho)
        const M_SPH_OjoDerecho = Number(req.body.M_SPH_OjoDerecho)
        const M_CYS_OjoDerecho = Number(req.body.M_CYS_OjoDerecho)
        const M_AXS_OjoDerecho = Number(req.body.M_AXS_OjoDerecho)
        const K1_OjoDerecho = Number(req.body.K1_OjoDerecho)
        const k1_eje_OjoDerecho = Number(req.body.k1_eje_OjoDerecho)
        const K2_OjoDerecho = Number(req.body.K2_OjoDerecho)
        const K2_eje_OjoDerecho = Number(req.body.K2_eje_OjoDerecho)
        const W_SPH_OjoDerecho = Number(req.body.W_SPH_OjoDerecho)
        const W_CYL_OjoDerecho = Number(req.body.W_CYL_OjoDerecho)
        const W_AXS_OjoDerecho = Number(req.body.W_AXS_OjoDerecho)

        const spCreateExamenOftalmologico = await pool.request().query
            (`EXEC spCreateExamenOftalmologico2 
            ${idConsulta},'${req.body.historiaClinica}','${req.body.antecedentes}',

            ${Agudeza_sc_OjoIzquierdo}, ${Agudeza_cc_OjoIzquierdo}, ${TensionOcular_OjoIzquierdo},
            ${M_SPH_OjoIzquierdo},${M_CYS_OjoIzquierdo},${M_AXS_OjoIzquierdo},
            ${K1_OjoIzquierdo},${K1_eje_OjoIzquierdo},${K2_OjoIzquierdo},${K2_eje_OjoIzquierdo},
            ${W_SPH_OjoIzquierdo},${W_CYL_OjoIzquierdo},${W_AXS_OjoIzquierdo},

            ${Agudeza_sc_OjoDerecho},${Agudeza_cc_OjoDerecho},${TensionOcular_OjoDerecho},
            ${M_SPH_OjoDerecho},${M_CYS_OjoDerecho},${M_AXS_OjoDerecho},
            ${K1_OjoDerecho},${k1_eje_OjoDerecho},${K2_OjoDerecho},${K2_eje_OjoDerecho},
            ${W_SPH_OjoDerecho},${W_CYL_OjoDerecho},${W_AXS_OjoDerecho},
            '${req.body.diagnostico}','${req.body.tratamiento}'`)


        console.log("Consulta creada")
        // res.redirect("/consulta/" + ConsultaId);
        res.redirect(`/`);

    } catch (error) {
        console.log(error)
        console.log("Consulta no creada")
        res.redirect(`/`);
    }
}

export const updateConsulta = async (req, res) => {
    return res.json({ message: "CONSULTA updated" })
}

export const deleteConsulta = async (req, res) => {
    console.log(`EXEC spDeleteConsulta ${req.params.id}`)
    try {
        const pool = await getConnection()
        const result = await pool.request().query(`EXEC spDeleteConsulta ${req.params.id}, ${req.params.id_consulta}`)
        console.log("Consulta deleted")
        console.log(result.recordset)
        res.redirect(`/pacientes/${req.params.id}/consulta`);

    } catch (error) {
        console.log(error)
        res.redirect(`/pacientes/${req.params.id}/consulta`);
    }
}