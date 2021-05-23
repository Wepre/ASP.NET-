var colors = new Array('#4D3D98', '#0C8B44', '#88288F', '#D24827', '#00A0B1'); /* Colors of the Menu Items */
var body_color = "#00AA68"; /* Background Color of the whole Navigation */
var hover_color = "#352869"; /* Color of the border of the menu items for HOVER*/
var scroll_color = "#5A4B80"; /* Default background color for the scroll arrow */
var scroll_hover = "#FFFFFF"; /* Hover background color for the scroll arrow */
var scroll_click = "#282828"; /* background color for the scroll arrow when clicked */

var Content = new Array();
var body_height;
var scroll = "<div class = 'scroll_bar'><span style = 'float : left;'></span><span style = 'float : right;background-position : 0 -120px;'></span></div>"


var waitForFinalEvent = (function () {
  var timers = {};
  return function (callback, ms, uniqueId) {
    if (!uniqueId) {
      uniqueId = "Don't call this twice without a uniqueId";
    }
    if (timers[uniqueId]) {
      clearTimeout (timers[uniqueId]);
    }
    timers[uniqueId] = setTimeout(callback, ms);
  };
})();

function setColors(){
	jQuery("div.metro_nav>ul>li").each(function(){
		L = colors.length;
		X = $(this).index();
		for(i = 0, j = 0; i <= X; i++, j++)
		{
			if(j == L)
				j = 0;
			if(i == X)
				jQuery(this).children("a").css("background-color", colors[j]);
		}
		jQuery("div.metro_nav").css("background-color", body_color);
		$("div.metro_nav>div.scroll_bar>span").css("background-color", scroll_color)
	})

}

function setScroll(){

	if(navigator.appVersion.indexOf("MSIE 7.")!=-1)
	{
		$("div.metro_nav>ul>li").css({"display":"inline", "zoom":"1"});
	}
	
	A = $("div.metro_nav>ul>li:last-child").offset().left + $("div.metro_nav>ul>li:last-child").width()
	B = $("div.metro_nav").offset().left + $("div.metro_nav").width();
	
	if(A > B)
		$("div.metro_nav").append(scroll);
	$("div.metro_nav>div.scroll_bar>span").css("background-color", scroll_color)
}

