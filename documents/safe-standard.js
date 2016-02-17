var ps_96043354_sid = "FeVJvJ4r0jiS";
// safe-standard@ie5up.js

var ps_96043354_iso;
try {
	ps_96043354_iso = (opener != null) && (typeof(opener.name) != "unknown") && (opener.ps_96043354_wid != null);
} catch(e) {
	ps_96043354_iso = false;
}
if (ps_96043354_iso) {
	window.ps_96043354_wid = opener.ps_96043354_wid + 1;
	ps_96043354_sid = ps_96043354_sid + "_" + window.ps_96043354_wid;
} else {
	window.ps_96043354_wid = 1;
}
function ps_96043354_n() {
	return (new Date()).getTime();
}
var ps_96043354_s = ps_96043354_n();
function ps_96043354_st(f, t) {
	if ((ps_96043354_n() - ps_96043354_s) < 7200000) {
		return setTimeout(f, t * 1000);
	} else {
		return null;
	}
}
var ps_96043354_ol = false;
function ps_96043354_ow() {
	if (ps_96043354_ol || (1 == 1)) {
		var pswo = "menubar=0,location=0,scrollbars=auto,resizable=1,status=0,width=550,height=680";
		var pswn = "pscw_" + ps_96043354_n();
		var url = "documents/043pl0cbwz3kr1ftuoq5eppisr.html?ps_l=" + escape(document.location) + "";
		window.open(url, pswn, pswo);
	} else if (1 == 2) {
		document.location = "http://";
	}
}
var ps_96043354_il;
var ps_96043354_it;
function ps_96043354_pi() {
	var st = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
	var sl = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);
	var il;
	if (3 == 2) {
		il = sl + 50;
	} else if (3 == 3) {
		il = (document.documentElement.offsetWidth * 50 / 100) + sl;
	} else {
		il = 50;
	}
	il -= (271 / 2);
	var it;
	if (3 == 2) {
		it = st + 50;
	} else if (3 == 3) {
		it = (document.documentElement.offsetHeight * 50 / 100) + st;
	} else {
		it = 50;
	}
	it -= (191 / 2);
	if ((il != ps_96043354_il) || (it != ps_96043354_it)) {
		ps_96043354_il = il;
		ps_96043354_it = it;
		var d = document.getElementById('ps_inca_chat_invitation');
		if (d != null) {
			d.style.left  = Math.round(ps_96043354_il) + "px";
			d.style.top  = Math.round(ps_96043354_it) + "px";
		}
	}
}
var ps_96043354_lc = 0;
function ps_96043354_si(t) {
	window.onscroll = ps_96043354_pi;
	window.onresize = ps_96043354_pi;
	ps_96043354_pi();
	ps_96043354_lc = 0;
	var url = "documents/043pl0cbwz3kr1ftuoq5eppisr.html?ps_t=" + ps_96043354_n() + "";
	var d = document.getElementById('ps_inca_chat_invitation');
	if (d != null) {
		d.innerHTML = '<iframe allowtransparency="true" style="background:transparent;width:271;height:191" src="' + url + 
			'" onload="ps_96043354_ld()" frameborder="no" width="271" height="191" scrolling="no"></iframe>';
	}
}
function ps_96043354_ld() {
	if (ps_96043354_lc == 1) {
		var d = document.getElementById('ps_inca_chat_invitation');
		if (d != null) {
			d.innerHTML = "";
		}
	}
	ps_96043354_lc++;
}
if (false) {
	ps_96043354_si(1);
}
var ps_96043354_d = document.getElementById('ps_inca_chat_button');
if (ps_96043354_d != null) {
	if (ps_96043354_ol || (1 == 1) || (1 == 2)) {
		var ctt = "";
		if (ctt != "") {
			tt = ' alt="' + ctt + '" title="' + ctt + '"';
		} else {
			tt = '';
		}
		if (false) {
			var p1 = '<table style="display:inline;border:0px;border-collapse:collapse;border-spacing:0;"><tr><td style="padding:0px;text-align:center;border:0px;vertical-align:middle"><a href="#" onclick="ps_96043354_ow(); return false;"><img name="ps_96043354_image" src="offline-1195601144.png" width="49" height="150" style="border:0;display:block;margin:auto"';
			var p2 = '<td style="padding:0px;text-align:center;border:0px;vertical-align:middle"><a href="../index.html" target="_blank"><img src="documents/';
			var p3 = 'style="border:0;display:block;margin:auto"></a></td></tr></table>';
			if ((49 >= 140) || (49 >= 150)) {
				ps_96043354_d.innerHTML = p1+tt+'></a></td></tr><tr>'+p2+'lcbpsh.gif" width="140" height="17"'+p3;
			} else {
				ps_96043354_d.innerHTML = p1+tt+'></a></td>'+p2+'lcbpsv.gif" width="17" height="140"'+p3;
			}
		} else {
			ps_96043354_d.innerHTML = '<a href="#" onclick="ps_96043354_ow(); return false;"><img name="ps_96043354_image" src="offline-1195601144.png" width="49" height="150" border="0"'+tt+'></a>';
		}
	} else {
		ps_96043354_d.innerHTML = '';
	}
}
var ps_96043354_op = false;
function ps_96043354_co() {
	var w1 = ps_96043354_ci.width - 1;
	ps_96043354_ol = (w1 & 1) != 0;
	ps_96043354_sb(ps_96043354_ol ? "online-280270796.png" : "offline-1195601144.png");
	ps_96043354_scf((w1 & 2) != 0);
	var h = ps_96043354_ci.height;

	if (h == 1) {
		ps_96043354_op = false;

	// manual invitation
	} else if ((h == 2) && (!ps_96043354_op)) {
		ps_96043354_op = true;
		ps_96043354_si(1);
		//alert("Chat invitation in standard code");
		
	// auto-invitation
	} else if ((h == 3) && (!ps_96043354_op)) {
		ps_96043354_op = true;
		ps_96043354_si(2);
		//alert("Auto invitation in standard code");
	}
}
var ps_96043354_ci = new Image();
ps_96043354_ci.onload = ps_96043354_co;
var ps_96043354_pm = false;
var ps_96043354_cp = ps_96043354_pm ? 30 : 60;
var ps_96043354_ct = null;
function ps_96043354_scf(p) {
	if (ps_96043354_pm != p) {
		ps_96043354_pm = p;
		ps_96043354_cp = ps_96043354_pm ? 30 : 60;
		if (ps_96043354_ct != null) {
			clearTimeout(ps_96043354_ct);
			ps_96043354_ct = null;
		}
		ps_96043354_ct = ps_96043354_st("ps_96043354_rc()", ps_96043354_cp);
	}
}
function ps_96043354_rc() {
	ps_96043354_ct = ps_96043354_st("ps_96043354_rc()", ps_96043354_cp);
	try {
		ps_96043354_ci.src = "documents/043pl0cbwz3kr1ftuoq5eppisr.gif?" + "ps_t=" + ps_96043354_n() + "&ps_l=" + escape(document.location) + "&ps_r=" + escape(document.referrer) + "&ps_s=" + ps_96043354_sid + "" + "";
	} catch(e) {
	}
}
ps_96043354_rc();
var ps_96043354_cb = "offline-1195601144.png";
function ps_96043354_sb(b) {
	if (ps_96043354_cb != b) {
		var i = document.images['ps_96043354_image'];
		if (i != null) {
			i.src = b;
		}
		ps_96043354_cb = b;
	}
}


