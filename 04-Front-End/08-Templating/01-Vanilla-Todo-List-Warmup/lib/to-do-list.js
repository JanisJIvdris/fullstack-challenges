const todos = [
  { title: "Code a to-do list", done: false },
  { title: "Eat breakfast", done: true },
  { title: "Do some exercise", done: false },
  { title: "Water the plants", done: true }
];

// To-do item HTML 👇
// <div class="shadow-sm rounded px-4 py-3 mb-2 border d-flex">
//   <input class="d-flex form-check-input me-1" type="checkbox">
//   <div>Replace with to-do title</div>
// </div>

// TODO: Dynamically generate a list of to-dos based on `todos` array, and display them
const template = document.querySelector("#listTemplate");
const listContainer = document.querySelector("#todosContainer");
todos.forEach((item) => {
  const clone = template.content.cloneNode(true);
  const checkbox = clone.querySelector("input[type=checkbox]");
  clone.querySelector("#listItem").textContent = item.title;
  if (item.done === true) {
    checkbox.checked = true;
  } else {
    checkbox.checked = false;
  }
  listContainer.appendChild(clone);
});
