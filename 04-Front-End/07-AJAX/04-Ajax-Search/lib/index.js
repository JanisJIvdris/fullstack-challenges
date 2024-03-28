const omdbapiUrl = "http://www.omdbapi.com/";
const apiKey = "8691812a";
function createMovieCard(card) {
  const { Poster, Title, Year } = card;
  return `
    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
      <div class="card mb-2">
        <img src="${Poster}" class="card-img-top" alt="${Title}">
        <div class="card-body">
          <span class="badge bg-primary mb-2">${Year}</span>
          <h5 class="card-title">${Title}</h5>
        </div>
      </div>
    </div>
  `;
}
function renderMovies(data) {
  const movies = data.Search;
  const frame = document.querySelector("#movie-cards");
  const cardElements = movies.map(createMovieCard).join('');
  frame.innerHTML = cardElements;
}
const form = document.querySelector("#search-movies");
const movieName = document.querySelector("#movie-name");
function handleError(error) {
  console.error("Error fetching movies:", error);
}
function fetchMovies(url) {
  fetch(url)
    .then(response => response.json())
    .then(renderMovies)
    .catch(handleError);
}
function handleSearch(event) {
  event.preventDefault();
  const movie = movieName.value;
  const url = `${omdbapiUrl}?s=${movie}&apikey=${apiKey}`;
  console.log(url);
  fetchMovies(url);
}
form.addEventListener("keyup", handleSearch);
