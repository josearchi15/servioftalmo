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

// document.getElementById('registrationForm').addEventListener('submit', function(event) {
//   // event.preventDefault();
//   alert('Formulario enviado exitosamente!');
// });