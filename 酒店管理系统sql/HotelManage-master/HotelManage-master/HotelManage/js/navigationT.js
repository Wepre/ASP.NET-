var colorsT = new Array('', '', '', '', ''); /* colorsT of the Menu Items */
var body_colorT = "transparent"; /* Background Color of the whole Navigation */
var hover_colorT = "transparent"; /* Color of the border of the menu items for HOVER*/
var scroll_colorT = "#919191"; /* Default background color for the scroll arrow */
var scroll_hoverT = "#D8D8D8"; /* Hover background color for the scroll arrow */
var scroll_clickT = "#282828"; /* background color for the scroll arrow when clicked */

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

function setcolorsTT(){
	jQuery("div.metro_na>ul>li").each(function(){
		L = colorsT.length;
		X = $(this).index();
		for(i = 0, j = 0; i <= X; i++, j++)
		{
			if(j == L)
				j = 0;
			if(i == X)
				jQuery(this).children("a").css("background-color", colorsT[j]);
		}
		jQuery("div.metro_na").css("background-color", body_colorT);
		$("div.metro_na>div.scroll_bar>span").css("background-color", scroll_colorT)
	})

}

function setScrollT(){

	if(navigator.appVersion.indexOf("MSIE 7.")!=-1)
	{
		$("div.metro_na>ul>li").css({"display":"inline", "zoom":"1"});
	}
	
	A = $("div.metro_na>ul>li:last-child").offset().left + $("div.metro_na>ul>li:last-child").width()
	B = $("div.metro_na").offset().left + $("div.metro_na").width();
	
	if(A > B)
		$("div.metro_na").append(scroll);
	$("div.metro_na>div.scroll_bar>span").css("background-color", scroll_colorT)
}

