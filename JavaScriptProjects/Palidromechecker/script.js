let check = document.getElementById("check");
let ra = document.getElementsByClassName("resultarea")[0];
let close = document.getElementById("close");


let demo = document.getElementById("demo");
let checkButton = document.getElementById("check");




check.addEventListener("click",function(){
    let inputarea = document.getElementsByClassName("input-area")[0];
    let result = document.getElementById("result");
    if(inputarea.value === ""){
        alert("Please enter something");
        return;
      }

 
 
  const clearstr = inputarea.value.replace(/[\W_]/g, '').toLowerCase();
  const y  = clearstr.split('').reverse().join('');

  if(clearstr === y){
    result.innerHTML = "Palidrome"
  }
  else{
    result.innerHTML = "Not palidrome"
  }
  ra.classList.remove("close");
});
close.addEventListener("click",function(){
    ra.classList.add("close");
    inputarea.value = "";
})











