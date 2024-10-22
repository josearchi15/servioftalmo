import { exec } from 'child_process'
import fs from 'fs'
import { join } from 'path';
import { getDirname } from "../public/js/utils.js"

// Get __dirname for this module
const __dirname = getDirname(import.meta);

// Define the base path for the shared folder
const sharedBasePath = join(__dirname, '../uploads'); // Adjust this as needed

// Route to open the folder
export const openFolder = async (req, res) => {
    console.log(`llego a la ruta`)

    // Funcioinalidad cuando ya esta la ruta correcta
    const pacienteId = req.params.id;
    const folderPath = join(sharedBasePath, `paciente_${pacienteId}`);

    // Check if the folder exists
    if (!fs.existsSync(folderPath)) {
        // Create the folder for the patient
        fs.mkdir(folderPath, { recursive: true }, (err) => {
            if (err) {
                console.error('Error creating folder:', err);
                req.flash('error_msg', 'Error al crear carpeta del paciente.');
                return res.redirect('/pacientes/');
            }

            console.log('Patient folder created at:', folderPath);
            // req.flash('success_msg', 'Paciente creado exitosamente.');
            // res.redirect(`/pacientes/${pacienteId}`);
        });
    }

    // Command to open the folder in the file explorer
    const platform = process.platform;

    let command = '';
    if (platform === 'win32') {
        // Windows command to open the folder
        command = `start "" "${folderPath}"`;
    } else if (platform === 'darwin') {
        // macOS command to open the folder
        command = `open "${folderPath}"`;
    } else if (platform === 'linux') {
        // Linux command to open the folder
        command = `xdg-open "${folderPath}"`;
    }

    // Execute the command to open the folder
    exec(command, (err) => {
        if (err) {
            console.error('Error opening folder:', err);
            req.flash('error_msg', 'No se pudo abrir la carpeta del paciente.');
            return res.redirect(`/pacientes/`);
        }

        req.flash('success_msg', 'Carpeta del paciente abierta exitosamente.');
        res.redirect(`/pacientes/`);
    });
};

