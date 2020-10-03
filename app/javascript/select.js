window.addEventListener('load',function(){
  const userBar = document.querySelectorAll('.user-bar');
  const userConfirmationBar = document.querySelector('.user-confirmation-bar');
  const selectUser = document.querySelector('.select-user');

  userBar.forEach(function (user) {
   user.addEventListener("click", () => {
    let userName = user.getAttribute("data-name");
    let userId = user.getAttribute("data-id");
    userConfirmationBar.innerHTML = userName
    selectUser.setAttribute("value", userId)
  });
 });
});