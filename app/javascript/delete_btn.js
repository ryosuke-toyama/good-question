function delete_btn(){
  const problemLists = document.querySelectorAll('.problem-direction');

  problemLists.forEach(function (problem) {
    problem.addEventListener("mouseover",()=>{
      const deleteBtn = problem.getElementsByTagName("div");
      deleteBtn[2].removeAttribute("style");
    })
    
    problem.addEventListener("mouseout",()=>{
      const deleteBtn = problem.getElementsByTagName("div");
      deleteBtn[2].setAttribute("style", "display: none;");
    })
  })
};

setInterval(delete_btn, 1000);