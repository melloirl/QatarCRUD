function ExecPythonCommand(pythonCommand){
    var request = new XMLHttpRequest()
    request.open("GET","/"+pythonCommand,true)
    request.send()
}


for(i = 0; i < 14;i++){
    let button = document.getElementById("button-"+(i+1))
    let text = 'window.location.href="read/'+button.textContent + '"'
    button.setAttribute('onClick',text)
}