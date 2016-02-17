(function ($) {
    $.fn.extend({
        customStyle: function (options) {
	    	var getInternetExplorerVersion = function () {    
	            var rv = -1; // Return value assumes failure.    
	            if (navigator.appName == 'Microsoft Internet Explorer') {        
	                 var ua = navigator.userAgent;        
	                 var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");        
	                 if (re.exec(ua) != null)            
	                     rv = parseFloat(RegExp.$1);    
	                }    
	            return rv; 
	    	}; 
	    	
	    	if(getInternetExplorerVersion() != 6){
                return this.each(function () {var currentSelected = $(this).find(':selected');
                	$(this).css('width' , $(this).width() + 20 );
                    $(this).after('<span class="customStyleSelectBox"><span class="customStyleSelectBoxInner">' + currentSelected.text() + '</span></span>').css({
                        position: 'absolute',
                        opacity: 0,
                        fontSize: $(this).next().css('font-size')
                    });
                    var selectBoxSpan = $(this).next();
                    var selectBoxWidth = parseInt($(this).width()) - parseInt(selectBoxSpan.css('padding-left')) - parseInt(selectBoxSpan.css('padding-right'));
                    var selectBoxSpanInner = selectBoxSpan.find(':first-child');
                    selectBoxSpan.css({
                        display: 'inline-block'
                    });
                    selectBoxSpanInner.css({
                        width: selectBoxWidth,
                        display: 'inline-block'
                    });
                    var selectBoxHeight = parseInt(selectBoxSpan.height()) + parseInt(selectBoxSpan.css('padding-top')) + parseInt(selectBoxSpan.css('padding-bottom'));
                    $(this).height(selectBoxHeight).change(function () {
                        selectBoxSpanInner.text($(this).find(':selected').text()).parent().addClass('changed');
                    });
                });
            }
        }
    });
})(jQuery);
$(document).ready(function(){
	//$('select').customStyle();
});
