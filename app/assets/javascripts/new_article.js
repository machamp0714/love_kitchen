const input0 = document.getElementById('article_pictures_attributes_0_image');
const input1 = document.getElementById('article_pictures_attributes_1_image');
const input2 = document.getElementById('article_pictures_attributes_2_image');
const output = document.getElementById('preview-thumbnails');

const input = [
  input0,
  input1,
  input2
];

let currentNum;

class uploadForm {
  
  createForm = id => {
    const form = document.createElement('div');
    form.classList.add('picture-form');

    const icon = document.createElement('i');
    icon.classList.add('fas', 'fa-plus', 'fas-height');
    form.appendChild(icon);

    output.appendChild(form);

    form.addEventListener('click', () => {
      input[id].click();
    });

    input[id].addEventListener('change', event => {
      const file = event.target.files[0];

      if (file.type !== 'image/jpg' && file.type !== 'image/jpeg' && file.type !== 'image/png') {
        return;
      }
      output.removeChild(form);

      const url = URL.createObjectURL(file);
      new Picture(url, id);

      currentNum = id + 1;
      const upload = new uploadForm();
      upload.createForm(currentNum);
    });
  }
}

class Picture {
  constructor(src, id) {
    this.image = new Image();
    this.image.src = src;
    this.image.width = 100;
    this.image.height = 100;
    this.image.classList.add('preview-image');

    this.thumbnail = document.createElement('div');
    this.thumbnail.classList.add('preview-container');
    this.thumbnail.appendChild(this.image);

    this.div = document.createElement('div');
    this.div.classList.add('delete-btn');
    const icon = document.createElement('i');
    icon.classList.add('fas', 'fa-times', 'fa-height');
    this.div.appendChild(icon);
    this.thumbnail.appendChild(this.div);

    output.appendChild(this.thumbnail);

    this.div.addEventListener('click', () => {
      output.removeChild(this.thumbnail);
      input[id].value = "";

      const upload = new uploadForm();
      upload.createForm(id);
    });
  }
}

const initialize = () => {
  const upload = new uploadForm();
  upload.createForm(0);
}

initialize();
