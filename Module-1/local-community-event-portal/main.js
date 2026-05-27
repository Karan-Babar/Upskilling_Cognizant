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

function validatePhone() {

    const phone = document.getElementById("phone").value;

    const phoneError = document.getElementById("phoneError");

    const phonePattern = /^[0-9]{10}$/;

    if (!phonePattern.test(phone)) {
        phoneError.textContent = "Please enter a valid 10-digit phone number.";
    } else {
        phoneError.textContent = "";
    }
}

function showEventFee() {
    const fee = document.getElementById("eventFee").value;

    const feeDisplay = document.getElementById("feeDisplay");

    if (fee !== "") {
        feeDisplay.textContent =`Event Fee: ₹${fee}`;
    } else {
        feeDisplay.textContent = "";
    }
}

function submitFeedback() {
    alert("Feedback submitted successfully!");
}

function enlargeImage() {

    const image = document.getElementById("eventImage");

    image.style.width = "500px";
}

function countCharacters() {

    const feedbackText = document.getElementById("feedbackText");

    const charCount = document.getElementById("charCount");

    charCount.textContent = feedbackText.value.length;
}