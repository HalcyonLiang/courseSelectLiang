$(document).ready(function() {

	/*============================================
	Navigation Functions
	==============================================*/
	if ($(window).scrollTop()===0){
		$('#main-nav').removeClass('scrolled');
        $('#logo').attr("src","img/logo.png");
	}
	else{
		$('#main-nav').addClass('scrolled');
        $('#logo').attr("src","img/logo3.png");
	}

	$(window).scroll(function(){
		if ($(window).scrollTop()===0){
			$('#main-nav').removeClass('scrolled');
            $('#logo').attr("src","img/logo.png");
		}
		else{
			$('#main-nav').addClass('scrolled');
            $('#logo').attr("src","img/logo3.png");
		}
	});


	/*============================================
	Header Functions
	==============================================*/
	$('.jumbotron').height($(window).height()+50);
	$('.message-box').css({'marginTop':$(window).height()*0.4});

	$('.home-slider').flexslider({
		animation: "fade",
		directionNav: false,
		controlNav: false,
		direction: "vertical",
		slideshowSpeed: 2500,
		animationSpeed: 500,
		smoothHeight: false
	});

	/*============================================
	Twitter Functions
	==============================================*/
	var tweetsLength = $('#twitter-slider').data('tweets-length'),
		widgetID = $('#twitter-slider').data('widget-id');

	twitterFetcher.fetch(widgetID, 'twitter-slider', tweetsLength, true, false, true, '', false, handleTweets);

	function handleTweets(tweets){

		var x = tweets.length,
			n = 0,
			tweetsHtml = '<ul class="slides">';

		while(n < x) {
			tweetsHtml += '<li>' + tweets[n] + '</li>';
			n++;
		}

		tweetsHtml += '</ul>';
		$('#twitter-slider').html(tweetsHtml);

		$('.twitter_reply_icon').html("<i class='icon-reply'></i>");
		$('.twitter_retweet_icon').html("<i class='icon-retweet'></i>");
		$('.twitter_fav_icon').html("<i class='icon-star'></i>");

		$('#twitter-slider').flexslider({
			prevText: '<i class="icon-angle-left"></i>',
			nextText: '<i class="icon-angle-right"></i>',
			slideshowSpeed: 5000,
			useCSS: true,
			controlNav: false,
			pauseOnAction: false,
			pauseOnHover: true,
			smoothHeight: false
		});
	}
	/*============================================
	Resize Functions
	==============================================*/
	$(window).resize(function(){
		$('.jumbotron').height($(window).height());
		$('.message-box').css({'marginTop':$(window).height()*0.4});
		scrollSpyRefresh();
		waypointsRefresh();
	});

	/*============================================
	Scrolling Animations
	==============================================*/
	$('.scrollimation').waypoint(function(){
		$(this).toggleClass('in');
	},{offset:'90%'});

	/*============================================
	Refresh scrollSpy function
	==============================================*/
	function scrollSpyRefresh(){
		setTimeout(function(){
			$('body').scrollspy('refresh');
		},1000);
	}

	/*============================================
	Refresh waypoints function
	==============================================*/
	function waypointsRefresh(){
		setTimeout(function(){
			$.waypoints('refresh');
		},1000);
	}

});