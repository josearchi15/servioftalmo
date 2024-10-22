import { getConnection } from "../database/connection.js"

export const getConsultas = async (req, res) => {
    try {
        console.log('Obtener todas las Consultas')
        const pool = await getConnection()
        const result = await pool.request().query(`SELECT * FROM getConsultasByPacienteId(${req.params.id})`)
        const Consultas = result.recordset
        console.log(Consultas.length)

        const success_msg = req.flash('success_msg')
        console.log(`Mensaje antes de ser seteado success: ${success_msg}  `)

        const message = Consultas.length == 0 ? "No existen consultas para este paciente" : ""
        req.flash('success_msg', message);


        res.render('consulta/buscar-consulta', { PacienteId: req.params.id, Consultas: Consultas, success_msg: req.flash('success_msg') })

    } catch (error) {

        req.flash('error_msg', 'No se pudieron mostrar las consultas');
        res.redirect(`/pacientes/`)
    }

}

export const newConsulta = async (req, res) => {
    try {
        const pool = await getConnection()
        const result = await pool.request().query(`SELECT * FROM GetPacienteByID(${req.params.id})`)
        const paciente = result.recordset[0]
        res.render('consulta/formulario-consulta', { Paciente: paciente })
    } catch (error) {
        res.redirect(`/pacientes/`)
    }
}

export const getConsulta = async (req, res) => {
    try {
        const pool = await getConnection()
        const result = await pool.request().query(`SELECT * FROM getConsultaByPacienteIdConsultaId(${req.params.id}, ${req.params.id_consulta})`)
        console.log(`Respuesta consulta ${result.recordset[0]}`)
        const Consulta = result.recordset[0]
        res.render('consulta/editar-consulta', { Consulta: Consulta })
    } catch (error) {
        res.redirect(`/pacientes/${req.params.id}/consultas`)
    }
}

export const createConsulta = async (req, res) => {

    try {
        // const bday = Date(req.body.fechaNacimiento)
        const pool = await getConnection()
        await pool.request().query(`EXEC spCreateConsulta ${req.params.id},'${req.body.diagnostico}','${req.body.fechaConsulta}'`)
        const consulta = await pool.request().query(`SELECT TOP 1 Id_consulta FROM CONSULTA WHERE Id_paciente = ${req.params.id} ORDER BY Id_consulta DESC`)
        const idConsulta = consulta.recordset[0].Id_consulta
        console.log('******************', consulta.recordset[0], idConsulta)
        console.log('******************', req.body)

        const {
            Agudeza_sc_OjoIzquierdo,
            Agudeza_cc_OjoIzquierdo,
            TensionOcular_OjoIzquierdo,
            M_SPH_OjoIzquierdo,
            M_CYS_OjoIzquierdo,
            M_AXS_OjoIzquierdo,
            K1_OjoIzquierdo,
            K1_eje_OjoIzquierdo,
            K2_OjoIzquierdo,
            K2_eje_OjoIzquierdo,
            W_SPH_OjoIzquierdo,
            W_CYL_OjoIzquierdo,
            W_AXS_OjoIzquierdo,
            Agudeza_sc_OjoDerecho,
            Agudeza_cc_OjoDerecho,
            TensionOcular_OjoDerecho,
            M_SPH_OjoDerecho,
            M_CYS_OjoDerecho,
            M_AXS_OjoDerecho,
            K1_OjoDerecho,
            k1_eje_OjoDerecho,
            K2_OjoDerecho,
            K2_eje_OjoDerecho,
            W_SPH_OjoDerecho,
            W_CYL_OjoDerecho,
            W_AXS_OjoDerecho,
            diagnostico, tratamiento, ObservacionOjoDerecho, ObservacionOjoIzquierdo,
            historiaClinica, antecedentes
        } = req.body;

        await pool.request().query
            (`EXEC spCreateExamenOftalmologico 
            ${idConsulta},'${historiaClinica}','${antecedentes}',

            '${Agudeza_sc_OjoIzquierdo}', '${Agudeza_cc_OjoIzquierdo}', '${TensionOcular_OjoIzquierdo}',
            '${M_SPH_OjoIzquierdo}','${M_CYS_OjoIzquierdo}','${M_AXS_OjoIzquierdo}',
            '${K1_OjoIzquierdo}','${K1_eje_OjoIzquierdo}','${K2_OjoIzquierdo}','${K2_eje_OjoIzquierdo}',
            '${W_SPH_OjoIzquierdo}','${W_CYL_OjoIzquierdo}','${W_AXS_OjoIzquierdo}',

            '${Agudeza_sc_OjoDerecho}','${Agudeza_cc_OjoDerecho}','${TensionOcular_OjoDerecho}',
            '${M_SPH_OjoDerecho}','${M_CYS_OjoDerecho}','${M_AXS_OjoDerecho}',
            '${K1_OjoDerecho}','${k1_eje_OjoDerecho}','${K2_OjoDerecho}','${K2_eje_OjoDerecho}',
            '${W_SPH_OjoDerecho}','${W_CYL_OjoDerecho}','${W_AXS_OjoDerecho}',
            '${diagnostico}','${tratamiento}', '${ObservacionOjoDerecho}','${ObservacionOjoIzquierdo}'`)
        // throw new Error("Error lanzado a proposito");



        console.log("Consulta creada")
        const Consultas = await pool.request().query(`SELECT * FROM getConsultasByPacienteId(${req.params.id})`)
        req.flash('success_msg', 'Consulta creada con exito!')

        res.render('consulta/buscar-consulta', { Consultas: Consultas.recordset, PacienteId: req.params.id, success_msg: req.flash('success_msg') })

    } catch (error) {
        console.log(error)
        console.log("Consulta no creada")

        req.flash('error_msg', 'Hubo un error en la crecion de la consulta');

        const pool = await getConnection()
        const result = await pool.request().query("SELECT * FROM viewPacientesActivos")

        res.render('paciente/buscar-paciente', { Pacientes: result.recordset, error_msg: req.flash('error_msg') })
    }
}

// export const updateConsulta = async (req, res) => {         //no habra edit en consulta
//     console.log("consulta updated")
//     res.redirect("/")
// }

export const deleteConsulta = async (req, res) => {
    try {
        const pool = await getConnection()
        await pool.request().query(`EXEC spDeleteConsulta ${req.params.id}, ${req.params.id_consulta}`)
        console.log("Consulta deleted")
        req.flash('success_msg', 'Consulta eliminada con exito!')
        res.redirect(`/pacientes/${req.params.id}/consulta`);

    } catch (error) {
        console.log(error)
        req.flash('error_msg', 'La consulta no se pudo eliminar, intente de nuevo')
        res.redirect(`/pacientes/${req.params.id}/consulta`);
    }
}