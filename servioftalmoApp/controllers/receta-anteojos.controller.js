import { getConnection } from "../database/connection.js"

export const newRecetaAnteojos = async (req, res) => {
    try {
        console.log('Obtener todas las Recetas de anteojos')
        const pool = await getConnection();
        const result = await pool.request().query(`SELECT * FROM GetPacienteByID(${req.params.id})`)
        const paciente = result.recordset[0]
        res.render('receta-anteojos/receta-anteojos', { Paciente: paciente })

    } catch (error) {

        req.flash('error_msg', 'No se pudo mostrar la receta');
        res.redirect(`/pacientes/`)
    }

}

export const getRecetaAnteojos = async (req, res) => {
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

export const getRecetasAnteojos = async (req, res) => {
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

export const createRecetaAnteojos = async (req, res) => {
    try {
        const pool = await getConnection();

        // First, capture the `id` of the patient from the URL (req.params.id)
        const Id_paciente = req.params.id;
        const result = await pool.request().query(`SELECT * FROM GetPacienteByID(${req.params.id})`)
        const paciente = result.recordset[0]
        const Nombre = `${paciente.Nombres} ${paciente.Apellidos}`

        // Destructure the form values from req.body
        const {
            fechaReceta, Od_esfera_lejos, Od_cilindro_lejos, Od_eje_lejos, Od_prisma_lejos, Od_base_lejos, Od_color_lejos,
            Os_esfera_lejos, Os_cilindro_lejos, Os_eje_lejos, Os_prisma_lejos, Os_base_lejos, Os_color_lejos,
            Od_esfera_adicion, Od_cilindro_adicion, Od_eje_adicion, Os_esfera_adicion, Os_cilindro_adicion, Os_eje_adicion,
            dip, Plástico, observaciones
        } = req.body;

        console.log(req.body)
        // Execute the stored procedure to create a new Receta Anteojos
        console.log(`
            EXEC spCreateRecetaAnteojos ${Id_paciente}, '${fechaReceta}', '${Nombre}', ${Od_esfera_lejos}, ${Od_cilindro_lejos}, ${Od_eje_lejos}, ${Od_prisma_lejos}, ${Od_base_lejos}, ${Od_color_lejos},
            ${Os_esfera_lejos}, ${Os_cilindro_lejos}, ${Os_eje_lejos}, ${Os_prisma_lejos}, ${Os_base_lejos}, ${Os_color_lejos},
            ${Od_esfera_adicion}, ${Od_cilindro_adicion}, ${Od_eje_adicion}, ${Os_esfera_adicion}, ${Os_cilindro_adicion}, ${Os_eje_adicion},'${dip}', '${Plástico ? Plástico + ',' : ""}', '${observaciones}'
        `);
        await pool.request().query
            (`EXEC spCreateRecetaAnteojos ${Id_paciente}, '${fechaReceta}', '${Nombre}', 
                ${Od_esfera_lejos}, 
                ${Od_cilindro_lejos}, ${Od_eje_lejos}, ${Od_prisma_lejos}, ${Od_base_lejos}, ${Od_color_lejos},
                ${Os_esfera_lejos}, ${Os_cilindro_lejos}, ${Os_eje_lejos}, ${Os_prisma_lejos}, ${Os_base_lejos}, ${Os_color_lejos},
                ${Od_esfera_adicion}, ${Od_cilindro_adicion}, ${Od_eje_adicion}, ${Os_esfera_adicion}, ${Os_cilindro_adicion}, ${Os_eje_adicion},'${dip}', '${Plástico ? Plástico + ',' : ""}', '${observaciones}'
        `);

        // Fetch the updated list of Recetas Anteojos for this patient
        // const recetas = await pool.request().query(`SELECT * FROM RECETA_ANTEOJOS WHERE Id_paciente = ${Id_paciente}`);

        req.flash('success_msg', 'Receta creada exitosamente.');
        res.redirect(`/pacientes/`);

        // res.render('receta/buscar-receta', { Recetas: recetas.recordset, PacienteId: Id_paciente, success_msg: req.flash('success_msg') });

    } catch (error) {
        console.error('Error al crear la receta:', error);
        req.flash('error_msg', 'Hubo un error al crear la receta.');

        // Handle error: redirect back to the new receta page with an error message
        res.redirect(`/pacientes/`);
    }
}

// export const updateConsulta = async (req, res) => {         //no habra edit en consulta
//     console.log("consulta updated")
//     res.redirect("/")
// }

export const deleteRecetaAnteojos = async (req, res) => {
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