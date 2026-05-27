console.log("Welcome to the Community Portal");

window.onload = function () {
    alert("Page Loaded Successfully");
};

const registrationForm = document.getElementById("registrationForm");

const confirmationMessage = document.getElementById("confirmationMessage");

registrationForm.addEventListener("submit", function(event) {

    event.preventDefault();

    const userName = document.getElementById("name").value;

    confirmationMessage.textContent =
        `Thank you ${userName}! Your registration has been submitted successfully.`;
});