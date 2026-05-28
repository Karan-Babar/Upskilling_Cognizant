console.log("Welcome to the Community Portal");

window.onload = function () {
    window.scrollTo(0, 0);
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

function videoReady() {

    const videoMessage = document.getElementById("videoMessage");

    videoMessage.textContent = "Video ready to play";
}
window.onbeforeunload = function() {

    return "You have unsaved changes. Are you sure you want to leave?";
};

function savePreference() {

    const preferredEvent = document.getElementById("preferredEvent").value;

    localStorage.setItem(
        "preferredEvent",
        preferredEvent
    );

    sessionStorage.setItem(
        "sessionMessage",
        "Preference Saved"
    );

    const message = document.getElementById("savedPreferenceMessage");

    message.textContent = `Your preferred event "${preferredEvent}" has been saved.`;
}

window.addEventListener("load", function () {

    const savedEvent = localStorage.getItem("preferredEvent");

    if (savedEvent) {

        document.getElementById("preferredEvent").value = savedEvent;

        document.getElementById(
            "savedPreferenceMessage"
        ).textContent = `Previously selected event loaded: ${savedEvent}`;
    }
});

function clearPreferences() {

    localStorage.clear();

    sessionStorage.clear();

    document.getElementById("preferredEvent").value = "";

    document.getElementById(
        "savedPreferenceMessage"
    ).textContent = "Preferences cleared successfully.";
}

function findLocation() {

    const output = document.getElementById("locationOutput");

    if (!navigator.geolocation) {

        output.textContent = "Geolocation is not supported by your browser.";

        return;
    }

    output.textContent = "Locating nearby events...";

    const options = {
        enableHighAccuracy: true,
        timeout: 10000,
        maximumAge: 0
    };

    navigator.geolocation.getCurrentPosition(

        function(position) {

            const latitude = position.coords.latitude;

            const longitude = position.coords.longitude;

            output.innerHTML =
                `
                Latitude: ${latitude}
                <br>
                Longitude: ${longitude}
                `;
        },

        function(error) {
            switch(error.code) {
                case error.PERMISSION_DENIED:
                    output.textContent = "Location access denied by user.";
                    break;

                case error.POSITION_UNAVAILABLE:
                    output.textContent = "Location information unavailable.";
                    break;

                case error.TIMEOUT:
                    output.textContent =
                        "Location request timed out.";
                    break;

                default:
                    output.textContent =
                        "An unknown error occurred.";
            }
        },

        options
    );
}