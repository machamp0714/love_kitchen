const likeCheckBox = document.getElementById("like_count");
const viewCheckBox = document.getElementById("view_count");

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
