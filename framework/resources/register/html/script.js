const container = document.getElementById('register-container');
const form = document.getElementById('register-form');

// Set max date to 18 years ago (must be 18+)
const today = new Date();
const maxDate = new Date(today.getFullYear() - 18, today.getMonth(), today.getDate());
document.getElementById('birthday').max = maxDate.toISOString().split('T')[0];

// Set min date to 100 years ago
const minDate = new Date(today.getFullYear() - 100, today.getMonth(), today.getDate());
document.getElementById('birthday').min = minDate.toISOString().split('T')[0];

// Listen for NUI messages from client
window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.action === 'setVisible') {
        if (data.toggle) {
            container.classList.remove('hidden');
            form.reset();
        } else {
            container.classList.add('hidden');
        }
    }
});

// Handle form submission
form.addEventListener('submit', function(e) {
    e.preventDefault();

    const firstName = document.getElementById('firstName').value.trim();
    const lastName = document.getElementById('lastName').value.trim();
    const birthday = document.getElementById('birthday').value;
    const gender = document.getElementById('gender').value;

    // Validate
    if (firstName.length < 3) {
        alert('First name must be at least 3 characters');
        return;
    }

    if (lastName.length < 3) {
        alert('Last name must be at least 3 characters');
        return;
    }

    if (!birthday) {
        alert('Please select your date of birth');
        return;
    }

    if (!gender) {
        alert('Please select a gender');
        return;
    }

    // Only allow letters in names
    const nameRegex = /^[a-zA-Z]+$/;
    if (!nameRegex.test(firstName) || !nameRegex.test(lastName)) {
        alert('Names can only contain letters');
        return;
    }

    // Send to client
    fetch('https://flake_framework/ConfirmRegister', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            firstName: firstName,
            lastName: lastName,
            birthday: birthday,
            gender: gender
        })
    });
});

// Close on escape key (optional - commented out to force registration)
// document.addEventListener('keydown', function(e) {
//     if (e.key === 'Escape') {
//         fetch('https://flake_framework/closeUI', {
//             method: 'POST',
//             headers: { 'Content-Type': 'application/json' },
//             body: JSON.stringify({})
//         });
//     }
// });
