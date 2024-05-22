const mockDatabase = [
  {
    idPaciente: 123,
    nombres: 'Juan',
    apellidos: 'Perez',
    apellidoDeCasada: '',
    fechaNacimiento: '1990-01-01',
    dpi: 1234567890123,
    telCel: 5551234567,
    email: 'juan.perez@example.com',
    direccion: 'Calle Falsa 123',
    profesion: 'Ingeniero',
    emergencyContact1: 'Maria Perez',
    emergencyContact1Tel: 5559876543,
    emergencyContact2: 'Carlos Perez',
    emergencyContact2Tel: 5558765432,
    facturacionNombre: 'Juan Perez',
    facturacionNit: '12345678',
    facturacionDireccion: 'Calle Falsa 123',
    seguroAfiliado: 'Seguro XYZ',
    poliza: 'POL123456',
    idAsegurado: 'ASG123456',
    noCarnet: 'CAR123456',
    historialClinico: {
      diabetes: true,
      presionAltaBaja: false,
      enfermedadesCardiacas: true,
      dolorDeCabeza: false,
      asma: false,
      fracturas: false,
      convulsiones: false,
      problemasTorax: false,
      especificar: '',
      antecedentesImportantes: ''
    }
  },
  // Add more patient objects as needed
];

const pacienteForm = document.getElementById('pacienteForm');
  const patientTableBody = document.getElementById('patientTableBody');
  const formTitle = document.getElementById('formTitle');
  const cancelUpdate = document.getElementById('cancelUpdate');
  let patients = mockDatabase;
  let updatingPatient = null;

  function renderPatientTable() {
    patientTableBody.innerHTML = '';
    patients.forEach(patient => {
      const row = document.createElement('tr');
      row.innerHTML = `
        <td>${patient.idPaciente}</td>
        <td>${patient.nombres}</td>
        <td>${patient.apellidos}</td>
        <td>${patient.dpi}</td>
        <td>
          <button class="btn btn-sm btn-info" onclick="editPatient('${patient.idPaciente}')">Editar</button>
          <button class="btn btn-sm btn-danger" onclick="deletePatient('${patient.idPaciente}')">Eliminar</button>
        </td>
      `;
      patientTableBody.appendChild(row);
    });
  }

  renderPatientTable();

// document.getElementById('searchForm').addEventListener('submit', function(event) {
//   event.preventDefault();
//   const searchInput = document.getElementById('searchInput').value;
//   const resultList = document.getElementById('resultList');
//   resultList.innerHTML = '';

//   const results = mockDatabase.filter(paciente => paciente.idPaciente === searchInput || paciente.dpi === searchInput);
  
//   if (results.length > 0) {
//     results.forEach(paciente => {
//       const li = document.createElement('li');
//       li.className = 'list-group-item';
//       li.textContent = `Nombre: ${paciente.nombres} ${paciente.apellidos}, DPI: ${paciente.dpi}, Tel/Cel: ${paciente.telCel}`;
//       resultList.appendChild(li);
//     });
//   } else {
//     const li = document.createElement('li');
//     li.className = 'list-group-item';
//     li.textContent = 'No se encontraron resultados';
//     resultList.appendChild(li);
//   }
// });

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('searchForm').addEventListener('submit', function(event) {
      event.preventDefault();
      const searchId = document.getElementById('searchId').value;
      const result = mockDatabase.find(patient => patient.dpi == searchId || patient.idPaciente == searchId);
  
      const resultDiv = document.getElementById('searchResult');
      if (result) {
        resultDiv.innerHTML = `
          <h3>Información del paciente</h3>
          <p><strong>Id Paciente:</strong> ${result.idPaciente}</p>
          <p><strong>Nombres:</strong> ${result.nombres}</p>
          <p><strong>Apellidos:</strong> ${result.apellidos}</p>
          <p><strong>Apellido de Casada:</strong> ${result.apellidoDeCasada}</p>
          <p><strong>Fecha de Nacimiento:</strong> ${result.fechaNacimiento}</p>
          <p><strong>DPI:</strong> ${result.dpi}</p>
          <p><strong>Tel/Cel:</strong> ${result.telCel}</p>
          <p><strong>Email:</strong> ${result.email}</p>
          <p><strong>Dirección:</strong> ${result.direccion}</p>
          <p><strong>Profesión y Oficio:</strong> ${result.profesion}</p>
          <p><strong>Contacto de Emergencia 1:</strong> ${result.emergencyContact1}</p>
          <p><strong>Tel/Cel de Emergencia 1:</strong> ${result.emergencyContact1Tel}</p>
          <p><strong>Contacto de Emergencia 2:</strong> ${result.emergencyContact2}</p>
          <p><strong>Tel/Cel de Emergencia 2:</strong> ${result.emergencyContact2Tel}</p>
          <h4>Datos de Facturación</h4>
          <p><strong>Nombre:</strong> ${result.facturacionNombre}</p>
          <p><strong>NIT:</strong> ${result.facturacionNit}</p>
          <p><strong>Dirección de Facturación:</strong> ${result.facturacionDireccion}</p>
          <h4>Información de Asegurado</h4>
          <p><strong>Seguro Afiliado:</strong> ${result.seguroAfiliado}</p>
          <p><strong>Póliza:</strong> ${result.poliza}</p>
          <p><strong>ID Asegurado:</strong> ${result.idAsegurado}</p>
          <p><strong>No. Carnet:</strong> ${result.noCarnet}</p>
          <h4>Historial Clínico</h4>
          <p><strong>Diabetes:</strong> ${result.historialClinico.diabetes ? 'Sí' : 'No'}</p>
          <p><strong>Presión Alta/Baja:</strong> ${result.historialClinico.presionAltaBaja ? 'Sí' : 'No'}</p>
          <p><strong>Enfermedades Cardíacas:</strong> ${result.historialClinico.enfermedadesCardiacas ? 'Sí' : 'No'}</p>
          <p><strong>Dolor de Cabeza Severo:</strong> ${result.historialClinico.dolorDeCabeza ? 'Sí' : 'No'}</p>
          <p><strong>Asma:</strong> ${result.historialClinico.asma ? 'Sí' : 'No'}</p>
          <p><strong>Fracturas:</strong> ${result.historialClinico.fracturas ? 'Sí' : 'No'}</p>
          <p><strong>Convulsiones:</strong> ${result.historialClinico.convulsiones ? 'Sí' : 'No'}</p>
          <p><strong>Problemas en Tórax, Corazón, Pulmones y Abdomen:</strong> ${result.historialClinico.problemasTorax ? 'Sí' : 'No'}</p>
          <p><strong>Especifique:</strong> ${result.historialClinico.especificar}</p>
          <p><strong>Antecedentes Importantes:</strong> ${result.historialClinico.antecedentesImportantes}</p>
        `;
      } else {
        resultDiv.innerHTML = '<p class="text-danger">Paciente no encontrado</p>';
      }
    });

    

  });
  