/* eslint-disable no-undef */
const showMap = (userInput) => {
  // Construct the URL (with apiKey & userInput) and make the fetch request to the mapbox API
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${userInput}.json?access_token=pk.eyJ1IjoiZnJhbmNlc2NhbWlsayIsImEiOiJjbGwwcDJ0dTIwZ3MxM2dwMzRjY3M1M28zIn0.qx_JDU3qJqQPDLQTHZghmg`;

  fetch(url)
    .then(response => response.json())
    .then((data) => {
      // Insert the info into the DOM
      // - Extract the coordinates from the parsed JSON response (lang, lat)
      // - Display the coordinates in the element where the coordinates will be displayed
      // - Create a map using the Mapbox API and the coordinates
      // - Add a marker to the map at the coordinates
      const displayCoordinates = document.querySelector(".lead");
      const coordinates = data.features[0].center;
      displayCoordinates.innerText = `${coordinates[0]}, ${coordinates[1]}`;
      mapboxgl.accessToken = "pk.eyJ1IjoiZnJhbmNlc2NhbWlsayIsImEiOiJjbGwwcDJ0dTIwZ3MxM2dwMzRjY3M1M28zIn0.qx_JDU3qJqQPDLQTHZghmg";
      const map = new mapboxgl.Map({
        container: "map",
        style: "mapbox://styles/mapbox/streets-v9",
        center: [coordinates[0], coordinates[1]],
        zoom: 12,
      });

      new mapboxgl.Marker()
        .setLngLat([coordinates[0], coordinates[1]])
        .addTo(map);
    });
};

// Select the form element
const mapForm = document.querySelector("#map-form");

// Add event listener to the form
mapForm.addEventListener("submit", (e) => {
  e.preventDefault();
  const userInput = document.querySelector(".form-control").value;
  showMap(userInput);
});
