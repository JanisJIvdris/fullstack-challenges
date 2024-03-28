const searchForm = document.getElementById("searchForm");

const filteredRestaurants = (category, location) => {
  location = location || "";
  if (location === "") {
    const url = `https://the-fork-api.students.lewagon.co/api/v1/restaurants?category=${category}`;
    return url;
  }
  const url = `https://the-fork-api.students.lewagon.co/api/v1/restaurants?category=${category}&location=${location}`;
  return url;
};

const findForm = () => {
  const forms = document.querySelectorAll(".form-check-input");
  const frmArray = Array.from(forms);
  const form = frmArray.find(e => e.checked);
  return form;
};

searchForm.addEventListener("submit", (event) => {
  // Todo: Find the category selected and build the URL you will send your request to
  event.preventDefault();
  const form = findForm();
  console.log(form);
  const place = document.querySelector("#location");
  const url = filteredRestaurants(form.value, place.value);

  fetch(url)
    .then(response => response.json())
    .then((data) => {
      // Todo: Insert results into the list
      const list = document.querySelector("#restaurant-list");
      let liContent = ``;
      data.forEach((restie) => {
        const info = `<li>${restie.name} in ${restie.address}</li>`;
        liContent += info;
      });
      list.innerHTML = liContent;
    });
});
