// TODO: React to a click on the button!

const button = document.querySelector('#clickme');
button.addEventListener("click", () => {
  button.classList.add("disabled");
  button.innerText = "Bingo!";
  const sound = new Audio('sound.mp3');
  sound.play();
});
