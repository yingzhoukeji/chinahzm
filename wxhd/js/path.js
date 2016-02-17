
document.querySelector("#pathmenu").addEventListener("tap",function(){
	f();
});
//path菜单
function f() {
    var m = prefixStyle("transitionDuration");
    var l = prefixStyle("transform");
    var a = $(".menu_button");
    if (a[0].innerHTML.indexOf("菜单") > -1) {
        for (var b = 0; b < a.length - 1; b++) a[b + 1].style.display = "block",
            a[b + 1].style[m] = "400ms",
            a[b + 1].removeEventListener("webkitTransitionEnd", h, !1),
            function() {
                var c = b + 1,
                    d = Math.sin(2 * Math.PI / 360 * (30 * b + .1)) * a[b + 1].offsetHeight / 2.5 * 6.25,
                    e = -Math.cos(2 * Math.PI / 360 * (30 * b + .1)) * a[b + 1].offsetHeight / 2.5 * 6.25;
                setTimeout(function() {
                        a[c].style[l] = "translate(" + d + "px, " + e + "px) scale(1) translateZ(0px) rotate(360deg)"
                    },
                    0)
            } ();
        $(".menu_button")[0].innerHTML = "<span>收起</span>";
        $(".pathModel").show();
    } else {
        $(".menu_button")[0].innerHTML = "<span>菜单</span>";
        for (var b = 0; b < a.length - 1; b++) a[b + 1].style[l] = "translate(0px,0px) scale(1) translateZ(0px) rotate(0deg)",
            function() {
                var c = a[b + 1];
                c.addEventListener("webkitTransitionEnd", h, !1)
            } ()
    }
}
function h() {
    this.style.display = "none";
    $(".pathModel").hide();
}
function prefixStyle(a) {
    var b = document.createElement("div").style,
        c = function() {
            for (var a, c = "t,webkitT,MozT,msT,OT".split(","), d = 0, e = c.length; e > d; d++) if (a = c[d] + "ransform", a in b) return c[d].substr(0, c[d].length - 1);
            return ! 1
        } ();
    return "" === c ? a: (a = a.charAt(0).toUpperCase() + a.substr(1), c + a)
}

