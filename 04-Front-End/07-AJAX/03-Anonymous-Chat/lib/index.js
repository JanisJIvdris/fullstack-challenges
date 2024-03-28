
const batch = 1524; // change to your own batch id
const baseUrl = "https://wagon-chat.herokuapp.com/";

// Your turn to code!
const refreshButton = document.querySelector("#refresh");
const url = `${baseUrl}${batch}/messages`;
const messagesList = document.querySelector("#messages");

const listMessages = (data) => {
  let liContent = '';
  data.messages.reverse().forEach((message) => {
    const minutesAgo = Math.round((new Date() - new Date(message.created_at)) / 60000);
    const msg = `<li>${message.content} (posted <span class="date">${minutesAgo} minutes ago</span>) by ${message.author}</li>`;
    liContent += msg;
  });
  messagesList.innerHTML = liContent;
};

refreshButton.addEventListener("click", (event) => {
  fetch(url)
    .then(response => response.json())
    .then(data => listMessages(data));
});

const usernameInput = document.querySelector("#your-name");
const messageInput = document.querySelector("#your-message");
const commentForm = document.querySelector("#comment-form");

commentForm.addEventListener("submit", (event) => {
  event.preventDefault();
  const postBody = JSON.stringify({ author: usernameInput.value, content: messageInput.value });
  const makePost = {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: postBody
  };
  fetch(url, makePost)
    .then(response => response.json())
    .then(data => console.log(data));
});
