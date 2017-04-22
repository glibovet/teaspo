var card=document.getElementsByClassName("card");
if($(window).width()<768){
for (var i = 0; i < x.length; i++) {
    card[i].style.width = "100%";
}
if(($(window).width()>768)&&($(window).width()<960) )
for (var i = 0; i < x.length; i++) {
    card[i].style.width = "50%";
}
}

function openNav() {
    var menuBar =document.getElementById("menuBar");
    if($(window).width()<768){
        menuBar.style.width="100%";
    }
    else{
    menuBar.style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.getElementById("main2").style.marginLeft = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.1)";
    }
    menuBar.style.color="white";   
}

function closeNav() {
    document.getElementById("menuBar").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
    document.getElementById("main2").style.marginLeft = "0";
    document.body.style.backgroundColor="white";
}

//SAMPLE USAGE
function onHoverMap(){
    $("#logomapimage").attr('src','/resources/img/logomaphover.gif');
}

function offHoverMap(){
    $("#logomapimage").attr('src','resources/img/logomap.png');
}