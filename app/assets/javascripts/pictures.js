var MAX_UPLOADED_LENGTH = 2;
var select = document.getElementById("selectPhoto");
var input = document.getElementById("add-picture");

select.addEventListener("click", () => {
  if (gon.pictures_length > MAX_UPLOADED_LENGTH) {
    return;
  }
  input.click();
});