$(window).load(function(){


/*--------------------------------------- Setting up colorsT -----------------------------------------*/
	setcolorsTT();
/*--------------------------------------- position fixing -----------------------------------------*/
		//alert(parseFloat($().jquery));
	
	if(navigator.appVersion.indexOf("MSIE 7.")!=-1)
	{
		$("div.metro_na>ul>li").css({"display":"inline", "zoom":"1"});
	}
	
	$("div.metro_na").each(function(){
		
		A = $(this).children("ul").children("li:last-child").offset().left + $(this).children("ul").children("li:last-child").width()
		B = $(this).offset().left + $(this).width();
	
		if(A > B)
			$(this).append(scroll);
		$(this).children("div.scroll_bar").children("span").css("background-color", scroll_colorT)
	})
	
/*--------------------------------------- Other fixing -----------------------------------------*/


/*--------------------------------------- Events handling -----------------------------------------*/
	
if(parseFloat($().jquery) < 1.9){
	
	/*---------- BEGIN NAVIGATION ITEM HOVER --------*/
	$("div.metro_na>ul>li>a").live("mouseenter", function(){
		jQuery(this).closest("li").css("background-color", hover_colorT);
	})
	
	$("div.metro_na>ul>li>a").live('mouseleave', function(){
		jQuery(this).closest("li").css("background-color", "transparent");
		jQuery(this).closest("li").css("transform", 'scale(1.0, 1.0)');
	})

	/*---------- END NAVIGATION ITEM HOVER --------*/

	/*---------- BEGIN NAVIGATION ITEM CLICK --------*/
	
	$("div.metro_na>ul>li>a").live('mousedown', function(e){
		e.preventDefault();
		jQuery(this).closest("li").css("transform", 'scale(.98, .98)');
		
	})
	
	$("div.metro_na>ul>li>a").live('mouseup', function(){
		jQuery(this).closest("li").css("transform", 'scale(1.0, 1.0)');
		var temp = "";
		
		if($(this).closest("li").children("ul").html() != null)
		{
			
			Content[$(this).closest("div.metro_na").index()] = $(this).closest("div.metro_na").html();
			
			temp = "<div class= 'nav_title'>" + $(this).closest("li").children("a").children("span").html() + 
						"<span class = 'back_button'></span>" + "</div>";
			
			temp = temp + "<ul>" + $(this).closest("li").children("ul").html() + "</ul>"
			
			X = $(this).closest("div.metro_na");
			$(this).closest("div.metro_na").children("*").remove();
			
			X.html(temp);
			
			X.children("div.nav_title").children("img").show();
			
			setScrollT();
			X.children("ul").children("*").css({"left":"30px", "opacity":"0"});
			X.children("div.nav_title").css({"opacity":"0"});
			
			X.children("ul").children("*").animate({left:'0px', opacity:'1'}, 300);
			X.children("div.nav_title").animate({opacity:'1'}, 300);
			setcolorsTT();
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
	
		X = $(this).closest("div.metro_na");
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

	$("div.metro_na>div.scroll_bar>span:first-child").live("mouseenter", function(){
		$(this).css("background-color", scroll_hoverT);
	})
	
	
	$("div.metro_na>div.scroll_bar>span:first-child").live("mouseout", function(){
		$(this).css("background-color", scroll_colorT);
		$(this).css("background-position", "0 -90px");
	})
	
	$("div.metro_na>div.scroll_bar>span:last-child").live("mouseenter", function(){
		$(this).css("background-color", scroll_hoverT);
	})
	
	
	$("div.metro_na>div.scroll_bar>span:last-child").live("mouseout", function(){
		$(this).css("background-color", scroll_colorT);
		$(this).css("background-position", "0 -120px");
	})

	$("div.metro_na>div.scroll_bar>span:nth-child(1)").live("mousedown", function(){
		$(this).css("background-color", scroll_clickT);
		$(this).css("background-position", "0 -105px");
		
		A = $(this).closest("div.metro_na").children("ul").children("li:first-child").offset().left
		B = $("div.metro_na").offset().left + 40;

		C = B - A;

		if(C > 100)
			$(this).closest("div.metro_na").children("ul").children("*").stop(false, false).animate({left:"+=" + String(100) + "px"}, "fast");
		else
			$(this).closest("div.metro_na").children("ul").children("*").stop(false, false).animate({left:"+=" + String(C) + "px"}, "fast");		

	})
	
	$("div.metro_na>div.scroll_bar>span:nth-child(1)").live("mouseup", function(){
		$(this).css("background-color", scroll_hoverT);
		$(this).css("background-position", "0 -90px");
	})
	
	$("div.metro_na>div.scroll_bar>span:nth-child(2)").live("mousedown", function(){
		$(this).css("background-color", scroll_clickT);
		$(this).css("background-position", "0 -135px");
		
		A = $(this).closest("div.metro_na").children("ul").children("li:last-child").offset().left + 
								$(this).closest("div.metro_na").children("ul").children("li:last-child").width();
		B = $(this).closest("div.metro_na").offset().left + $(this).closest("div.metro_na").width();
		C = A - B + 30;
		
		if(C > 100)
			$(this).closest("div.metro_na").children("ul").children("*").stop(false, false).animate({left:"-=" + String(100) + "px"}, "fast");
		else
			$(this).closest("div.metro_na").children("ul").children("*").stop(false, false).animate({left:"-=" + String(C) + "px"}, "fast");		
		
	})
	
	$("div.metro_na>div.scroll_bar>span:nth-child(2)").live("mouseup", function(){
		$(this).css("background-color", scroll_hoverT);
		$(this).css("background-position", "0 -120px");
	})
	

/*-------------------------------------------------- END SCROLL EVENTS ------------------------------------------------*/


}else{/*-------------------------------------------------- jQuery 1.9.1+ ------------------------------------------------*/
	/*---------- BEGIN NAVIGATION ITEM HOVER --------*/
	$(document).on("mouseenter","div.metro_na>ul>li>a", function(){
		jQuery(this).closest("li").css("background-color", hover_colorT);
	})
	
	$(document).on('mouseleave',"div.metro_na>ul>li>a", function(){
		jQuery(this).closest("li").css("background-color", "transparent");
		jQuery(this).closest("li").css("transform", 'scale(1.0, 1.0)');
	})

	/*---------- END NAVIGATION ITEM HOVER --------*/

	/*---------- BEGIN NAVIGATION ITEM CLICK --------*/
	
	$(document).on('mousedown',"div.metro_na>ul>li>a", function(e){
		e.preventDefault();
		jQuery(this).closest("li").css("transform", 'scale(.98, .98)');
		
	})
	
	$(document).on('mouseup',"div.metro_na>ul>li>a", function(){
		jQuery(this).closest("li").css("transform", 'scale(1.0, 1.0)');
		var temp = "";
		
		if($(this).closest("li").children("ul").html() != null)
		{
			
			Content[$(this).closest("div.metro_na").index()] = $(this).closest("div.metro_na").html();
			
			temp = "<div class= 'nav_title'>" + $(this).closest("li").children("a").children("span").html() + 
						"<span class = 'back_button'></span>" + "</div>";
			
			temp = temp + "<ul>" + $(this).closest("li").children("ul").html() + "</ul>"
			
			X = $(this).closest("div.metro_na");
			$(this).closest("div.metro_na").children("*").remove();
			
			X.html(temp);
			
			X.children("div.nav_title").children("img").show();
			
			setScrollT();
			X.children("ul").children("*").css({"left":"30px", "opacity":"0"});
			X.children("div.nav_title").css({"opacity":"0"});
			
			X.children("ul").children("*").animate({left:'0px', opacity:'1'}, 300);
			X.children("div.nav_title").animate({opacity:'1'}, 300);
			setcolorsTT();
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
	
		X = $(this).closest("div.metro_na");
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

	$(document).on("mouseenter","div.metro_na>div.scroll_bar>span:first-child", function(){
		$(this).css("background-color", scroll_hoverT);
	})
	
	
	$(document).on("mouseout","div.metro_na>div.scroll_bar>span:first-child", function(){
		$(this).css("background-color", scroll_colorT);
		$(this).css("background-position", "0 -90px");
	})
	
	$(document).on("mouseenter","div.metro_na>div.scroll_bar>span:last-child", function(){
		$(this).css("background-color", scroll_hoverT);
	})
	
	
	$(document).on("mouseout","div.metro_na>div.scroll_bar>span:last-child", function(){
		$(this).css("background-color", scroll_colorT);
		$(this).css("background-position", "0 -120px");
	})

	$(document).on("mousedown","div.metro_na>div.scroll_bar>span:nth-child(1)", function(){
		$(this).css("background-color", scroll_clickT);
		$(this).css("background-position", "0 -105px");
		
		A = $(this).closest("div.metro_na").children("ul").children("li:first-child").offset().left
		B = $("div.metro_na").offset().left + 40;

		C = B - A;

		if(C > 100)
			$(this).closest("div.metro_na").children("ul").children("*").stop(false, false).animate({left:"+=" + String(100) + "px"}, "fast");
		else
			$(this).closest("div.metro_na").children("ul").children("*").stop(false, false).animate({left:"+=" + String(C) + "px"}, "fast");		

	})
	
	$(document).on("mouseup","div.metro_na>div.scroll_bar>span:nth-child(1)", function(){
		$(this).css("background-color", scroll_hoverT);
		$(this).css("background-position", "0 -90px");
	})
	
	$(document).on("mousedown","div.metro_na>div.scroll_bar>span:nth-child(2)", function(){
		$(this).css("background-color", scroll_clickT);
		$(this).css("background-position", "0 -135px");
		
		A = $(this).closest("div.metro_na").children("ul").children("li:last-child").offset().left + 
								$(this).closest("div.metro_na").children("ul").children("li:last-child").width();
		B = $(this).closest("div.metro_na").offset().left + $(this).closest("div.metro_na").width();
		C = A - B + 30;
		
		if(C > 100)
			$(this).closest("div.metro_na").children("ul").children("*").stop(false, false).animate({left:"-=" + String(100) + "px"}, "fast");
		else
			$(this).closest("div.metro_na").children("ul").children("*").stop(false, false).animate({left:"-=" + String(C) + "px"}, "fast");		
		
	})
	
	$(document).on("mouseup","div.metro_na>div.scroll_bar>span:nth-child(2)", function(){
		$(this).css("background-color", scroll_hoverT);
		$(this).css("background-position", "0 -120px");
	})

}

	$(window).resize(function () {
    waitForFinalEvent(function(){
	$("div.metro_na").each(function(){
		A = $(this).children("ul").children("li:last-child").offset().left + $(this).children("ul").children("li:last-child").width()
		B = $(this).offset().left + $(this).width();
	
		if(A > B)
		{
			if(!$(this).children("div.scroll_bar").length)
				$(this).append(scroll);
		}
		else
			$(this).children("div.scroll_bar").remove();
		$(this).children("div.scroll_bar").children("span").css("background-color", scroll_colorT)
	})
    }, 50, "some unique string");
});


})