$(window).load(function(){


/*--------------------------------------- Setting up colors -----------------------------------------*/
	setColors();
/*--------------------------------------- position fixing -----------------------------------------*/
		//alert(parseFloat($().jquery));
	
	if(navigator.appVersion.indexOf("MSIE 7.")!=-1)
	{
		$("div.metro_nav>ul>li").css({"display":"inline", "zoom":"1"});
	}
	
	$("div.metro_nav").each(function(){
		
		A = $(this).children("ul").children("li:last-child").offset().left + $(this).children("ul").children("li:last-child").width()
		B = $(this).offset().left + $(this).width();
	
		if(A > B)
			$(this).append(scroll);
		$(this).children("div.scroll_bar").children("span").css("background-color", scroll_color)
	})
	
/*--------------------------------------- Other fixing -----------------------------------------*/


/*--------------------------------------- Events handling -----------------------------------------*/
	
if(parseFloat($().jquery) < 1.9){
	
	/*---------- BEGIN NAVIGATION ITEM HOVER --------*/
	$("div.metro_nav>ul>li>a").live("mouseenter", function(){
		jQuery(this).closest("li").css("background-color", hover_color);
	})
	
	$("div.metro_nav>ul>li>a").live('mouseleave', function(){
		jQuery(this).closest("li").css("background-color", "transparent");
		jQuery(this).closest("li").css("transform", 'scale(1.0, 1.0)');
	})

	/*---------- END NAVIGATION ITEM HOVER --------*/

	/*---------- BEGIN NAVIGATION ITEM CLICK --------*/
	
	$("div.metro_nav>ul>li>a").live('mousedown', function(e){
		e.preventDefault();
		jQuery(this).closest("li").css("transform", 'scale(.98, .98)');
		
	})
	
	$("div.metro_nav>ul>li>a").live('mouseup', function(){
		jQuery(this).closest("li").css("transform", 'scale(1.0, 1.0)');
		var temp = "";
		
		if($(this).closest("li").children("ul").html() != null)
		{
			
			Content[$(this).closest("div.metro_nav").index()] = $(this).closest("div.metro_nav").html();
			
			temp = "<div class= 'nav_title'>" + $(this).closest("li").children("a").children("span").html() + 
						"<span class = 'back_button'></span>" + "</div>";
			
			temp = temp + "<ul>" + $(this).closest("li").children("ul").html() + "</ul>"
			
			X = $(this).closest("div.metro_nav");
			$(this).closest("div.metro_nav").children("*").remove();
			
			X.html(temp);
			
			X.children("div.nav_title").children("img").show();
			
			setScroll();
			X.children("ul").children("*").css({"left":"30px", "opacity":"0"});
			X.children("div.nav_title").css({"opacity":"0"});
			
			X.children("ul").children("*").animate({left:'0px', opacity:'1'}, 300);
			X.children("div.nav_title").animate({opacity:'1'}, 300);
			setColors();
		}
	})
	
	/*---------- END NAVIGATION ITEM CLICK --------*/
	
	/*---------- BEGIN BACK BUTTON EVENTS --------*/
	
	$("div.nav_title>span.back_button").live('mouseenter', function(){
		$(this).css("background-position", "0px -30px");
	})
	
	$("div.nav_title>span.back_button").live('mouseleave', function(){
		$(this).css("background-position", "0px 0px");
	})
	
	$("div.nav_title>span.back_button").live('mousedown', function(e){
		e.preventDefault();
		$(this).css("background-position", "0px -60px");
	})
	
	$("div.nav_title>span.back_button").live('mouseup', function(){
		$(this).css("background-position", "0px -30px");
	})
	$("div.nav_title>span.back_button").live('click', function(){
	
		X = $(this).closest("div.metro_nav");
		X.html(Content[X.index()]);
		X.children("div.nav_title").children("img").hide();
		
		X.children("ul").children("*").css({"left":"30px", "opacity":"0"});
		X.children("div.nav_title").css({"opacity":"0"});
			
		X.children("ul").children("*").animate({left:'0px', opacity:'1'}, 300);
		X.children("div.nav_title").animate({opacity:'1'}, 300);
		
		X.children("ul").children("li").css("background-color", "transparent");
	})
	/*---------- END BACK BUTTON EVENTS --------*/
	
	/*---------- BEGIN SCROLL EVENTS --------*/

	$("div.scroll_bar>span:first-child").live("mouseenter", function(){
		$(this).css("background-color", scroll_hover);
	})
	
	
	$("div.scroll_bar>span:first-child").live("mouseout", function(){
		$(this).css("background-color", scroll_color);
		$(this).css("background-position", "0 -90px");
	})
	
	$("div.scroll_bar>span:last-child").live("mouseenter", function(){
		$(this).css("background-color", scroll_hover);
	})
	
	
	$("div.scroll_bar>span:last-child").live("mouseout", function(){
		$(this).css("background-color", scroll_color);
		$(this).css("background-position", "0 -120px");
	})

	$("div.metro_nav>div.scroll_bar>span:nth-child(1)").live("mousedown", function(){
		$(this).css("background-color", scroll_click);
		$(this).css("background-position", "0 -105px");
		
		A = $(this).closest("div.metro_nav").children("ul").children("li:first-child").offset().left
		B = $("div.metro_nav").offset().left + 40;

		C = B - A;

		if(C > 100)
			$(this).closest("div.metro_nav").children("ul").children("*").stop(false, false).animate({left:"+=" + String(100) + "px"}, "fast");
		else
			$(this).closest("div.metro_nav").children("ul").children("*").stop(false, false).animate({left:"+=" + String(C) + "px"}, "fast");		

	})
	
	$("div.metro_nav>div.scroll_bar>span:nth-child(1)").live("mouseup", function(){
		$(this).css("background-color", scroll_hover);
		$(this).css("background-position", "0 -90px");
	})
	
	$("div.metro_nav>div.scroll_bar>span:nth-child(2)").live("mousedown", function(){
		$(this).css("background-color", scroll_click);
		$(this).css("background-position", "0 -135px");
		
		A = $(this).closest("div.metro_nav").children("ul").children("li:last-child").offset().left + 
								$(this).closest("div.metro_nav").children("ul").children("li:last-child").width();
		B = $(this).closest("div.metro_nav").offset().left + $(this).closest("div.metro_nav").width();
		C = A - B + 30;
		
		if(C > 100)
			$(this).closest("div.metro_nav").children("ul").children("*").stop(false, false).animate({left:"-=" + String(100) + "px"}, "fast");
		else
			$(this).closest("div.metro_nav").children("ul").children("*").stop(false, false).animate({left:"-=" + String(C) + "px"}, "fast");		
		
	})
	
	$("div.metro_nav>div.scroll_bar>span:nth-child(2)").live("mouseup", function(){
		$(this).css("background-color", scroll_hover);
		$(this).css("background-position", "0 -120px");
	})
	

/*-------------------------------------------------- END SCROLL EVENTS ------------------------------------------------*/


}else{/*-------------------------------------------------- jQuery 1.9.1+ ------------------------------------------------*/
	/*---------- BEGIN NAVIGATION ITEM HOVER --------*/
	$(document).on("mouseenter","div.metro_nav>ul>li>a", function(){
		jQuery(this).closest("li").css("background-color", hover_color);
	})
	
	$(document).on('mouseleave',"div.metro_nav>ul>li>a", function(){
		jQuery(this).closest("li").css("background-color", "transparent");
		jQuery(this).closest("li").css("transform", 'scale(1.0, 1.0)');
	})

	/*---------- END NAVIGATION ITEM HOVER --------*/

	/*---------- BEGIN NAVIGATION ITEM CLICK --------*/
	
	$(document).on('mousedown',"div.metro_nav>ul>li>a", function(e){
		e.preventDefault();
		jQuery(this).closest("li").css("transform", 'scale(.98, .98)');
		
	})
	
	$(document).on('mouseup',"div.metro_nav>ul>li>a", function(){
		jQuery(this).closest("li").css("transform", 'scale(1.0, 1.0)');
		var temp = "";
		
		if($(this).closest("li").children("ul").html() != null)
		{
			
			Content[$(this).closest("div.metro_nav").index()] = $(this).closest("div.metro_nav").html();
			
			temp = "<div class= 'nav_title'>" + $(this).closest("li").children("a").children("span").html() + 
						"<span class = 'back_button'></span>" + "</div>";
			
			temp = temp + "<ul>" + $(this).closest("li").children("ul").html() + "</ul>"
			
			X = $(this).closest("div.metro_nav");
			$(this).closest("div.metro_nav").children("*").remove();
			
			X.html(temp);
			
			X.children("div.nav_title").children("img").show();
			
			setScroll();
			X.children("ul").children("*").css({"left":"30px", "opacity":"0"});
			X.children("div.nav_title").css({"opacity":"0"});
			
			X.children("ul").children("*").animate({left:'0px', opacity:'1'}, 300);
			X.children("div.nav_title").animate({opacity:'1'}, 300);
			setColors();
		}
	})
	
	/*---------- END NAVIGATION ITEM CLICK --------*/
	
	/*---------- BEGIN BACK BUTTON EVENTS --------*/
	
	$(document).on("mouseenter","div.nav_title>span.back_button", function(){
		$(this).css("background-position", "0px -30px");
	})
	
	$(document).on('mouseleave', "div.nav_title>span.back_button",function(){
		$(this).css("background-position", "0px 0px");
	})
	
	$(document).on('mousedown', "div.nav_title>span.back_button", function(e){
		e.preventDefault();
		$(this).css("background-position", "0px -60px");
	})
	
	$(document).on('mouseup', "div.nav_title>span.back_button", function(){
		$(this).css("background-position", "0px -30px");
	})
	$(document).on('click', "div.nav_title>span.back_button", function(){
	
		X = $(this).closest("div.metro_nav");
		X.html(Content[X.index()]);
		X.children("div.nav_title").children("img").hide();
		
		X.children("ul").children("*").css({"left":"30px", "opacity":"0"});
		X.children("div.nav_title").css({"opacity":"0"});
			
		X.children("ul").children("*").animate({left:'0px', opacity:'1'}, 300);
		X.children("div.nav_title").animate({opacity:'1'}, 300);
		
		X.children("ul").children("li").css("background-color", "transparent");
	})
	/*---------- END BACK BUTTON EVENTS --------*/
	
	/*---------- BEGIN SCROLL EVENTS --------*/

	$(document).on("mouseenter","div.scroll_bar>span:first-child", function(){
		$(this).css("background-color", scroll_hover);
	})
	
	
	$(document).on("mouseout","div.scroll_bar>span:first-child", function(){
		$(this).css("background-color", scroll_color);
		$(this).css("background-position", "0 -90px");
	})
	
	$(document).on("mouseenter","div.scroll_bar>span:last-child", function(){
		$(this).css("background-color", scroll_hover);
	})
	
	
	$(document).on("mouseout","div.scroll_bar>span:last-child", function(){
		$(this).css("background-color", scroll_color);
		$(this).css("background-position", "0 -120px");
	})

	$(document).on("mousedown","div.metro_nav>div.scroll_bar>span:nth-child(1)", function(){
		$(this).css("background-color", scroll_click);
		$(this).css("background-position", "0 -105px");
		
		A = $(this).closest("div.metro_nav").children("ul").children("li:first-child").offset().left
		B = $("div.metro_nav").offset().left + 40;

		C = B - A;

		if(C > 100)
			$(this).closest("div.metro_nav").children("ul").children("*").stop(false, false).animate({left:"+=" + String(100) + "px"}, "fast");
		else
			$(this).closest("div.metro_nav").children("ul").children("*").stop(false, false).animate({left:"+=" + String(C) + "px"}, "fast");		

	})
	
	$(document).on("mouseup","div.metro_nav>div.scroll_bar>span:nth-child(1)", function(){
		$(this).css("background-color", scroll_hover);
		$(this).css("background-position", "0 -90px");
	})
	
	$(document).on("mousedown","div.metro_nav>div.scroll_bar>span:nth-child(2)", function(){
		$(this).css("background-color", scroll_click);
		$(this).css("background-position", "0 -135px");
		
		A = $(this).closest("div.metro_nav").children("ul").children("li:last-child").offset().left + 
								$(this).closest("div.metro_nav").children("ul").children("li:last-child").width();
		B = $(this).closest("div.metro_nav").offset().left + $(this).closest("div.metro_nav").width();
		C = A - B + 30;
		
		if(C > 100)
			$(this).closest("div.metro_nav").children("ul").children("*").stop(false, false).animate({left:"-=" + String(100) + "px"}, "fast");
		else
			$(this).closest("div.metro_nav").children("ul").children("*").stop(false, false).animate({left:"-=" + String(C) + "px"}, "fast");		
		
	})
	
	$(document).on("mouseup","div.metro_nav>div.scroll_bar>span:nth-child(2)", function(){
		$(this).css("background-color", scroll_hover);
		$(this).css("background-position", "0 -120px");
	})

}

	$(window).resize(function () {
    waitForFinalEvent(function(){
	$("div.metro_nav").each(function(){
		A = $(this).children("ul").children("li:last-child").offset().left + $(this).children("ul").children("li:last-child").width()
		B = $(this).offset().left + $(this).width();
	
		if(A > B)
		{
			if(!$(this).children("div.scroll_bar").length)
				$(this).append(scroll);
		}
		else
			$(this).children("div.scroll_bar").remove();
		$(this).children("div.scroll_bar").children("span").css("background-color", scroll_color)
	})
    }, 50, "some unique string");
});


})