$(document).on('turbolinks:load', function () {
  let currentNum = 0;
  const thumbnails = document.querySelectorAll('.thumbnail');
  const thumbnailList = document.querySelectorAll('.thumbnail-list');
  const mainImage = document.querySelector('main img');
  const images = Array.from(thumbnails).map(thumbnail => {
    return thumbnail.src;
  });

  function removeCurrentClass() {
    thumbnailList[currentNum].classList.remove('current');
  }

  function addCurrentClass() {
    thumbnailList[currentNum].classList.add('current');
  }
  if (Array.from(thumbnailList).length > 0) {
    thumbnailList[0].classList.add('current');
    thumbnailList.forEach((li, index) => {
      li.addEventListener('mouseenter', () => {
        removeCurrentClass();
        currentNum = index;
        addCurrentClass();
        mainImage.src = images[currentNum];
      });
    });
  }
});
