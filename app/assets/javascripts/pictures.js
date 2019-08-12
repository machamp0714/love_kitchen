const MAX_UPLOADED_LENGTH = 2;
const select = document.getElementById("selectPhoto");
const input = document.getElementById("add-picture");

select.addEventListener("click", () => {
  if (gon.pictures_length > MAX_UPLOADED_LENGTH) {
    return;
  }
  input.click();
});
