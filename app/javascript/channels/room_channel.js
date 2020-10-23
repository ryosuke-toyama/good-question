import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected: function() {
    //called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    const imageContent = document.getElementById('preview-content');
    if (imageContent){
      imageContent.remove();
    }
    const problemContents = document.getElementById('problem-contents')
    const pattern = /T\d{1,2}:\d{2}/;
    const extraction = data.problem.created_at.match(pattern);
    const strftime = extraction[0].slice(1);
    const HTML = `  
      <li class="problem-direction">
        <div class="problem-text">
          ${data.problem.content}
        </div>
        <div class="created_at">
          ${strftime}
        </div>
      </li>`;
    problemContents.insertAdjacentHTML("beforeend", HTML);

    const formText = document.getElementById("todo");
    formText.value = "";
  }
});
