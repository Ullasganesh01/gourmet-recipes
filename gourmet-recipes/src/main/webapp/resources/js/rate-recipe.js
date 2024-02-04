function setRating(value) {
  document.getElementById("rating").value = value;
  document
    .querySelectorAll(".rating-stars")
    .forEach((star) => (star.style.color = ""));
  for (let i = 1; i <= value; i++) {
    document.querySelector(".rating-stars:nth-child(" + i + ")").style.color =
      "orange";
  }
}

function validateRating() {
  let isRated = false;
  let rating = document.getElementById("rating").value;
  if (rating > 0 && rating <= 5) {
    isRated = true;
  } else {
    let ratingErr = document.getElementById("rating-error");
    ratingErr.innerHTML = " Please select star";
    ratingErr.style.color = "red";
    ratingErr.style.display = "block";
    isRated = false;
  }
  return isRated;
}
