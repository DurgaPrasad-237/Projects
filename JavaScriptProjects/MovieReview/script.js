var image = document.getElementById("image");
var moviename = document.getElementById("moviename");
var desc = document.getElementById("desc");
var rightbtn = document.querySelector("#rightbutton");
var leftbtm = document.querySelector("#leftbutton");

const movies = [

{
      img : "images/avatar.jpg",
      name : "Avatar",
      desc : "Avatar is a visually groundbreaking sci-fi film directed by James Cameron. Released in 2009," 
      +"it introduced revolutionary 3D technology, immersing audiences in the vibrant world of Pandora." 
      +"While praised for its stunning visuals, some critics noted a familiar storyline "
},
    
    
{
    img : "images/Animal.jpg",
    name : "Animal",
    desc : "Ranbir Kapoor's bloody vampire performance in #Animal is a blockbuster." 
    +"Sandeep Reddy Vanga's masterful direction and Harshavardhan Rameshwar's BGM elevate the film." 
    +"A must-watch for intense storytelling on the big screens! "
},

{
    img : "images/Salaar.jpg",
    name : "Salaar",
    desc : "Salaar is a 5-star cinematic gem, with Prabhas delivering a brilliant performance as Salaar," 
    +"elevating the action genre. Prashanth Neel's storytelling, breathtaking visuals, and meticulous action choreography set a new standard."
    + "A must-watch for its immersive experience and standout filmmaking "
},

{

    img : "images/AvengersEndgame.jpg",
    name : "Avengers EndGame",
    desc : "Avengers: Endgame is a breathtaking cinematic achievement, skillfully concluding the Marvel saga with" 
    +"emotional depth and spectacular action. The ensemble cast shines in a narrative that balances fan service and "
    +"storytelling innovation. A monumental and satisfying epic for Marvel fans worldwide. "

},
{
    
    img : "images/inception.jpg",
    name : "Inception",
    desc : "Inception is a mind-bending triumph, marrying Christopher Nolan's visionary direction with a complex narrative." 
    +"Leonardo DiCaprio leads a stellar cast in a visually stunning and intellectually stimulating heist thriller. With its innovative"
     +"concept and gripping execution, it stands as a cinematic masterpiece. "

}

];


let currentItem = 0;
window.addEventListener ('DOMContentLoaded',function(){
showPerson(currentItem);
})
function showPerson(poster){
    const item = movies[poster];
    image.src= item.img;
    moviename.textContent = item.name;
    desc.textContent = item.desc;
}
rightbtn.addEventListener("click",function(){
    currentItem++;
    if(currentItem > movies.length -1){
        currentItem = 0;
    }
    showPerson(currentItem);
})
leftbtm.addEventListener("click",function(){
    currentItem--;
    if(currentItem < 0){
        currentItem = movies.length -1;
    }
    showPerson(currentItem);

})