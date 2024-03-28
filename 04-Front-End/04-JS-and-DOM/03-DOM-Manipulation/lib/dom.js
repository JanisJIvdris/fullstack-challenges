/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */
/* eslint-disable import/extensions */
import runChallenges from "../spec/examiner.js";

// INSTRUCTIONS - PLEASE READ!!
// Here are some challenges. Solve them from top to bottom

// **Each time** you complete a challenge, please commit and push!
// This is a good practice. Each time you make some progress in software
// development, you want to save a snapshot.

// Ex 1. Read what's written in the email input
//       Make the function getEmail() return it
const getEmail = () => {
  // TODO: return the email
  const email = document.querySelector("#email");
  return email.value;
};

// /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
const borisesEmail = getEmail();

// Ex 2. Change the content of the email input by writing your own email address
const email = document.querySelector("#email");
email.value = "valdisKuvaldis@gmail.com";
// Ex 3. Replace the email hint (next to the input) with 'This is my email now'
//       The text should be emphasized using a <strong> tag
const hint = document.querySelector("#email-hint");
hint.innerHTML = "<strong>This is my email now</strong>";

// Ex 4. Add the .blue CSS class to the tr element inside of the table header (<thead>)
const blue = document.querySelectorAll("thead tr");
Array.from(blue).forEach(element => element.classList.add("blue"));

// Ex 5. Count the number of table body rows there are
//       Make the function teamCount() return it
const teamCount = () => {
  // TODO: return the number of teams
  const teams = document.querySelectorAll("tbody tr");
  return teams.length;
};

// /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
const teamCountBeforeAddition = teamCount();

// Ex 6. Say there is a 15th team added to the table.
//       Add a row at the bottom, this new team should have zero points.
const teams = document.querySelector("tbody");
teams.insertAdjacentHTML(
  "beforeend",
  "<tr><td>15</td><td>Cloud9 </td><td>0</td></tr>"
);

// Ex 7. Write some code to get the points for the first team
//       (Rugby Club Toulonnais)
const firstTeamPoints = () => {
  const value77 = document.querySelector("#data table tbody tr:first-child td:nth-child(3)").innerHTML;
  const parsedValue = parseInt(value77, 10);
  return parsedValue;
};

// Ex 8.

document.addEventListener("DOMContentLoaded", () => {
  const headerRow = document.querySelector("thead tr");
  headerRow.style.backgroundColor = "#DDF4FF";
});

// Ex 9. Remove the "Email:" label from the DOM

const imail = document.querySelector("label");
imail.remove();
// Checking exercise answers. DO NOT MODIFY THIS LINE
runChallenges(borisesEmail, teamCountBeforeAddition, firstTeamPoints);
