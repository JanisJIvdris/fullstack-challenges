const agifyApiUrl = "https://api.agify.io/";

const displayAge = (event) => {
  event.preventDefault();
  const firstName = document.getElementById("first-name").value;
  const url = `https://api.agify.io/?name=${firstName}`;

  // Introduce a delay between successive requests to prevent rate limiting
  setTimeout(() => {
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        const age = data.age;
        const p = document.querySelector("#your-age");
        p.innerText = `You're ${age} years old`;
      })
      .catch(error => console.error("Error fetching age:", error));
  }, 1000); // Delay for 1 second (1000 milliseconds)
};

const form = document.getElementById("fetch-age");
form.addEventListener("submit", displayAge);
