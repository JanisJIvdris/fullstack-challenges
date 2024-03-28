/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */
/* eslint-disable import/extensions */

import runChallenges from "../spec/inbox_examiner.js";

const hasNewMessage = () => {
  // TODO: return true with a probability of 20%.
  if (Math.random() <= 0.2) {
    return true;
  }
  return false;
};

const newMessage = () => {
  // TODO: return a random message as an object with two keys, subject and sender
  const senders = [
    "Valdis",
    "Kuvaldis",
    "Haywood",
    "Swagmaster_69",
    "ROnald",
    "AAAAaaAAAaaa",
    "Fibonachi",
  ];
  const subjects = [
    "swag",
    "You swag, but do you even YOLO?",
    "Its LIT",
    "Ya fired",
    "Do you want to earn 10000000000 eur?",
  ];
  let message = {
    subject: subjects[Math.floor(Math.random() * subjects.length)],
    sender: senders[Math.floor(Math.random() * senders.length)],
  };
  return message;
};

const appendMessageToDom = (message) => {
  // TODO: append the given message to the DOM (as a new row of `#inbox`)
  const inbox = document.querySelector("#inbox");
  inbox.insertAdjacentHTML(
    "afterbegin",
    `<div class="row message unread">
      <div class="col-3">${message.sender}</div>
      <div class="col-9">${message.subject}</div>
    </div>`
  );
};

const refresh = () => {
  // TODO: Implement the global refresh logic. If there is a new message,
  //       append it to the DOM. Update the unread counter in title as well.

  let prob = hasNewMessage;
  let count = document.querySelector("#count");
  if (prob === true) {
    appendMessageToDom(newMessage);
    count.innerHTML += 1;
  }
  document.location.reload();
};

// Do not remove these lines.
if (typeof window === "object") {
  document.addEventListener("DOMContentLoaded", () => {
    setInterval(refresh, 1000);
  });
}

// Checking exercise answers. DO NOT MODIFY THIS LINE.
runChallenges(hasNewMessage, newMessage);
export { hasNewMessage, newMessage };
