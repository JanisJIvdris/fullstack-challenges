// TODO: Autocomplete the input with AJAX calls.
const list = document.querySelector("#results");
const search = document.querySelector("#search");
search.addEventListener("keyup", (event) => {
  const url = `https://wagon-dictionary.herokuapp.com/autocomplete/${search.value}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      let liContent = ``;
      data.words.forEach((word) => {
        const message = `<li>${word}</li>`;
        liContent += message;
      });
      list.innerHTML = liContent;
    });
});
