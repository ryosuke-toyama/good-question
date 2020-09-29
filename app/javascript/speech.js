if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener('load',function(){
    const startBtn = document.querySelector('#start-btn');
    const stopBtn = document.querySelector('#stop-btn');
    const toDo = document.querySelector('#todo');
  
    SpeechRecognition = webkitSpeechRecognition || SpeechRecognition;
    let recognition = new SpeechRecognition();
  
    recognition.lang = 'ja-JP';
    recognition.interimResults = true;
    recognition.continuous = true;
  
  
    let finalTranscript = ''; // 確定した(黒の)認識結果
  
    recognition.onresult = (event) => {
      let interimTranscript = ''; // 暫定(灰色)の認識結果
      for (let i = event.resultIndex; i < event.results.length; i++) {
        let transcript = event.results[i][0].transcript;
        if (event.results[i].isFinal) {
          finalTranscript += transcript;
        } else {
          interimTranscript = transcript;
        }
      }
      toDo.innerHTML = finalTranscript + interimTranscript ;
    }
  
  
    startBtn.onclick = () => {
      recognition.start();
        if(stopBtn.style.display == "none"){
          startBtn.style.display = "none";
          stopBtn.style.display = "block";
        }else{
          startBtn.style.display = "block";
          stopBtn.style.display = "none";
        }
      }
    stopBtn.onclick = () => {
      recognition.stop();
      if(stopBtn.style.display == "none"){
        startBtn.style.display = "none";
        stopBtn.style.display = "block";
      }else{
        startBtn.style.display = "block";
        stopBtn.style.display = "none";
      }
    }
  })
};