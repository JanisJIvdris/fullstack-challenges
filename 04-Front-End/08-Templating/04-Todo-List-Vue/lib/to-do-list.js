// eslint-disable-next-line import/no-unresolved
import { createApp } from "vue";

const template = document.querySelector("#todoTemplate");
const input = document.querySelector("#listInput");
const button = document.querySelector("#listSubmitButton");
const todos = [];

button.addEventListener("click", (event) => {
  event.preventDefault();
  const listItem = input.value;
  todos.push(listItem);

  createApp({
    data() {
      return {
        todos,
      };
    },
    template: `
      <div>
        <div v-for="(todo, index) in todos" :key="index" class="shadow-sm rounded px-4 py-3 mb-2 border d-flex">
          <input class="d-flex form-check-input me-1" type="checkbox">
          <div class="title">{{ todo }}</div>
        </div>
      </div>`,
  }).mount("#todosContainer");
  input.value = "";
});
