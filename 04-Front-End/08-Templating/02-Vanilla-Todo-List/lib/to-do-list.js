const todos = [
  { title: "Code a to-do list", done: false },
  { title: "Eat breakfast", done: true },
  { title: "Do some exercise", done: false },
  { title: "Water the plants", done: true }
];

// TODO: Use the template in the `index.html` to dynamically generate a list based on `todos` array
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
