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
        <a class="problem-derete-btn-space" rel="nofollow" data-method="delete" href="/rooms/${data.problem.room_id}/problems/${data.problem.id}">
          <div class="problem-delete-btn" id="problem-delete-btn" style="display: none;"></div>
        </a>
      </li>`;
    problemContents.insertAdjacentHTML("beforeend", HTML);

    const formText = document.getElementById("todo");
    formText.value = "";

    const target = document.getElementById("center");
    target.scrollTop = target.scrollHeight;

  }
});
