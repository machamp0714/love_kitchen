const searchForm = document.getElementById("search-article-form");
const searchInput = document.querySelector(".search-input");

searchForm.addEventListener("submit", (event) => {
  if (searchInput.value === "") {
    event.preventDefault();
    return;
  }
});
