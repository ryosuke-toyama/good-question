function check() {
  const tasks = document.querySelectorAll(".task");
  tasks.forEach(function (task) {
     if (task.getAttribute("data-load") != null) {
      return null;
    }
    task.setAttribute("data-load", "true");
    task.addEventListener("click", () => {
      const taskId = task.getAttribute("data-id");
      console.log(taskId)
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/tasks/${taskId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }
        const item = XHR.response.task;
        if (item.checked === true) {
          task.setAttribute("data-check", "true");
        } else if (item.checked === false) {
          task.removeAttribute("data-check");
        }
      };
    });
  });
}
setInterval(check, 1000);