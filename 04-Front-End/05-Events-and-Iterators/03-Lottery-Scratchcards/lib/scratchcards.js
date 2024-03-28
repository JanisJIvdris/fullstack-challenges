// TODO: Write your gambling application here.

// Select all elements with the class "scratchcard" and store them in the cards variable
const cards = document.querySelectorAll(".scratchcard");

// For each card element, add a click event listener
cards.forEach((card) => {
  card.addEventListener("click", () => {
    // Select the balance element and store it in the balance variable
    const balance = document.querySelector("#balance");

    // Extract the numerical value from the balance element's
    // text content and store it in the number variable
    const number = parseInt(balance.innerText, 10);

    // Check if the card has not been scratched yet and the user's balance is sufficient
    if (card.dataset.scratched === "false" && number >= 10) {
      // Extract the prize amount associated with the card and store it in the prize variable
      const prize = parseInt(card.dataset.amount, 10);

      // Calculate the new balance after deducting the cost of playing and adding the prize
      const newBalance = number - 10 + prize;

      // Update the card's scratched status to indicate it has been scratched
      card.dataset.scratched = "true";

      // Update the text content of the card to display the prize amount
      card.innerText = `dollaz:${prize}`;

      // If the new balance is non-negative, update the balance element's text content
      if (newBalance >= 0) {
        balance.innerText = `${newBalance}`;
      }
    }
  });
});
