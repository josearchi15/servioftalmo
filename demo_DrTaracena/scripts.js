let currentStep = 1;
const totalSteps = 5;

function showStep(step) {
  document.querySelectorAll('.form-step').forEach((element, index) => {
    element.classList.remove('active');
    if (index + 1 === step) {
      element.classList.add('active');
    }
  });
}

function nextStep() {
  if (currentStep < totalSteps) {
    currentStep++;
    showStep(currentStep);
  }
}

function prevStep() {
  if (currentStep > 1) {
    currentStep--;
    showStep(currentStep);
  }
}

document.addEventListener('DOMContentLoaded', function() {
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

  window.editPatient = function(idPaciente) {
    const patient = patients.find(p => p.idPaciente === idPaciente);
    if (patient) {
      formTitle.innerText = 'Actualizar Paciente';
      pacienteForm.idPaciente.value = patient.idPaciente;
      pacienteForm.nombres.value = patient.nombres;
      pacienteForm.apellidos.value = patient.apellidos;
      pacienteForm.apellidoDeCasada.value = patient.apellidoDeCasada;
      pacienteForm.fechaNacimiento.value = patient.fechaNacimiento;
      pacienteForm.dpi.value = patient.dpi;
      pacienteForm.telCel.value = patient.telCel;
      pacienteForm.email.value = patient.email;
      pacienteForm.direccion.value = patient.direccion;
      pacienteForm.profesion.value = patient.profesion;
      updatingPatient = patient;
    }
  };

  window.deletePatient = function(idPaciente) {
    patients = patients.filter(p => p.idPaciente !== idPaciente);
    renderPatientTable();
  };

  // pacienteForm.addEventListener('submit', function(event) {
  //   event.preventDefault();
  //   const newPatient = {
  //     idPaciente: updatingPatient ? updatingPatient.idPaciente : String(Date.now()),
  //     nombres: pacienteForm.nombres.value,
  //     apellidos: pacienteForm.apellidos.value,
  //     apellidoDeCasada: pacienteForm.apellidoDeCasada.value,
  //     fechaNacimiento: pacienteForm.fechaNacimiento.value,
  //     dpi: pacienteForm.dpi.value,
  //     telCel: pacienteForm.telCel.value,
  //     email: pacienteForm.email.value,
  //     direccion: pacienteForm.direccion.value,
  //     profesion: pacienteForm.profesion.value
  //   };

  //   if (updatingPatient) {
  //     patients = patients.map(p => p.idPaciente === updatingPatient.idPaciente ? newPatient : p);
  //     updatingPatient = null;
  //     formTitle.innerText = 'Crear Paciente';
  //   } else {
  //     patients.push(newPatient);
  //   }

  //   pacienteForm.reset();
  //   renderPatientTable();
  // });

  cancelUpdate.addEventListener('click', function() {
    updatingPatient = null;
    formTitle.innerText = 'Crear Paciente';
    pacienteForm.reset();
  });

  renderPatientTable();
});

// document.getElementById('registrationForm').addEventListener('submit', function(event) {
//   // event.preventDefault();
//   alert('Formulario enviado exitosamente!');
// });



