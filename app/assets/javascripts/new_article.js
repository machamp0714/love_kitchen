var input0 = document.getElementById("article_pictures_attributes_0_image");
var input1 = document.getElementById("article_pictures_attributes_1_image");
var input2 = document.getElementById("article_pictures_attributes_2_image");
var output = document.getElementById("preview-thumbnails");

var input = [input0, input1, input2];

var uploadCount = 0;

class Form {
  constructor(index) {
    var form = document.createElement("div");
    form.classList.add("picture-form");
    var icon = document.createElement("i");
    icon.classList.add("fas", "fa-plus", "fas-height");
    form.appendChild(icon);

    output.appendChild(form);

    form.addEventListener("click", () => {
      input[index].click();
    });
  }
}

class Picture {
  constructor(file, index) {
    var url = URL.createObjectURL(file);
    var image = new Image();
    image.src = url;
    image.width = 100;
    image.height = 100;

    var thumbnail = document.createElement("div");
    thumbnail.classList.add("preview-container");
    var btn = document.createElement("div");
    var icon = document.createElement("i");
    icon.classList.add("fas", "fa-times", "fa-height");
    btn.classList.add("delete-btn");
    btn.appendChild(icon);
    thumbnail.appendChild(image);
    thumbnail.appendChild(btn);

    output.appendChild(thumbnail);

    btn.addEventListener("click", () => {
      if (uploadCount !== input.length) {
        var form = document.querySelector(".picture-form");
        output.removeChild(form);
      }

      uploadCount--;
      input[index].value = "";
      output.removeChild(thumbnail);
      new Form(index);
    });
  }
}

input.forEach((el, index) => {
  el.addEventListener("change", (event) => {
    var file = event.target.files[0];
    if (
      file.type !== "image/jpg" &&
      file.type !== "image/jpeg" &&
      file.type !== "image/png"
    ) {
      return;
    }

    var form = document.querySelector(".picture-form");
    output.removeChild(form);

    new Picture(file, index);

    uploadCount++;

    if (uploadCount < input.length) {
      new Form(index + 1);
    }
  });
});

new Form(0);
