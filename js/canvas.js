$(document).ready(function(){

pedalsIV = $("#pedalsIV");
pedalsVI = $("#pedalsVI");
pedalsVIII = $("#pedalsVII");
pedalsX = $("#pedalsX");
pedalsCustom = $("#pedalCustom");
board = $("#board");
mxr = $("#MXR");
ped = $("#ped");
limit = $("#limit");

function create(w,h){board.css({'width': w+'px' ,'height': h+'px','background':'#000'})};
function createped(w,h){
    board.append("<div id='mxr'></div>");
    mxrc = $("#mxr");
    mxrc.css({'width': w+'px' ,'height': h+'px','background':'#3FF'});
    mxrc.draggable({containment: "#limit"});
};
pedalsIV.click(function(){create(70,100)});
pedalsVI.click(function(){create(50,500)});
pedalsVIII.click(function(){create(400,200)});
pedalsX.click(function(){create(500,200)});
pedalsCustom.click(function(){create(200,100)});

mxr.click(function(){createped(70,100)});

});


