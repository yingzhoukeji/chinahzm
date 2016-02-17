	
	/*---------------------------------------------- 
		   P O R T F O LI O   S E T T I N G S
	------------------------------------------------*/
$(document).ready(function(){

	// Blur images on mouse over
	$(".portfolio_1_col a, .portfolio_2_col a, .portfolio_3_col a, .portfolio_4_col a, .carousel_items a").hover( function(){ 
		$(this).children("img").animate({ opacity: 0.75 }, "fast"); 
	}, function(){ 
		$(this).children("img").animate({ opacity: 1.0 }, "slow"); 
	}); 
	
	// Initialize prettyPhoto plugin
	$(".portfolio_1_col a[rel^='prettyPhoto'], .portfolio_2_col a[rel^='prettyPhoto'], .portfolio_3_col a[rel^='prettyPhoto'], .portfolio_4_col a[rel^='prettyPhoto'], .carousel_items a[rel^='prettyPhoto']").prettyPhoto({
		theme:'light_square', 
		autoplay_slideshow: false, 
		overlay_gallery: false, 
		show_title: false
	});

	// Clone portfolio items to get a second collection for Quicksand plugin
	var $portfolioClone = $(".portfolio_1_col, .portfolio_2_col, .portfolio_3_col, .portfolio_4_col, .carousel_items").clone();
	
	// Attempt to call Quicksand on every click event handler
	$(".filter a").click(function(e){
		
		$(".filter li").removeClass("current");	
		
		// Get the class attribute value of the clicked link
		var $filterClass = $(this).parent().attr("class");

		if ( $filterClass == "all" ) {
			var $filteredPortfolio = $portfolioClone.find("li");
		} else {
			var $filteredPortfolio = $portfolioClone.find("li[data-type~=" + $filterClass + "]");
		}
		
		// Call quicksand
		$(".portfolio_1_col, .portfolio_2_col, .portfolio_3_col, .portfolio_4_col, .carousel_items").quicksand( $filteredPortfolio, { 
			duration: 800, 
			easing: 'easeInOutQuad' 
		}, function(){
			
			// Blur newly cloned portfolio items on mouse over and apply prettyPhoto
			$(".portfolio_1_col a, .portfolio_2_col a, .portfolio_3_col a, .portfolio_4_col a, .carousel_items a").hover( function(){ 
				$(this).children("img").animate({ opacity: 0.75 }, "fast"); 
			}, function(){ 
				$(this).children("img").animate({ opacity: 1.0 }, "slow"); 
			}); 
			
			$(".portfolio_1_col a[rel^='prettyPhoto'], .portfolio_2_col a[rel^='prettyPhoto'], .portfolio_3_col a[rel^='prettyPhoto'], .portfolio_4_col a[rel^='prettyPhoto'], .carousel_items a[rel^='prettyPhoto']").prettyPhoto({
				theme:'light_square', 
				autoplay_slideshow: false, 
				overlay_gallery: false, 
				show_title: false
			});
		});


		$(this).parent().addClass("current");

		// Prevent the browser jump to the link anchor
		e.preventDefault();
	})
});



	
	/*---------------------------------------------- 
	S F   M E N U   O P A C I T Y   S E T T I N G S
	------------------------------------------------*/	
$(document).ready(function(){
	$(".sf-menu li a, .full_width a img, .full_width_home a img, #footer a, #footer a img, .flickr_badge_image, .column_content_image a").fadeTo("slow", 1.0); // This sets the opacity of the thumbs to fade down to 100% when the page loads

	$(".sf-menu li a, .full_width a img, .full_width_home a img, #footer a, #footer a img, .flickr_badge_image, .column_content_image a").hover(function(){
		$(this).fadeTo("slow", 0.6); // This should set the opacity to 60% on hover
	},function(){
   		$(this).fadeTo("slow", 1.0); // This should set the opacity back to 100% on mouseout
	});
});




	/*---------------------------------------------- 
			F O R M   V A L I D A T I O N 
	------------------------------------------------*/	
