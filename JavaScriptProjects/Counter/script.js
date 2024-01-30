let demo = document.getElementById("demo");
let clear = document.getElementById("clear");
var num = 0;
function primeNumber(){
    num++;
   for(var i = num ; i<1000; i++){
    let count = 0;
    for(var j = 1; j<=i; j++){
        if(i%j == 0){
            count++;
        }
    }
    if(count == 2){
        num = i;
        demo.innerHTML = num;
        break;
    }
   }
 
} 
function compositeNumber(){
    num++;
    for(var i = num ; i<1000; i++){
        let count = 0;
        for(var j = 1; j<=i; j++){
            if(i%j == 0){
                count++;
            }
        }
        if(count > 2){
            num = i;
            demo.innerHTML = num;
            break;
        }
      
       }   
}
function clearf(){
    num = 0;
    demo.innerHTML = num;
}
clear.addEventListener("click",clearf);










