console.log("Welcome to the Community Portal");

window.onload = function () {
  window.scrollTo(0, 0);
  alert("Page Loaded Successfully");
};

const events = [
  {
    id: 1,
    name: "Music Festival",
    date: "2026-06-10",
    category: "Music",
    seats: 50,
    image: "assets/images/event1.png",
  },

  {
    id: 2,
    name: "Food Carnival",
    date: "2026-07-05",
    category: "Food",
    seats: 30,
    image: "assets/images/event2.png",
  },

  {
    id: 3,
    name: "Workshop Event",
    date: "2026-08-12",
    category: "Education",
    seats: 20,
    image: "assets/images/event4.png",
  },
];

function displayEvents(eventList = events) {
  const container = document.getElementById("eventContainer");
  container.innerHTML = "";
  eventList.forEach((event) => {
    container.innerHTML += `
        
        <article class="eventCard">
            <img src="${event.image}"
                 alt="${event.name}"
                 class="eventImage">
            <h3>${event.name}</h3>
            <p>Date: ${event.date}</p>
            <p>Seats Available: <span style="color: red; font-weight: bold">${event.seats}</span></p>
            <a href="#registration" class="registerBtn">
                <button onclick="registerUser(${event.id})">
                   Register
                </button>
            </a>
        </article>
        `;
  });
}

displayEvents();

function registerUser(eventId) {
  const selectedEvent = events.find((event) => event.id === eventId);

  if (selectedEvent.seats > 0) {
    selectedEvent.seats--;
    alert(`Registration successful for ${selectedEvent.name}`);
    displayEvents();
  } else {
    alert(`Sorry! No seats available for ${selectedEvent.name}`);
  }
}
function filterEventsByCategory(category) {
  if (category === "All") {
    displayEvents();

    return;
  }

  const filteredEvents = events.filter((event) => event.category === category);

  displayEvents(filteredEvents);
}
const categoryFilter = document.getElementById("categoryFilter");

categoryFilter.addEventListener("change", function () {
  filterEventsByCategory(categoryFilter.value);
});

function searchEvents(searchText) {
  const filteredEvents = events.filter((event) =>
    event.name.toLowerCase().includes(searchText.toLowerCase()),
  );

  displayEvents(filteredEvents);
}

const searchInput = document.getElementById("searchInput");

searchInput.addEventListener("keyup", function () {
  searchEvents(searchInput.value);
});

async function sendRegistration(registrationData) {
  try {
    const response = await fetch("https://jsonplaceholder.typicode.com/posts", {
      method: "POST",

      headers: {
        "Content-Type": "application/json",
      },

      body: JSON.stringify(registrationData),
    });

    if (!response.ok) {
      throw new Error("Registration Failed");
    }

    const data = await response.json();

    return data;
  } catch (error) {
    throw error;
  }
}

const registrationForm = document.getElementById("registrationForm");

const confirmationMessage = document.getElementById("confirmationMessage");

const statusMessage = document.getElementById("statusMessage");

registrationForm.addEventListener("submit", function (event) {
  event.preventDefault();

  console.log("Form Submission Started");

  const userName = document.getElementById("name").value;

  const email = document.getElementById("email").value;

  const eventType = document.getElementById("eventType").value;

  const registrationData = {
    name: userName,
    email: email,
    eventType: eventType,
  };

  statusMessage.textContent = "Sending registration...";

  setTimeout(async () => {
    try {
      const data = await sendRegistration(registrationData);

      statusMessage.textContent = "";

      confirmationMessage.textContent = `Thank you ${userName}! Your registration has been submitted successfully.`;

      registrationForm.reset();

      console.log(data);
      console.log("Registration Successful");
    } catch (error) {
      statusMessage.textContent = "Failed to submit registration.";

      console.error(error);
    }
  }, 2000);
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
    feeDisplay.textContent = `Event Fee: ₹${fee}`;
  } else {
    feeDisplay.textContent = "";
  }
}

function submitFeedback() {
  alert("Feedback submitted successfully!");
  const number = document.getElementById("phone");
  const feedback = document.getElementById("feedbackText");
  number.value = "";
  feedback.value = "";
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
window.onbeforeunload = function () {
  return "You have unsaved changes. Are you sure you want to leave?";
};

function savePreference() {
  const preferredEvent = document.getElementById("preferredEvent").value;

  localStorage.setItem("preferredEvent", preferredEvent);

  sessionStorage.setItem("sessionMessage", "Preference Saved");

  const message = document.getElementById("savedPreferenceMessage");

  message.textContent = `Your preferred event "${preferredEvent}" has been saved.`;
}

window.addEventListener("load", function () {
  const savedEvent = localStorage.getItem("preferredEvent");

  if (savedEvent) {
    document.getElementById("preferredEvent").value = savedEvent;

    document.getElementById("savedPreferenceMessage").textContent =
      `Previously selected event loaded: ${savedEvent}`;
  }
});

function clearPreferences() {
  localStorage.clear();

  sessionStorage.clear();

  document.getElementById("preferredEvent").value = "";

  document.getElementById("savedPreferenceMessage").textContent =
    "Preferences cleared successfully.";
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
    maximumAge: 0,
  };

  navigator.geolocation.getCurrentPosition(
    function (position) {
      const latitude = position.coords.latitude;

      const longitude = position.coords.longitude;

      output.innerHTML = `
                Latitude: ${latitude}
                <br>
                Longitude: ${longitude}
                `;
    },

    function (error) {
      switch (error.code) {
        case error.PERMISSION_DENIED:
          output.textContent = "Location access denied by user.";
          break;

        case error.POSITION_UNAVAILABLE:
          output.textContent = "Location information unavailable.";
          break;

        case error.TIMEOUT:
          output.textContent = "Location request timed out.";
          break;

        default:
          output.textContent = "An unknown error occurred.";
      }
    },

    options,
  );
}

$("#demoBtn").click(function () {
    $("#jqueryCard").fadeOut(1000);
    $("#jqueryCard").fadeIn(1000);
});