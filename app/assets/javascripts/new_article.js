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
  constructor() {
    this.formList = [];

    for(let i = 0; i < 3; i++) {
      const form = document.createElement('div');
      form.classList.add('picture-form', 'hidden');

      const icon = document.createElement('i');
      icon.classList.add('fas', 'fa-plus', 'fas-height');
      form.appendChild(icon);

      output.appendChild(form);

      this.formList.push(form);
    }

    input.forEach((e, index) => {
      this.formList[index].addEventListener('click', () => {
        e.click();
      })
      e.addEventListener('change', event => {
        const file = event.target.files[0];

        if (file.type !== 'image/jpg' && file.type !== 'image/jpeg' && file.type !== 'image/png') {
          return;
        }

        this.deleteForm(index);
        this.addPreview(file, index);
        // this.createForm(index);
      });
    });

    this.formList[0].classList.remove('hidden');
  }

  deleteForm = index => {
    this.formList[index].classList.add('hidden');
  }

  createForm = index => {
    this.formList[index].classList.remove('hidden');
  }

  addPreview = (file, index) => {
    const url = URL.createObjectURL(file);
    new Picture(url, index);
  }
}

class Picture {
  constructor(src, index) {
    this.image = new Image();
    this.image.src = src;
    this.image.width = 100;
    this.image.height = 100;
    this.image.classList.add('preview-image');

    this.thumbnail = document.createElement('div');
    this.thumbnail.classList.add('preview-container');
    this.thumbnail.appendChild(this.image);

    this.btn = document.createElement('div');
    this.btn.classList.add('delete-btn');
    const icon = document.createElement('i');
    icon.classList.add('fas', 'fa-times', 'fa-height');
    this.btn.appendChild(icon);
    this.thumbnail.appendChild(this.btn);

    output.appendChild(this.thumbnail);
  }
}

new uploadForm();
