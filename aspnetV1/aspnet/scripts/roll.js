// roll left the pictures
function RollLeft() {
    var left = parseInt(document.getElementById("roll").style.left);
    var move = document.getElementsByClassName("roll-blocks")[0].offsetWidth;
    var blocks = document.getElementsByClassName("roll-blocks").length - 1;
    var list = document.getElementsByClassName("roll-blocks-index");
    if (left != 0) { // if not displaying the first one, create animate effect
        var moveNext = setInterval(function () {
            left = left + 1;
            document.getElementById("roll").style.left = left + 'px';
            if (left % move == 0) { // if position is right, remove animate effect
                clearInterval(moveNext);
                var current = document.getElementsByClassName("chosen")[0];
                current.className = "roll-blocks-index right"; // cancel the highlight of index blocks
                for (var i = 0; i < list.length; i++) { // go through the blocks to check the blocks
                    var index = -1 * left / move;
                    if (index == i) {
                        document.getElementById(index + 1).className = document.getElementById(index + 1).className + " chosen";
                    }
                }
                return; // stop the function forcely
            }
        }, 1);
    } else { // if just displaying the first picture
        var moveTail = setInterval(function () { // create animate effect
            if (left == -1 * blocks * move) {
                clearInterval(moveTail); // check the highlight blocks
                var current = document.getElementsByClassName("chosen")[0];
                current.className = "roll-blocks-index right";
                list[0].className = list[0].className + " chosen";
                return; // stop forcely
            }
            left = left - blocks;
            document.getElementById("roll").style.left = left + 'px';
        }, 1);
    }
}

function RollRight() { // the same as the function above
    var left = parseInt(document.getElementById("roll").style.left);
    var move = document.getElementsByClassName("roll-blocks")[0].offsetWidth;
    var blocks = document.getElementsByClassName("roll-blocks").length - 1;
    var list = document.getElementsByClassName("roll-blocks-index");
    if (left / move == -1 * blocks) {
        var moveHead = setInterval(function () {
            if (left == 0) {
                clearInterval(moveHead);
                var current = document.getElementsByClassName("chosen")[0];
                current.className = "roll-blocks-index right";
                list[list.length - 1].className = list[list.length - 1].className + " chosen";
                return;
            }
            left = left + blocks;
            document.getElementById("roll").style.left = left + 'px';
        }, 1);
    } else {
        var moveLast = setInterval(function () {
            left = left - 1;
            document.getElementById("roll").style.left = left + 'px';
            if (left % move == 0) {
                clearInterval(moveLast);
                var current = document.getElementsByClassName("chosen")[0];
                current.className = "roll-blocks-index right";
                for (var i = 0; i < list.length; i++) {
                    var index = -1 * left / move;
                    if (index == i) {
                        document.getElementById(index + 1).className = document.getElementById(index + 1).className + " chosen";
                    }
                }
                return;
            }
        }, 1);
    }
    var timer = setTimeout("RollRight()", 7000);
}

function OnLoadSetHeight() { // once load the window page, set position of elements
    document.getElementsByClassName("blur-clear")[0].style.height = document.getElementsByClassName("blur-bg")[0].offsetHeight + 'px';
    document.getElementsByClassName("blur-clear")[0].style.marginTop = document.getElementsByClassName("blur-bg")[0].offsetTop + 'px';
    document.getElementsByClassName("news-center")[0].style.height = document.getElementsByClassName("news-column")[0].offsetHeight + 'px';
}

function ResizeColumn() { // keep format after resize
    document.getElementsByClassName("news-middle")[0].style.marginLeft = (document.getElementsByClassName("news-center")[0].offsetWidth - document.getElementsByClassName("news-middle")[0].offsetWidth) / 2 - document.getElementsByClassName("news-column")[0].offsetWidth + 'px';
    document.getElementsByClassName("news-column")[1].style.height = document.getElementsByClassName("news-center")[0].offsetHeight + 'px';
    document.getElementsByClassName("news-center")[0].style.height = document.getElementsByClassName("news-column")[0].offsetHeight + 'px';
}
