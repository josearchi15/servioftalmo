// utils/pathHelper.mjs
import { fileURLToPath } from 'url';
import { dirname } from 'path';



// Create a function to get __dirname for a module
export function getDirname(meta) {
    const __filename = fileURLToPath(meta.url);
    return dirname(__filename);
}

export const fnEnfermedades = (strEnfermedades) => {
    let arrHC = strEnfermedades.split(',')
    arrHC = arrHC.map(item => item.trimStart().trimEnd())
    const historialClinico = {}
    arrHC.forEach(enfermedad => {
        switch (enfermedad) {
            case 'diabetes':
                historialClinico['Diabetes'] = true
                break;
            case 'presionAltaBaja':
                historialClinico['presionAltaBaja'] = true
                break;
            case 'enfermedadesCardiacas':
                historialClinico['enfermedadesCardiacas'] = true
                break;
            case 'asma':
                historialClinico['asma'] = true
                break;
            case 'doloresDeCabeza':
                historialClinico['doloresDeCabeza'] = true
                break;
            case 'fracturas':
                historialClinico['fracturas'] = true
                break;
            case 'convulsiones':
                historialClinico['convulsiones'] = true
                break;
            case 'problemasTorax':
                historialClinico['problemasTorax'] = true
                break;
        }
    })

    return historialClinico
}