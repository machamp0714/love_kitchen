const input0 = document.getElementById('article_pictures_attributes_0_image');
const input1 = document.getElementById('article_pictures_attributes_1_image');
const input2 = document.getElementById('article_pictures_attributes_2_image');
const preview = document.getElementById('preview');

const outputImage = blob => {
  const image = new Image();

  const blobURL = URL.createObjectURL(blob);
  image.src = blobURL;

  preview.appendChild(image);
}

input0.addEventListener('change', event => {
  const file = event.target.files[0];
  outputImage(file);

  input0.classList.add('form-hidden');
})

input1.addEventListener('change', event => {
  const file = event.target.files[0];
  outputImage(file);

  input1.classList.add('form-hidden');
})

input2.addEventListener('change', event => {
  const file = event.target.files[0];
  outputImage(file);

  input2.classList.add('form-hidden');
})