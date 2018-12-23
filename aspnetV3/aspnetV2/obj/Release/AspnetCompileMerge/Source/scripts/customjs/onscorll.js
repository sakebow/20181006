function Scroll() {
    var cc = document.getElementById("cc");
    var aa = document.getElementById("aa");
    var top = document.documentElement.scrollTop || document.body.scrollTop;
    var stop = document.getElementById("parent").offsetTop;
    if (top + 51 >= stop) {
        cc.className = "slide-pic fixed";
        aa.className = "fixed-img";
    } else {
        cc.className = "slide-pic";
        aa.className = "";
    }
}