const displayAlertOnButtonClick = () => {
  const button = document.querySelector(".btn.btn-lg.btn-success");
  // TODO: Select the big green button
  // TODO: Bind the `click` event to the button
  // TODO: On click, display `Thank you!` in a JavaScript alert!
  button.addEventListener("click", () => {
    alert("Thank you!");
  });
};

displayAlertOnButtonClick(); // Do not remove!
