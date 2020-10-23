document.addEventListener('DOMContentLoaded', function(){
  const imagePreview = document.getElementById('image-preview');
  document.getElementById('problem_image').addEventListener('change', function(e){
    const imageContent = document.getElementById('preview-content');
    if (imageContent){
      imageContent.remove();
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('style', 'width: 200px; opacity: .5;');
    blobImage.setAttribute("id", "preview-content")

    imagePreview.appendChild(blobImage);
    
  });
});