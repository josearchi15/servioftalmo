import { getConnection } from "../database/connection.js"
import sql from 'mssql'

// muestra el formulario de la receta; done
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
        const pool = await getConnection();
        const Id_receta_anteojos = req.params.id_receta; // ID de la receta

        // Consultar los detalles de la receta
        const result = await pool.request().query(`
            SELECT * 
            FROM RECETA_ANTEOJOS 
            WHERE Id_receta_anteojos = ${Id_receta_anteojos} AND Estado = 1
        `);

        if (result.recordset.length === 0) {
            req.flash('error_msg', 'La receta no existe o ha sido eliminada.');
            return res.redirect('/pacientes');
        }

        res.render('receta-anteojos/detalle-receta', {
            Receta: result.recordset[0],
            success_msg: req.flash('success_msg'),
        });
    } catch (error) {
        console.error('Error al obtener la receta:', error);
        req.flash('error_msg', 'Hubo un error al obtener la receta.');
        res.redirect('/pacientes');
    }
};


export const getRecetasAnteojos = async (req, res) => {
    try {
        const pool = await getConnection();
        const Id_paciente = req.params.id; // ID del paciente

        // Consultar todas las recetas del paciente
        const result = await pool.request().query(`
            SELECT * FROM getRecetaAnteojosByPacienteId(${Id_paciente}) order by Fecha_Receta
        `);

        res.render('receta-anteojos/buscar-recetas', {
            Recetas: result.recordset,
            PacienteId: Id_paciente,
            success_msg: req.flash('success_msg'),
        });
    } catch (error) {
        console.error('Error al obtener recetas:', error);
        req.flash('error_msg', 'Hubo un error al obtener las recetas.');
        res.redirect('/pacientes');
    }
};


// guarda la receta en base de datos; done
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
        // console.log(`
        //     EXEC spCreateRecetaAnteojos ${Id_paciente}, '${fechaReceta}', '${Nombre}', ${Od_esfera_lejos}, ${Od_cilindro_lejos}, ${Od_eje_lejos}, ${Od_prisma_lejos}, ${Od_base_lejos}, ${Od_color_lejos},
        //     ${Os_esfera_lejos}, ${Os_cilindro_lejos}, ${Os_eje_lejos}, ${Os_prisma_lejos}, ${Os_base_lejos}, ${Os_color_lejos},
        //     ${Od_esfera_adicion}, ${Od_cilindro_adicion}, ${Od_eje_adicion}, ${Os_esfera_adicion}, ${Os_cilindro_adicion}, ${Os_eje_adicion},'${dip}', '${Plástico ? Plástico + ',' : ""}', '${observaciones}'
        // `);
        // Parameterized query to avoid syntax issues
        await pool.request()
            .input('Id_paciente', sql.Int, Id_paciente)
            .input('fechaReceta', sql.Date, fechaReceta)
            .input('Nombre', sql.VarChar(100), Nombre)
            .input('Od_esfera_lejos', sql.Decimal(5, 2), Od_esfera_lejos || 0)
            .input('Od_cilindro_lejos', sql.Decimal(5, 2), Od_cilindro_lejos || 0)
            .input('Od_eje_lejos', sql.Decimal(5, 2), Od_eje_lejos || 0)
            .input('Od_prisma_lejos', sql.Decimal(5, 2), Od_prisma_lejos || 0)
            .input('Od_base_lejos', sql.Decimal(5, 2), Od_base_lejos || 0)
            .input('Od_color_lejos', sql.Decimal(5, 2), Od_color_lejos || 0)
            .input('Os_esfera_lejos', sql.Decimal(5, 2), Os_esfera_lejos || 0)
            .input('Os_cilindro_lejos', sql.Decimal(5, 2), Os_cilindro_lejos || 0)
            .input('Os_eje_lejos', sql.Decimal(5, 2), Os_eje_lejos || 0)
            .input('Os_prisma_lejos', sql.Decimal(5, 2), Os_prisma_lejos || 0)
            .input('Os_base_lejos', sql.Decimal(5, 2), Os_base_lejos || 0)
            .input('Os_color_lejos', sql.Decimal(5, 2), Os_color_lejos || 0)
            .input('Od_esfera_adicion', sql.Decimal(5, 2), Od_esfera_adicion || 0)
            .input('Od_cilindro_adicion', sql.Decimal(5, 2), Od_cilindro_adicion || 0)
            .input('Od_eje_adicion', sql.Decimal(5, 2), Od_eje_adicion || 0)
            .input('Os_esfera_adicion', sql.Decimal(5, 2), Os_esfera_adicion || 0)
            .input('Os_cilindro_adicion', sql.Decimal(5, 2), Os_cilindro_adicion || 0)
            .input('Os_eje_adicion', sql.Decimal(5, 2), Os_eje_adicion || 0)
            .input('dip', sql.VarChar(255), dip || '')
            .input('Plástico', sql.VarChar(255), Plástico ? 'Plástico' : '')
            .input('observaciones', sql.VarChar(255), observaciones || '')
            .query(`
                EXEC spCreateRecetaAnteojos 
                @Id_paciente, @fechaReceta, @Nombre, 
                @Od_esfera_lejos, @Od_cilindro_lejos, @Od_eje_lejos, @Od_prisma_lejos, @Od_base_lejos, @Od_color_lejos,
                @Os_esfera_lejos, @Os_cilindro_lejos, @Os_eje_lejos, @Os_prisma_lejos, @Os_base_lejos, @Os_color_lejos,
                @Od_esfera_adicion, @Od_cilindro_adicion, @Od_eje_adicion, 
                @Os_esfera_adicion, @Os_cilindro_adicion, @Os_eje_adicion, 
                @dip, @Plástico, @observaciones
            `);

        req.flash('success_msg', 'Receta creada exitosamente.');
        res.redirect(`/pacientes/`);

    } catch (error) {
        console.error('Error al crear la receta:', error);
        req.flash('error_msg', 'Hubo un error al crear la receta.');

        // Handle error: redirect back to the new receta page with an error message
        res.redirect(`/pacientes/`);
    }
}

export const deleteRecetaAnteojos = async (req, res) => {
    try {
        const pool = await getConnection();
        const Id_receta_anteojos = req.params.id; // ID de la receta

        // Actualizar el estado a 0 (eliminado)
        await pool.request().query(`
            UPDATE RECETA_ANTEOJOS 
            SET Estado = 0, Fecha_Eliminacion = GETDATE() 
            WHERE Id_receta_anteojos = ${Id_receta_anteojos}
        `);

        req.flash('success_msg', 'Receta eliminada exitosamente.');
        res.redirect(`/pacientes`);
    } catch (error) {
        console.error('Error al eliminar la receta:', error);
        req.flash('error_msg', 'Hubo un error al eliminar la receta.');
        res.redirect('/pacientes');
    }
};