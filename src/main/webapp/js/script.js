// Declare the Elements 
const dispNum = document.querySelector(".display .num");
const dispErr = document.querySelector(".container .stg");


window.onload = function () {

    function showNum () {
        const randomNum = Math.floor(Math.random() * 1000);
        const randomStr = randomNum.toString()

        dispNum.textContent = randomStr
    }

    var interval =  setInterval( showNum , 500);

    
    

}