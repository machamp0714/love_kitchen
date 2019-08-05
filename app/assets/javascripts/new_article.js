const input0 = document.getElementById('article_pictures_attributes_0_image');
const input1 = document.getElementById('article_pictures_attributes_1_image');
const input2 = document.getElementById('article_pictures_attributes_2_image');
const output = document.getElementById('preview-thumbnails');

const input = [
  input0,
  input1,
  input2
];

let uploadCount = 0;

class Form {
  constructor(index) {
    const form = document.createElement('div');
    form.classList.add('picture-form');
    const icon = document.createElement('i');
    icon.classList.add('fas', 'fa-plus', 'fas-height');
    form.appendChild(icon);

    output.appendChild(form);

    form.addEventListener('click', () => {
      input[index].click();
    });
  }
}

class Picture {
  constructor(file, index) {
    const url = URL.createObjectURL(file);
    const image = new Image();
    image.src = url;
    image.width = 100;
    image.height = 100;

    const thumbnail = document.createElement('div');
    thumbnail.classList.add('preview-container');
    const btn = document.createElement('div');
    const icon = document.createElement('i');
    icon.classList.add('fas', 'fa-times', 'fa-height');
    btn.classList.add('delete-btn');
    btn.appendChild(icon);
    thumbnail.appendChild(image);
    thumbnail.appendChild(btn);

    output.appendChild(thumbnail);

    btn.addEventListener('click', () => {
      if (uploadCount !== input.length) {
        const form = document.querySelector('.picture-form');
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
  el.addEventListener('change', event => {
    const file = event.target.files[0];
    if (file.type !== 'image/jpg' && file.type !== 'image/jpeg' && file.type !== 'image/png') {
      return;
    }

    const form = document.querySelector('.picture-form');
    output.removeChild(form);

    new Picture(file, index);

    uploadCount++;

    if (uploadCount < input.length) {
      new Form(index + 1);
    }
  });
});

new Form(0);