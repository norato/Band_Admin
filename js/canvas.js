$(document).ready(function(){

pedalsIV = $("#pedalsIV");
pedalsVI = $("#pedalsVI");
pedalsVIII = $("#pedalsVII");
pedalsX = $("#pedalsX");
pedalsCustom = $("#pedalsCustom");

board = $("#board");
mxr = $("#MXR");
boss = $("#Boss");
rocktron = $("#Rocktron");

limit = $("#limit");

//------ functions----- //


function create(w,h){
    board.css({'width': w+'px' ,'height': h+'px'});
    controlPedalboarPosition();
};
function createped(id){
    limit.append("<div id='"+id+"'class='pedal'></div>");
    ped = $(".pedal");
    ped.draggable({containment: "#limit"});
};

function controlPedalboarPosition(){
    var limit_width = limit[0].clientWidth;
    var limit_height = limit[0].clientHeight;
    var board_width = board[0].clientWidth;
    var board_height = board[0].clientHeight;
    var board_top = ((limit_height/2) - board_height/2);
    var board_left = ((limit_width/2) - board_width/2);
    board.css({'top':board_top+'px', 'left':board_left+'px'});
    limit.find("#width").html((board_width/10)+'cm')
        .css({'top':(limit_height-board_top),
              'left':(board_left+(board_width/2))});
    limit.find("#height").html((board_height/10)+'cm')
        .css({'top':(board_top+(board_height/2)),
              'left':(limit_width- board_left)});
};

//------ events----- //
// 1pedal width=90 height=150
pedalsIV.click(function(){create(360,150)});
pedalsVI.click(function(){create(540,150)});
pedalsVIII.click(function(){create(360,300)});
pedalsX.click(function(){create(450,300)});
pedalsCustom.click(function(){create(600,400)});

mxr.click(function(){createped('mxr')});
boss.click(function(){createped('boss')});
rocktron.click(function(){createped('rocktron')});


});