// Paciente view 
document.addEventListener('DOMContentLoaded', function() {
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

  window.editPatient = function(idPaciente) {
    const patient = patients.find(p => p.idPaciente === idPaciente);
    if (patient) {
      formTitle.innerText = 'Actualizar Paciente';
      pacienteForm.idPaciente.value = patient.idPaciente;
      pacienteForm.nombres.value = patient.nombres;
      pacienteForm.apellidos.value = patient.apellidos;
      pacienteForm.apellidoDeCasada.value = patient.apellidoDeCasada;
      pacienteForm.fechaNacimiento.value = patient.fechaNacimiento;
      pacienteForm.dpi.value = patient.dpi;
      pacienteForm.telCel.value = patient.telCel;
      pacienteForm.email.value = patient.email;
      pacienteForm.direccion.value = patient.direccion;
      pacienteForm.profesion.value = patient.profesion;
      pacienteForm.emergencyContact1.value = patient.emergencyContact1;
      pacienteForm.emergencyContact1Tel.value = patient.emergencyContact1Tel;
      pacienteForm.emergencyContact2.value = patient.emergencyContact2;
      pacienteForm.emergencyContact2Tel.value = patient.emergencyContact2Tel;
      pacienteForm.facturacionNombre.value = patient.facturacionNombre;
      pacienteForm.facturacionNit.value = patient.facturacionNit;
      pacienteForm.facturacionDireccion.value = patient.facturacionDireccion;
      pacienteForm.seguroAfiliado.value = patient.seguroAfiliado;
      pacienteForm.poliza.value = patient.poliza;
      pacienteForm.idAsegurado.value = patient.idAsegurado;
      pacienteForm.noCarnet.value = patient.noCarnet;
      pacienteForm.diabetes.checked = patient.diabetes;
      pacienteForm.presionAltaBaja.checked = patient.presionAltaBaja;
      pacienteForm.enfermedadesCardiacas.checked = patient.enfermedadesCardiacas;
      pacienteForm.dolorDeCabeza.checked = patient.dolorDeCabeza;
      pacienteForm.asma.checked = patient.asma;
      pacienteForm.fracturas.checked = patient.fracturas;
      pacienteForm.convulsiones.checked = patient.convulsiones;
      pacienteForm.problemasTorax.checked = patient.problemasTorax;
      pacienteForm.especificar.value = patient.especificar;
      pacienteForm.antecedentesImportantes.value = patient.antecedentesImportantes;
      updatingPatient = patient;
    }
  };

  window.deletePatient = function(idPaciente) {
    patients = patients.filter(p => p.idPaciente !== idPaciente);
    renderPatientTable();
  };

  pacienteForm.addEventListener('submit', function(event) {
    event.preventDefault();
    const newPatient = {
      idPaciente: updatingPatient ? updatingPatient.idPaciente : String(Date.now()),
      nombres: pacienteForm.nombres.value,
      apellidos: pacienteForm.apellidos.value,
      apellidoDeCasada: pacienteForm.apellidoDeCasada.value,
      fechaNacimiento: pacienteForm.fechaNacimiento.value,
      dpi: pacienteForm.dpi.value,
      telCel: pacienteForm.telCel.value,
      email: pacienteForm.email.value,
      direccion: pacienteForm.direccion.value,
      profesion: pacienteForm.profesion.value,
      emergencyContact1: pacienteForm.emergencyContact1.value,
      emergencyContact1Tel: pacienteForm.emergencyContact1Tel.value,
      emergencyContact2: pacienteForm.emergencyContact2.value,
      emergencyContact2Tel: pacienteForm.emergencyContact2Tel.value,
      facturacionNombre: pacienteForm.facturacionNombre.value,
      facturacionNit: pacienteForm.facturacionNit.value,
      facturacionDireccion: pacienteForm.facturacionDireccion.value,
      seguroAfiliado: pacienteForm.seguroAfiliado.value,
      poliza: pacienteForm.poliza.value,
      idAsegurado: pacienteForm.idAsegurado.value,
      noCarnet: pacienteForm.noCarnet.value,
      diabetes: pacienteForm.diabetes.checked,
      presionAltaBaja: pacienteForm.presionAltaBaja.checked,
      enfermedadesCardiacas: pacienteForm.enfermedadesCardiacas.checked,
      dolorDeCabeza: pacienteForm.dolorDeCabeza.checked,
      asma: pacienteForm.asma.checked,
      fracturas: pacienteForm.fracturas.checked,
      convulsiones: pacienteForm.convulsiones.checked,
      problemasTorax: pacienteForm.problemasTorax.checked,
      especificar: pacienteForm.especificar.value,
      antecedentesImportantes: pacienteForm.antecedentesImportantes.value
    };

    if (updatingPatient) {
      patients = patients.map(p => p.idPaciente === updatingPatient.idPaciente ? newPatient : p);
      updatingPatient = null;
      formTitle.innerText = 'Crear Paciente';
    } else {
      patients.push(newPatient);
    }

    pacienteForm.reset();
    renderPatientTable();
  });

  cancelUpdate.addEventListener('click', function() {
    updatingPatient = null;
    formTitle.innerText = 'Crear Paciente';
    pacienteForm.reset();
  });

  renderPatientTable();
});

const mockDatabase = [
  {
    idPaciente: '123',
    nombres: 'Juan',
    apellidos: 'Perez',
    apellidoDeCasada: '',
    fechaNacimiento: '1990-01-01',
    dpi: '1234567890123',
    telCel: '5551234567',
    email: 'juan.perez@example.com',
    direccion: 'Calle Falsa 123',
    profesion: 'Ingeniero',
    emergencyContact1: 'Maria Lopez',
    emergencyContact1Tel: '5557654321',
    emergencyContact2: 'Carlos Jimenez',
    emergencyContact2Tel: '5550987654',
    facturacionNombre: 'Juan Perez',
    facturacionNit: '1234567',
    facturacionDireccion: 'Calle Falsa 123',
    seguroAfiliado: 'Seguro Popular',
    poliza: '12345',
    idAsegurado: '67890',
    noCarnet: '112233',
    diabetes: false,
    presionAltaBaja: false,
    enfermedadesCardiacas: false,
    dolorDeCabeza: false,
    asma: false,
    fracturas: false,
    convulsiones: false,
    problemasTorax: false,
    especificar: '',
    antecedentesImportantes: ''
  },
  // Add more patient objects as needed
];
