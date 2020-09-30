function check() {
  const taskStatusZones = document.querySelectorAll(".task-status-zone");
  const tasks = document.querySelectorAll(".task");
  taskStatusZones.forEach(function (task) {
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
        const parentTask = task.parentNode;
        if (item.checked === true) {
          parentTask.setAttribute("data-check", "true");
        } else if (item.checked === false) {
          parentTask.removeAttribute("data-check");
        }
      };
    });
  });
}
setInterval(check, 1000);