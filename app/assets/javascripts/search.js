const likeCheckBox = document.getElementById("like_count");
const viewCheckBox = document.getElementById("view_count");
const searchForm = document.querySelector(".search-form");
const searchInput = document.querySelector(".search-input");

likeCheckBox.addEventListener("change", (event) => {
  if (event.target.checked && viewCheckBox.checked) {
    viewCheckBox.checked = false;
  }
});

viewCheckBox.addEventListener("change", (event) => {
  if (event.target.checked && likeCheckBox.checked) {
    likeCheckBox.checked = false;
  }
});

searchForm.addEventListener("submit", (event) => {
  if (searchInput.value === "") {
    event.preventDefault();
    return false;
  }
});
