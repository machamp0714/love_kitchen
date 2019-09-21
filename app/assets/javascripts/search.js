const likeCheckBox = document.getElementById("like_count");
const viewCheckBox = document.getElementById("view_count");
const optionForm = document.querySelector(".option-form");

likeCheckBox.addEventListener("change", (event) => {
  if (event.target.checked && viewCheckBox.checked) {
    viewCheckBox.checked = false;
  }
  optionForm.submit();
});

viewCheckBox.addEventListener("change", (event) => {
  if (event.target.checked && likeCheckBox.checked) {
    likeCheckBox.checked = false;
  }
  optionForm.submit();
});