$(document).ready(function() {
	$('form#contact_form').submit(function() {
		$('form#contact_form .error').remove();
		var hasError = false;
		$('.requiredField').each(function() {
			if(jQuery.trim($(this).val()) == '') {
            	var labelText = $(this).prev('label').text();
            	$(this).parent().append('<span class="error">Required</span>');
            	$(this).addClass('inputError');
            	hasError = true;
            } else if($(this).hasClass('email')) {
            	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            	if(!emailReg.test(jQuery.trim($(this).val()))) {
            		var labelText = $(this).prev('label').text();
            		$(this).parent().append('<span class="error">Invalid.</span>');
            		$(this).addClass('inputError');
            		hasError = true;
            	}
            }
		});
		if(!hasError) {

			var formInput = $(this).serialize();
			$.post($(this).attr('action'),formInput, function(data){
                if(data.status!=1){
                    alert(data.info);
                    return false;
                }
                $('form#contact_form input.submit').fadeOut('normal', function() {
                 $(this).parent().append('');
                 });
				$('form#contact_form').slideUp("fast", function() {
					$(this).before(data.info);
				});
			});
		}
		return false;

	});
});




	/*---------------------------------------------- 
			S C R O L L   T O   T O P
	------------------------------------------------*/
var scrolltotop={
	//startline: Integer. Number of pixels from top of doc scrollbar is scrolled before showing control
	//scrollto: Keyword (Integer, or "Scroll_to_Element_ID"). How far to scroll document up when control is clicked on (0=top).
	setting: {startline:100, scrollto: 0, scrollduration:1000, fadeduration:[500, 100]},
	controlHTML: '', //HTML for control, which is auto wrapped in DIV w/ ID="topcontrol"
	controlattrs: {offsetx:20, offsety:20}, //offset of control relative to right/ bottom of window corner
	anchorkeyword: '#top', //Enter href value of HTML anchors on the page that should also act as "Scroll Up" links

	state: {isvisible:false, shouldvisible:false},

	scrollup:function(){
		if (!this.cssfixedsupport) //if control is positioned using JavaScript
			this.$control.css({opacity:0}) //hide control immediately after clicking it
		var dest=isNaN(this.setting.scrollto)? this.setting.scrollto : parseInt(this.setting.scrollto)
		if (typeof dest=="string" && jQuery('#'+dest).length==1) //check element set by string exists
			dest=jQuery('#'+dest).offset().top
		else
			dest=0
		this.$body.animate({scrollTop: dest}, this.setting.scrollduration);
	},

	keepfixed:function(){
		var $window=jQuery(window)
		var controlx=$window.scrollLeft() + $window.width() - this.$control.width() - this.controlattrs.offsetx
		var controly=$window.scrollTop() + $window.height() - this.$control.height() - this.controlattrs.offsety
		this.$control.css({left:controlx+'px', top:controly+'px'})
	},

	togglecontrol:function(){
		var scrolltop=jQuery(window).scrollTop()
		if (!this.cssfixedsupport)
			this.keepfixed()
		this.state.shouldvisible=(scrolltop>=this.setting.startline)? true : false
		if (this.state.shouldvisible && !this.state.isvisible){
			this.$control.stop().animate({opacity:1}, this.setting.fadeduration[0])
			this.state.isvisible=true
		}
		else if (this.state.shouldvisible==false && this.state.isvisible){
			this.$control.stop().animate({opacity:0}, this.setting.fadeduration[1])
			this.state.isvisible=false
		}
	},
	
	init:function(){
		jQuery(document).ready(function($){
			var mainobj=scrolltotop
			var iebrws=document.all
			mainobj.cssfixedsupport=!iebrws || iebrws && document.compatMode=="CSS1Compat" && window.XMLHttpRequest //not IE or IE7+ browsers in standards mode
			mainobj.$body=(window.opera)? (document.compatMode=="CSS1Compat"? $('html') : $('body')) : $('html,body')
			mainobj.$control=$('<div id="topcontrol">'+mainobj.controlHTML+'</div>')
				.css({position:mainobj.cssfixedsupport? 'fixed' : 'absolute', bottom:mainobj.controlattrs.offsety, right:mainobj.controlattrs.offsetx, opacity:0, cursor:'pointer'})
				.attr({title:'Scroll Back to Top'})
				.click(function(){mainobj.scrollup(); return false})
				.appendTo('body')
			if (document.all && !window.XMLHttpRequest && mainobj.$control.text()!='') //loose check for IE6 and below, plus whether control contains any text
				mainobj.$control.css({width:mainobj.$control.width()}) //IE6- seems to require an explicit width on a DIV containing text
			mainobj.togglecontrol()
			$('a[href="' + mainobj.anchorkeyword +'"]').click(function(){
				mainobj.scrollup()
				return false
			})
			$(window).bind('scroll resize', function(e){
				mainobj.togglecontrol()
			})
		})
	}
}

scrolltotop.init()

