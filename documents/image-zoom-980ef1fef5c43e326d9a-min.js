webpackJsonp([35],{0:function(h,k,c){c(1062);c(416)},416:function(h,k){YUI.add("squarespace-rendering",function(c){c.Squarespace.Rendering={getWidthForHeight:function(a,b,e){return a/b*e},getHeightForWidth:function(a,b,e){return b/a*e},getDimensionsFromNode:function(a){if(a=a.getAttribute("data-image-dimensions")){if(c.Lang.isString(a))return a=a.split("x"),{width:parseInt(a[0],10),height:parseInt(a[1],10)}}else return{width:null,height:null}},getSquarespaceSizeForWidth:function(a){c.config.win.devicePixelRatio&&
(a*=c.config.win.devicePixelRatio);return 1500<a?"2500w":1E3<a?"1500w":750<a?"1000w":500<a?"750w":300<a?"500w":100<a?"300w":"100w"},splitScriptsAndHTML:function(a){for(var b=a.indexOf("<script>"),e=-1,c="",d="",f=0;;){e=a.indexOf("\x3c/script>",f);if(-1==e||-1==b)return{html:a,script:""};var l=a.substring(b+8,e),d=d+l,c=c+a.substring(f,b),f=e+9,b=a.indexOf("<script>",f);if(-1===b)return 0===d.length&&(d=null),c+=a.substring(f),{html:c,script:d}}},getPixelSize:function(a){a=a.split("x");return parseInt(a[0],
10)*parseInt(a[1],10)},scaleEmbed:function(a,b){var c=/height="([0-9]+)"/.exec(a);if(!c)return a;var c=parseInt(c[1],10),g=/width="([0-9]+)"/.exec(a);if(!g)return a;g=parseInt(g[1],10);return a.replace(/height="([0-9]+)"/,'height="'+c*(b/g)+'"').replace(/width="([0-9]+)"/,'width="'+b+'"')},applyStyleToMap:function(a,b){var c=new google.maps.StyledMapType(b,{name:"Custom"});a.mapTypes.set("custom",c);a.setMapTypeId("custom")},createGrayscaleMap:function(a){this.applyStyleToMap(a,[{featureType:"landscape.man_made",
elementType:"all",stylers:[{lightness:51}]},{featureType:"poi",elementType:"all",stylers:[{visibility:"off"}]},{featureType:"road.local",elementType:"all",stylers:[{gamma:2.51}]},{featureType:"road.arterial",elementType:"all",stylers:[{gamma:1.9}]},{featureType:"water",elementType:"all",stylers:[{gamma:1.36}]},{featureType:"road.highway",elementType:"all",stylers:[{gamma:1.33}]},{featureType:"transit.station.rail",elementType:"all",stylers:[{visibility:"simplified"}]},{featureType:"transit.station.bus",
elementType:"all",stylers:[{visibility:"simplified"}]},{featureType:"transit",elementType:"all",stylers:[{gamma:1.2},{hue:"#0033ff"}]},{featureType:"administrative.neighborhood",elementType:"labels",stylers:[{gamma:1.43}]},{featureType:"water",elementType:"all",stylers:[{lightness:-47}]},{featureType:"all",elementType:"all",stylers:[{saturation:-100}]},{featureType:"road.arterial",elementType:"labels",stylers:[{lightness:23}]}])},getIconUrl:function(a,b,c){return"/universal/images-v6/icons/icon-"+
a+"-"+b+"-"+c+".png"},onMapConfigure:function(a){if(a=c.one(a)){var b=a.getAncestorData("layout-engine");a=a.getAncestorData("manager");b&&a&&b.lm.configureBlock(null,a.boundingEl)}},renderMap:function(a,b,e,g){b=c.merge({location:{mapLat:40.720882,mapLng:-74.000988,mapZoom:12},vSize:12},b);if(a){e=e||{};var d=a._node;if(d.__map)google.maps.event.trigger(d.__map,"resize");else{a.addClass("page-map");a.set("innerHTML","&nbsp;");var f=c.bind(function(){d.__geocoder=new google.maps.Geocoder;d.__map=
new google.maps.Map(d,{zoom:b.location.mapZoom,center:new google.maps.LatLng(b.location.mapLat,b.location.mapLng),mapTypeId:google.maps.MapTypeId.ROADMAP,draggable:!0,scrollwheel:!0,disableDefaultUI:!0});c.Lang.isUndefined(g)?c.Squarespace.Rendering.createGrayscaleMap(d.__map):this.applyStyleToMap(d.__map,g);var a=b.location,f;a.addressLine1||a.addressLine2?(f=a.addressLine1+" "+a.addressLine2,a.addressCountry&&(f+=", "+a.addressCountry)):f=b.location.mapLat+","+b.location.mapLng;if(b.location.markerLat&&
b.location.markerLng){var h=new google.maps.LatLng(b.location.markerLat,b.location.markerLng);d.__marker=new google.maps.Marker({map:d.__map,animation:google.maps.Animation.DROP,draggable:!1,position:h,title:a.addressTitle?a.addressTitle+" "+f:f,icon:{url:"icon-map-marker-2x.png",size:new google.maps.Size(52,68),scaledSize:new google.maps.Size(26,34),anchor:new google.maps.Point(13,34)}});c.Lang.isObject(e.infoWindow)&&(d.__infoWindow=new google.maps.InfoWindow(c.merge({pixelOffset:new google.maps.Size(-13,
10)},e.infoWindow)),e.infoWindow.autoOpen&&d.__infoWindow.open(d.__map,d.__marker));google.maps.event.addListener(d.__marker,"click",c.bind(function(b,a){if(d.__infoWindow)d.__infoWindow.open(d.__map,d.__marker);else{b=b.toUrlValue();var e=a.getZoom(),e=c.QueryString.stringify({sll:b,q:f,z:e});window.open("http://maps.google.com/maps?"+e)}},this,h,d.__map))}d.startEditing=function(){d.__map.setOptions({draggable:!0,scrollwheel:!0,disableDefaultUI:!1});d.__marker&&d.__marker.setOptions({draggable:!0})};
d.stopEditing=function(){d.__map.setOptions({draggable:!1,scrollwheel:!1,disableDefaultUI:!0});d.__marker&&d.__marker.setOptions({draggable:!1})};c.one(d).fire("maps-loaded");google.maps.event.addListener(d.__map,"rightclick",c.bind(this.onMapConfigure,this,d))},this);c.Squarespace.GoogleMap.loaded?f():(d.__loadingMap=!0,c.Squarespace.GoogleMap.on("load-success",function(){d.__loadingMap=!1;f()}),c.Squarespace.GoogleMap.load())}}else console.error("Page map node missing...")}}},"1.0",{requires:[]})},
1062:function(h,k){YUI.add("squarespace-image-zoom",function(c){c.namespace("Squarespace");var a=c.Squarespace.ImageZoom=c.Base.create("image-zoom",c.Base,[],{initializer:function(){!c.UA.mobile&&Modernizr.csstransforms&&(this.get("host")?this._initializeZoom():console.warn("[squarespace-image-zoom]: Missing host attribute."))},destructor:function(){this.get("zoomedNode").remove(!0);this.get("host").removeClass(a.CSS_PREFIX).removeClass(a.CSS_PREFIX+"--behavior-"+this.get("behavior"));this.get("dropzone").setStyle("position",
"").removeClass(a.CSS_PREFIX+"-dropzone");this._zoomTriggerEvent&&this._zoomTriggerEvent.detach();this._mouseMoveEvent&&this._mouseMoveEvent.detach();this._mouseOutEvent&&this._mouseOutEvent.detach();this._resizeEvent&&this._resizeEvent.detach();this._resizeEvent=this._mouseOutEvent=this._mouseMoveEvent=this._zoomTriggerEvent=null},_bindUI:function(){var b=this.get("host");this._zoomTriggerEvent=b.on(this.get("behavior"),this._toggleZoom,this);this._mouseMoveEvent=b.on("mousemove",this._trackMovement,
this);this._mouseOutEvent=b.on("mouseout",this._zoomOut,this);this._resizeEvent=c.one(window).on("resize",this._refresh,this)},_initializeZoom:function(){var b=this.get("host"),c=b.one("img"),g=this.get("dropzone");b.addClass(a.CSS_PREFIX);b.addClass(a.CSS_PREFIX+"--behavior-"+this.get("behavior"));g.addClass(a.CSS_PREFIX+"-dropzone");"static"===g.getStyle("position")&&g.setStyle("position","relative");if(c.getAttribute("src"))this._appendZoomedNode(),this._bindUI();else c.once("load",function(){this._appendZoomedNode();
this._bindUI()},this)},_appendZoomedNode:function(){var b=this.get("host").one("img"),e=b.getAttribute("data-src");if(!e)return console.warn("[squarespace-image-zoom]: Host image did not load properly; missing data-src."),null;var g=b.getAttribute("data-image-dimensions");g||(g=b.get("clientWidth")+"x"+b.get("clientHeight"));(b=b.getAttribute("data-image-focal-point"))||(b="0.5,0.5");e=c.Node.create('<div class="'+a.CSS_PREFIX+'-duplicate"><img src="'+e+"?format="+this._getSquarespaceSizeForWidth()+
'" data-image-dimensions="'+g+'" data-image-focal-point="'+b+'"></div>');e.setStyle("transform","scale("+this.get("zoom")+")");e.one("img").plug(c.Squarespace.Loader2,{load:!0,mode:"fill"});this.set("zoomedNode",e);this.get("dropzone").append(e)},_refresh:function(){var b=this.get("host").one("img").getAttribute("data-src"),a=this.get("zoomedNode").one("img");a.setAttribute("src",b+"?format="+this._getSquarespaceSizeForWidth());a.fire("refresh")},_toggleZoom:function(b){this.get("_isZoomedIn")?this._zoomOut():
this._zoomIn(b);b.stopPropagation()},_zoomIn:function(b){this.get("host").addClass("is-zoomed");this.set("_isZoomedIn",!0);this._trackMovement(b)},_zoomOut:function(){this.get("host").removeClass("is-zoomed");this.set("_isZoomedIn",!1)},_trackMovement:function(b){if(this.get("_isZoomedIn")){var a=Math.max(100*((b.pageX-this.get("host").getX())/this.get("host").get("clientWidth")),0);b=Math.max(100*((b.pageY-this.get("host").getY())/this.get("host").get("clientHeight")),0);this.get("zoomedNode").setStyle("transformOrigin",
a+"% "+b+"%")}},_getSquarespaceSizeForWidth:function(){var a=this.get("host").one("img").get("clientWidth");return c.Squarespace.Rendering.getSquarespaceSizeForWidth(a*this.get("zoom"))}},{CSS_PREFIX:"sqs-image-zoom",ATTRS:{host:{value:null,validator:function(a){a=c.one(a);return c.instanceOf(a,c.Node)&&a.one("img")&&2>a.all("img").size()},writeOnce:!0},dropzone:{valueFn:function(){return this.get("host")},validator:function(a){return c.instanceOf(c.one(a),c.Node)},writeOnce:!0},behavior:{value:"hover",
validator:function(a){return"hover"!==a&&"click"!==a?(console.warn("[squarespace-image-zoom]: Not a valid behavior, defaulting to hover."),!1):!0},writeOnce:!0},zoom:{value:1.5,validator:function(a){("number"!==typeof a||1>=a||5<a)&&console.warn("[squarespace-image-zoom]: Not a valid zoom value, defaulting to 1.5.");return!0},writeOnce:!0},_isZoomedIn:{value:!1}}})},"1.0",{requires:"node base event yui-base squarespace-image-loader squarespace-rendering".split(" ")})}});
