const likeCheckBox = document.getElementById("like_count");
const viewCheckBox = document.getElementById("view_count");
const searchForm = document.querySelector(".search-form");

likeCheckBox.addEventListener("change", (event) => {
  if (event.target.checked && viewCheckBox.checked) {
    viewCheckBox.checked = false;
  }
  searchForm.submit();
});

viewCheckBox.addEventListener("change", (event) => {
  if (event.target.checked && likeCheckBox.checked) {
    likeCheckBox.checked = false;
  }
  searchForm.submit();
});
