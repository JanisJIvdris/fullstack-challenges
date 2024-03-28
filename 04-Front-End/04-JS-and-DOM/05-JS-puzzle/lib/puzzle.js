// Select all the tiles
const tiles = document.querySelectorAll("td");

const canMove = (tile) => {
  // Check if a tile has an empty neighbour
  const tileIndex = tile.cellIndex;
  const tileRow = tile.parentElement.rowIndex;
  const emptyTile = document.querySelector(".empty");
  const emptyTileIndex = emptyTile.cellIndex;
  const emptyTileRow = emptyTile.parentElement.rowIndex;

  return (
    (tileRow === emptyTileRow && tileIndex + 1 === emptyTileIndex)
    || (tileRow === emptyTileRow && tileIndex - 1 === emptyTileIndex)
    || (tileIndex === emptyTileIndex && tileRow + 1 === emptyTileRow)
    || (tileIndex === emptyTileIndex && tileRow - 1 === emptyTileRow)
  );
};

const moveTile = (element) => {
  // Move the tile
  const emptyTile = document.querySelector(".empty");
  emptyTile.textContent = element.textContent;
  emptyTile.classList.remove("empty");
  element.classList.add("empty");
  element.textContent = "";
};

const checkIfPlayerWins = () => {
  // Check if player has won
  let win = true;
  tiles.forEach((tile, index) => {
    const number = parseInt(tile.textContent, 16);
    if (number !== index + 1 && index !== tiles.length - 1) {
      win = false;
    }
  });
  if (win) {
    console.log("Congratulations! You've won!");
  }
};

// Add event listener on each tile - Do not change the following
tiles.forEach((tile) => {
  tile.addEventListener("click", () => {
    if (canMove(tile)) {
      moveTile(tile);
      checkIfPlayerWins();
    }
  });
});
