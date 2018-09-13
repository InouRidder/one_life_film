/*////////////////////////////////////////////////////
  Template Name: Fungus Photography & Portfolio
  Version: 1.0
  Author: CodeLamp
  Author URL: https://themeforest.net/user/codelamp
////////////////////////////////////////////////////*/



$(function () {
    'use strict';

// Page Loading Animation

	var animsition = $('.animsition');

    animsition.animsition({
        inClass: 'fade-in',
        outClass: 'fade-out',
        inDuration: 800,
        outDuration: 500,
        loading: true,
        linkElement: 'a:not([target="_blank"]):not([href^="#"]):not(.zoom-frame):not(.preview):not(.video-frame):not(.map-frame)',
        overlay:   false,
        loadingClass: 'animsition-loading',
        overlayParentElement:'body'
    });

    animsition.on('animsition.inStart', function(){
       	$(this).addClass("delay");
    }).on('animsition.inEnd', function(){
    	$(this).removeClass("delay");
    });





// NiceScroll

    $("body").niceScroll({
        cursorcolor: "#555",
        cursorborderradius: "1px",
        cursorwidth: "8px",
        zindex: "999",
        scrollspeed: 50,
        mousescrollstep: 60,
        smoothscroll: true,
        autohidemode:false,
        cursorborder: "0px solid #fff"
    });



// Background Images
  document.addEventListener('turbolinks:load', function() {
    $('[data-backgroundimage]').each(function () {
        var element = $(this),
          bgimg = element.data('backgroundimage');
        if (bgimg.match('^rgb') || bgimg.match('^#')) {
            element.css('background-color', bgimg);
        } else {
            element.css('background-image', 'url(' + bgimg + ')');
        };
    });
  })





// Full Page Toggle Button

    $(".page-footer").on("click",".full-page",function (e) {
        e.preventDefault()

        var fp_btn = $(this),
            header = $("header"),
            footer = $("footer");

        if (header.hasClass("fixed")) {
            $(".page-header.fixed").toggleClass("header-out");
        };
        if (footer.hasClass("fixed")) {
            $(".page-footer.fixed").toggleClass("footer-out");
        };
        if (header.hasClass("fixed") || footer.hasClass("fixed")) {
            fp_btn.toggleClass("pe-7s-expand1");
            fp_btn.toggleClass("pe-7s-close-circle");
        };
    });





//Responsive Videos

    $('.video-container').fitVids();





// Mobile Menu

    var win_dow = $(window).width(),
    	drop_down = $(".manu-wrapper>ul>li>ul>li>ul");

    $(".page-header").on("click",".mobile-nav-button", function (e) {
        e.preventDefault()
        $(this).toggleClass("close-btn");
        $(".manu-wrapper").toggleClass("open-menu");
    });

    if (win_dow> 1024) {
        drop_down.parent("li").addClass("right-arrow");
    };

    $(window).on("resize", function () {
        var win_dow = $(window).width();
        if (win_dow > 1024) {
            drop_down.parent("li").addClass("right-arrow");
        } else {
            drop_down.parent("li").removeClass("right-arrow");
        };
    });







// Full Screen Toggle

    function toggleFullScreen() {
        if ((document.fullScreenElement && document.fullScreenElement !== null) ||
         (!document.mozFullScreen && !document.webkitIsFullScreen)) {
            if (document.documentElement.requestFullScreen) {
                document.documentElement.requestFullScreen();
            } else if (document.documentElement.mozRequestFullScreen) {
                document.documentElement.mozRequestFullScreen();
            } else if (document.documentElement.webkitRequestFullScreen) {
                document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
            };
        } else {
            if (document.cancelFullScreen) {
                document.cancelFullScreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.webkitCancelFullScreen) {
                document.webkitCancelFullScreen();
            };
        };
    };

	$(".page-footer").on("click",".fullscreen",function (e) {
	    e.preventDefault();
	    if ($.browser.msie) {}else{
	        $(this).toggleClass("fa-compress");
	        toggleFullScreen();
	    };
	});









// Zoom Image  Pop Up

	var zoom_frame = $(".zoom-frame");

	if (zoom_frame.length > 0) {
	    zoom_frame.magnificPopup({
	        type: 'image',
	        closeBtnInside: false,
	        fixedContentPos: true,
	        mainClass: 'mfp-no-margins mfp-with-zoom mfp-fade',
	        image: {
	            verticalFit: true
	        },
	        zoom: {
	            enabled: true,
	            duration: 400,
	            opener: function (openerElement) {
	                return openerElement.is('a') ? openerElement : openerElement.find('a');
	            }
	        },
	        gallery: {
	            enabled: true,
	            navigateByImgClick: true,
	        }
	    });
	};







// Defult Image  Pop Up

	var preview_frame = $(".preview");

	if (preview_frame.length > 0) {
	    preview_frame.magnificPopup({
	        type: 'image',
	        closeBtnInside: false,
	        removalDelay: 250,
	        image: {
	            verticalFit: true
	        },
	        gallery: {
	            enabled: true,
	            navigateByImgClick: true,
	        },
	        callbacks: {
	            beforeOpen: function () {
	                this.st.image.markup = this.st.image.markup.replace('mfp-figure', 'mfp-figure mfp-with-anim');
	                this.st.mainClass = ("mfp-move-horizontal");
	            },
	        },

	    });
	};






// Videos & Maps  Pop Up

	var video_map_frame = $(".video-frame,.map-frame");

	if (video_map_frame.length > 0) {
	    video_map_frame.magnificPopup({
	        type: 'iframe',
	        closeOnContentClick: true,
	        closeBtnInside: false,
	        fixedContentPos: true,
	        mainClass: 'mfp-no-margins mfp-with-zoom mfp-fade',
	        iframe: {
	            markup: '<div class="mfp-iframe-scaler">' +
                          '<div class="mfp-close"></div>' +
                          '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>' +
                        '</div>',
	            patterns: {
	                youtube: {
	                    index: 'youtube.com/',
	                    id: 'v=',
	                    src: 'https://www.youtube.com/embed/%id%?autoplay=1'
	                },
	                vimeo: {
  	                    index: 'vimeo.com/',
	                    id: '/',
	                    src: 'https://player.vimeo.com/video/%id%?autoplay=1'
	                },
	                gmaps: {
	                    index: '//maps.google.',
	                    src: '%id%&output=embed'
	                }
	            },
	            srcAction: 'iframe_src',
	        }
	    });
	};







 // Single Slider

	var single_slider = $(".single-slider");

	if (single_slider.length > 0) {
	    single_slider.each(function () {
	        var ss_slideShow = $(this),

        /*Data Attribute*/
            ss_interval = ss_slideShow.data("slide-interval"),
            ss_speed = ss_slideShow.data("slide-speed"),
            ss_animation = ss_slideShow.data("slide-animation"),
            ss_controller = ss_slideShow.data("slider-directions"),
            ss_bulletnav = ss_slideShow.data("dots-navigation"),
            ss_easing = ss_animation == "fade" ? "linear" : "swing";

	    /*Silder Usage */
	        ss_slideShow.flexslider({
	            animation: ss_animation,
	            animationSpeed: ss_speed,
	            slideshowSpeed: ss_interval,
	            directionNav: ss_controller,
	            controlNav: ss_bulletnav,
	            easing: ss_easing,
	            slideshow: true,
	            useCCS: false,
	            pausePlay: false,
	        });
	    });
	};








// Equal hight

   if ($(".equal-height").length > 1) {

       var w = $(window).width();

       equalHeight();

      /*Update Height on Resize*/
         $(window).on("resize", function () {
     	    if ($(window).width()==w) return;
			w = $(window).width();
			equalHeight("rs");
         });
     };

	function equalHeight(e) {
        $('.equal-height').parent().addClass("equal-parent");
        $('.equal-parent').each(function () {
            var el = $(this).find(".equal-height,.equal-height .video-container,.equal-height .fluid-width-video-wrapper,.equal-height img,.equal-height a[data-backgroundimage]");
            el.imagesLoaded(function () {
                if( e =="rs"){el.height("10px");}
                el.matchHeight({
                    byRow: false
                });
            });
        });
        $('.equal-parent').removeClass("equal-parent");
    };








// Isotope Filter

     if ($(".isotope-filter").length > 0) {
         $(".isotope-filter ul").on("click", "li a", function (event) {
             event.preventDefault();

             var i_filterd = $(".masonry,.grid,.wide,.horizontal"),
                 id = $(this).data('filter'),
                 id = id != '*' ? "." + id : '*';

             i_filterd.isotope({ filter: id });
             $('.isotope-filter ul li a').removeClass('active');
             $(this).addClass('active');
         });
     };







// Filter

     if ($(".filter").length > 0) {
         $(".filter ul").on("click", "li a",function (e) {
             e.preventDefault();

             var id = $(this).data('filter'),
                 h_filtered = $(".masonry,.grid,.wide,.horizontal"),
                 h_item = h_filtered.find(".item"),
                 id = id != '*' ? "." + id : h_item;
                 h_item.addClass("disable");
                 h_item.removeClass("enable");

             h_filtered.find($(id)).each(function () {
             	var element = $(this);
                 element.removeClass("disable");
                 element.addClass("enable");
             });

             $('.filter ul li a').removeClass('active');
             $(this).addClass('active');
         });
     };







// Home Slider & Gallery Slideshow

	var hs_Slider = $(".slider-show");

	if (hs_Slider.length > 0) {

	    var hs_Thumbnail = $(".thumbnail"),

	    /*Data Attribute*/
        hs_interval = hs_Slider.data("slide-interval"),
        hs_speed = hs_Slider.data("slide-speed"),
        hs_animation = hs_Slider.data("slide-animation"),
        hs_directions = hs_Slider.data("slider-directions"),
        hs_directions = (hs_directions == undefined) ? false : hs_directions,
        hs_bulletnav = hs_Slider.data("dots-navigation"),
        hs_bulletnav = (hs_bulletnav == undefined || hs_Thumbnail.length > 0) ? false : hs_bulletnav,
        hs_playPause = hs_Slider.data("slider-playpause"),
        hs_playPause = (hs_playPause == undefined) ? false : hs_playPause,
        hs_aniamtionLoop = hs_Slider.data("animation-loop"),
        hs_aniamtionLoop = (hs_aniamtionLoop == undefined) ? true : hs_aniamtionLoop,
        hs_sync = (hs_Thumbnail.length > 0) ? hs_Thumbnail : "";

	  /*Thumbnail Carousel*/
	    if (hs_Thumbnail.length > 0) {
	        hs_Thumbnail.flexslider({
                    animation: "slide",
                    controlNav: true,
                    animationLoop: false,
                    slideshow: false,
                    directionNav: false,
                    itemWidth: 102,
                    mousewheel: true,
                    drag: true,
                    itemMargin: 0,
                    asNavFor: hs_Slider,
                });
            }

	 /*Slider Usage*/
	    hs_Slider.flexslider({
	        animation: hs_animation,
	        animationSpeed: hs_speed,
	        slideshowSpeed: hs_interval,
	        directionNav: hs_directions,
	        controlNav: hs_bulletnav,
	        pausePlay: hs_playPause,
	        animationLoop: hs_aniamtionLoop,
	        slideshow: true,
	        easing: "linear",
	        useCCS: false,
	        sync: hs_sync
	    });

	 /*Slider Caption & Cover & Bullet Nav Settings */
	    var home_captions = $(".slider-show .slides>li>.caption");
	    home_captions.parents(".slider-show").find(".flex-control-nav").addClass("rightset");
	    home_captions.parents(".slider-show").find(".cover-wrapper").css('display', 'none');

	 /* Controller On Bottom Settings*/
	    var playpause = $(".controllerbottom").find(".flex-pauseplay");
	    playpause.parent().find(".flex-nav-prev").addClass("s-gap").find(".flex-prev").css({ 'border-right': 'none' });

	  /*Slider Thumbnail Center Settings*/
	    var t_paging =$(".flex-control-nav.flex-control-paging li").length;
	    if (t_paging < 1) {
	        $(".thumbnail.flexslider .flex-viewport").css({"display":"inline-block"});
	    }

	};







// Home Kenburns Slide Show & Gallery Kenburns Slideshow

	var hks_Kenburns = $(".kenburns-show");

	if (hks_Kenburns.length > 0) {

         var hks_Kenburn_slides = $(".kenburns-show .slides"),

        /*Data Attribute*/
            hks_interval = hks_Kenburns.data("slide-interval"),
            hks_autoplay = hks_Kenburns.data("slide-autoplay"),
            hks_directions = hks_Kenburns.data("slider-directions"),
            hks_bulletnav = hks_Kenburns.data("dots-navigation");

	 /*Slider Usage*/
	    hks_Kenburn_slides.owlCarousel({
	        items: 1,
	        animateOut: 'fadeOut',
	        loop: true,
	        autoplayTimeout: hks_interval,
	        touchDrag: true,
	        mouseDrag: false,
	        autoplay: hks_autoplay,
	        dots: hks_bulletnav,
	        nav: hks_directions,
	        margin: 0,
	    });


	 /* Slider Caption & Cover & Bullet Nav Settings */
	    var hks_captions = $(".kenburns-show .slides .item .caption");
	    hks_captions.parents('.kenburns-show').find(".owl-dots").addClass("rightset");
	    hks_captions.parents('.kenburns-show').find(".cover-wrapper").css('display', 'none');

	};







// Home Background Youtube Video

	if ($(".bg-video-wrapper").length > 0) {
    // Adding a 'loading image' that loads until the video starts
    // https://stackoverflow.com/questions/9097605/how-to-make-a-loading-image-when-loading-html5-video
    // $('#home-background').on('loadstart', function (event) {
    //   $(this).addClass('loading');
    // });
    // $('#home-background').on('canplay', function (event) {
    //   $(this).removeClass('loading');
    //   // $(this).attr('poster', '');
    // });

	 /*Mute Value*/
	    var video_control = $(".bgvideo-controls"),
	    	sound_btn = $('.vid-sound'),
	    	playpause_btn = $(".vid-playpause"),
	    	ytVdmute = $('.bg-video-wrapper').data('muted');

	    $('.bg-video-wrapper').YTPlayer({
	        mute: ytVdmute,
	        showControls: false,
	        showYTLogo: false,
	        autoPlay: true,
	        containment: 'self'
	    });

	 /*Sound Settings*/
	    if (ytVdmute==true) {
	        sound_btn.addClass('fa-volume-off');
	        sound_btn.removeClass("fa-volume-up");
	    } else {
	        sound_btn.addClass('fa-volume-up');
	        sound_btn.removeClass("fa-volume-off");
	    };

	 /*Sound Controls*/
	    video_control.on("click",".vid-sound", function () {
	    	var element = $(this);
	        if (element.hasClass("fa-volume-up")) {
	            element.removeClass("fa-volume-up");
	            element.addClass("fa-volume-off");
	            $('.bg-video-wrapper').YTPMute();
	        } else if (element.hasClass("fa-volume-off")) {
	            element.removeClass("fa-volume-off");
	            element.addClass("fa-volume-up");
	            $('.bg-video-wrapper').YTPUnmute();
	        };
	    });

	 /*Play Pause Controls*/
	    video_control.on("click",".vid-playpause",function () {
	    	var element = $(this);
	        if (element.hasClass("fa-play")) {
	            element.removeClass("fa-play");
	            element.addClass("fa-pause");
	            $('.bg-video-wrapper').YTPPlay();
	        } else if (element.hasClass("fa-pause")) {
	            element.removeClass("fa-pause");
	            element.addClass("fa-play");
	            $('.bg-video-wrapper').YTPPause();
	        };
	    });
	};








// Home Gallery PhotoWall & Gallery Photowall

	var hg_photowall = $('.photowall');

	if (hg_photowall.length > 0) {
	    hg_photowall.each(function () {

            var hg_item = hg_photowall.children('.item'),
                hg_gutter = hg_photowall.data('items-gap'),
	            hg_gutter = hg_gutter != undefined ? hg_gutter / 2 : 0;

	        hg_photowall.wrap("<div class='photowall-wrapper'/>");

	     /*Gallery Wall height*/
	        function photowallHeight(el) {
	            $(el).css({
	                'margin': -hg_gutter + 'px',
	                'height': '100%'
	            }).css('height', '+=' + hg_gutter * 2 + 'px');
	        };

	        hg_photowall.imagesLoaded(function () {
	            photowallHeight(hg_photowall);
	        });

	     /*Wall height On Resize*/
	        $(window).on("resize", function () {
	            photowallHeight(hg_photowall);
	        });

	     /*Space Between Items*/
	        hg_item.css({
	            'padding': hg_gutter + 'px',
	        });
	    });
	};







// Portfolio & Gallery Horizontal & Gallery Striped Carousel

    var ph_Carousel = $(".horizontal");

     if (ph_Carousel.length > 0) {

        /*Data Attribute*/
        var ph_gutter = ph_Carousel.data("items-gap"),
            ph_loop = ph_Carousel.data("items-loop"),
            ph_autoplay = ph_Carousel.data("carousel-autoplay"),
            ph_directions = ph_Carousel.data("carousel-directions"),
            ph_small_dsk = ph_Carousel.data("small-desktop-item"),
            ph_medium_dsk = ph_Carousel.data("medium-desktop-item"),
            ph_large_dsk = ph_Carousel.data("large-desktop-item"),
            ph_autowidth = ph_Carousel.data("item-autowidth"),
            ph_activecenter = ph_Carousel.data("align-center"),
            ph_activecenter = ph_activecenter == undefined ? false : ph_activecenter,
            ph_autowidth = ph_autowidth == undefined ? false : ph_autowidth,
            ph_loop = ph_autowidth == true ? true : ph_loop,
            ph_scroll = ph_Carousel.data("carousel-scroll"),
	        ph_H_item = ph_small_dsk > 5 ? 5 : ph_small_dsk;


       /*Carousel Usage*/
        ph_Carousel.imagesLoaded(function () {
	        ph_Carousel.owlCarousel({
	            loop: ph_loop,
	            margin: ph_gutter,
	            nav: ph_directions,
	            autoplay: ph_autoplay,
	            autoplayTimeout: 2000,
	            center: ph_activecenter,
	            autoWidth: ph_autowidth,
	            dots: false,
	            autoplayHoverPause: true,
	            responsive: {
	                0: {
	                    items: 1
	                },
	                480: {
	                    items: 2
	                },
	                767: {
	                    items: 3
	                },
	                1050: {
	                    items: ph_H_item
	                },
	                1165: {
	                    items: ph_small_dsk
	                },
	                1365: {
	                    items: ph_medium_dsk
	                },
	                1900: {
	                    items: ph_large_dsk
	                }
	            }
	        });
        });

       /*Carousel Scroll Settings*/
	    if (ph_scroll == true) {
	        ph_Carousel.on('mousewheel', '.owl-stage', function (e) {
	            if (e.deltaY > 0) {
	                ph_Carousel.trigger('prev.owl');
	            } else {
	                ph_Carousel.trigger('next.owl');
	            }
	            e.preventDefault();
	        });
	    };
	};






// Portfolio & Gallery & Blog Masonry

	var pm_masonry = $('.masonry');

	if (pm_masonry.length > 0) {
	    pm_masonry.each(function () {

	        var pm_masonry = $(this),
                pm_item = pm_masonry.children('.item'),
                pm_item_d_width = pm_masonry.children('.item.double-width'),
                pm_item_d_height = pm_masonry.children('.item.double-height'),

            /*Data Attribute*/
                pm_gutter = pm_masonry.data('items-gap'),
                pm_gutter = pm_gutter != undefined ? pm_gutter / 2 : 0,
                pm_colomns = pm_masonry.data('items-columns'),
                pm_colomns = pm_colomns != undefined ? pm_colomns : 4,
	            pm_itemHeight = pm_masonry.data('items-height'),
	            pm_itemHeight = pm_itemHeight != undefined ? pm_itemHeight : "grid";

	     /*Items Wrapper Margin*/
	        pm_masonry.wrap("<div class='masonry-wrapper'/>");
	        pm_masonry.css({
	            'margin': -pm_gutter + 'px'
	        });

	     /*If Item Height Auto */
	        if (pm_itemHeight == "auto") {

	            /*Item Inner Wrapper Style*/
	            pm_item.wrapInner("<div class='item-inner-wrapper' />");
	            pm_masonry.find('.item-inner-wrapper').css({
	                'margin-top': pm_gutter,
	                'margin-bottom': pm_gutter,
	                'margin-left': pm_gutter,
	                'margin-right': pm_gutter,
	            });
	            masonryAutoItemSizes();

	            $(window).resize(masonryAutoItemSizes);
	        }
	        /*If Item Height Grid Or undefined */
	        else if (pm_itemHeight == "grid") {

	            /*Item Inner Wrapper Style*/
	            pm_item.wrapInner("<div class='item-inner-wrapper' />");
	            pm_masonry.find('.item-inner-wrapper').css({
	                'position': 'absolute',
	                'top': pm_gutter,
	                'bottom': pm_gutter,
	                'left': pm_gutter,
	                'right': pm_gutter,
	            });

	            masonryItemSizes();

	            $(window).resize(masonryItemSizes);
	        };



	         /*Masonry Auto Height Item Size*/
	            function masonryAutoItemSizes() {
	                var pm_window = $(window).width();
	                if (pm_window <= 767) {
	                    pm_colomns = 1;
	                } else {
	                    pm_colomns = pm_masonry.data('items-columns'),
                        pm_colomns = pm_colomns != undefined ? pm_colomns : 3;
	                };
	                pm_item.width(pm_masonry.width() / pm_colomns);

	            };


	        /*Masonry Grid Style Item Size*/
	            function masonryItemSizes() {
	                var pm_window = $(window).width();
	                if (pm_window <= 767) {
	                    pm_colomns = 1;
	                } else {
	                    pm_colomns = pm_masonry.data('items-columns'),
                        pm_colomns = pm_colomns != undefined ? pm_colomns : 3;
	                };
	                pm_item.width(pm_masonry.width() / pm_colomns);
	                pm_item.height(pm_item.width() * 4 / 5);
	                pm_item_d_height.height(pm_item.width() * 8 / 5);
	                pm_item_d_width.width(pm_masonry.width() / pm_colomns * 2);

	            };

	        /*Isotope Usage*/
	            function masonry() {
	                pm_masonry.isotope({
	                    itemSelector: '.item',
	                    masonry: { columnWidth: pm_masonry.width() / pm_colomns }
	                });
	            };
	            masonry()

	            pm_masonry.imagesLoaded(masonry);

	     /* Update Masonry On Resize */
	        $(window).on("resize", function () {
	            masonry();
	        });

	    });
	};







// Portfolio & Gallery Grid

	var pg_grid = $('.grid');

	if (pg_grid.length > 0) {
	    pg_grid.each(function () {

	        var pg_item = pg_grid.children('.item'),

            /*Data Attribute*/
                pg_gutter = pg_grid.data('items-gap'),
                pg_gutter = pg_gutter != undefined ? pg_gutter / 2 : 0,
                pg_colomns = pg_grid.data('items-columns'),
                pg_colomns = pg_colomns != undefined ? pg_colomns : 4;

	    /*Items Wrapper Margin*/
	        pg_grid.wrap("<div class='grid-wrapper'/>");
	        pg_grid.css({
	            'margin': -pg_gutter + 'px'
	        });

	     /*Item Inner Wrapper*/
	        pg_item.wrapInner("<div class='item-inner-wrapper' />");
	        pg_grid.find('.item-inner-wrapper').css({
	            'position': 'absolute',
	            'top': pg_gutter,
	            'bottom': pg_gutter,
	            'left': pg_gutter,
	            'right': pg_gutter,
	        });

	     /*Grid Item Size*/
	        function griditemSizes() {
	            var pg_window = $(window).width();
	            if (pg_window <= 891) {
	                pg_colomns = 1;
	            } else {
	                pg_colomns = pg_grid.data('items-columns'),
                    pg_colomns = pg_colomns != undefined ? pg_colomns : 3;
	            };

	            pg_item.width(pg_grid.width() / pg_colomns);
	            pg_item.height(pg_item.width() * 4 / 5);
	        };

	        griditemSizes()

        /*Isotope Usage*/
            pg_grid.isotope({
                itemSelector: '.item',
                masonry: { columnWidth: pg_grid.width() / pg_colomns }
            });

	     /*Update Grid On Resize*/
	        $(window).on("resize", function () {
	            griditemSizes();
	            pg_grid.isotope({
	                masonry: { columnWidth: pg_grid.width() / pg_colomns }
	            });
	        });
	    });
	};







// Portfolio & Gallery & Blog Wide

	var pw_wide = $('.wide');

	if (pw_wide.length > 0) {
	    pw_wide.each(function () {

            var pw_item = pw_wide.children('.item'),

            /*Data Attributes*/
                pw_gutter = pw_wide.data('items-gap'),
                pw_gutter = pw_gutter != undefined ? pw_gutter : 0;

	     /*Items Wrapper Margin*/
	        pw_wide.wrap("<div class='wide-wrapper'/>");
	        pw_wide.css({
	            'margin-top': -pw_gutter + 'px',
	            'margin-bottom': -pw_gutter + 'px'
	        });

	     /*Item Inner Wrapper*/
	        pw_item.wrapInner("<div class='item-inner-wrapper' />");
	        pw_wide.find('.item-inner-wrapper').css({
	            'position': 'absolute',
	            'top': pw_gutter,
	            'bottom': pw_gutter,
	            'left': 0,
	            'right': 0,
	        });


	     /*Wide Item Sizes*/
	        function wideitemSizes() {
	            pw_item.height(400 + (pw_gutter * 2));
	        }
	        wideitemSizes();

	     /*Isotope Usage*/
	        pw_wide.imagesLoaded(function () {
	            pw_wide.isotope({
	                itemSelector: '.item'
	            });
	        });
	    });
	};







// Newsletter

	var subscribe = $('#subscribe');

	if (subscribe.length > 0) {
	    subscribe.submit(function () {

	        var element = $(this),
	        	s_url = element.attr('action'),

	     /*Get Value*/
	         	s_email = element.find('[name="email"]').val(),
	        	atpos = s_email.indexOf("@"),
	         	dotpos = s_email.lastIndexOf(".");
	        if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= s_email.length) {
	            $('.response').html('<div class="wrong"> Not a valid e-mail address</div>').fadeIn(500);
	            $('.wrong').slideDown('300');
	            return false;
	        };

	     /*Send value to subscribe.php*/
	        $.ajax({
	            type: "POST",
	            url: s_url,
	            data: $("#subscribe").serialize(),
	            success: function (resp) {

	            /*Response from subscribe.php*/
	                $("#subscribe").slideUp(300);
	                $('.response').html(resp).slideUp(0).slideDown(300);
	                $('#subscribe input[type="email"]').val('');
	            },
	            error: function () {
	              /*Error message*/
	                $('.response').html('<div class="wrong"> <strong> Oh snap! </strong>Something went wrong, try again !</div>').fadeIn(500);
	                $('.wrong').slideDown('300');
	            }
	        });
	        return false;

	    });
	};







// Contact  Us

	if ($("#contact").length > 0) {
	    $('form#contact').submit(function () {
	        var element = $(this),
	        	url = element.attr('action'),

	     /*Get Value From Contact Form*/
	           name = element.find('[name="user_name"]').val(),
	           email = element.find('[name="user_email"]').val(),
	           subject = element.find('[name="message_subject"]').val(),
	           message = element.find('[name="user_message"]').val();

	     /*Send value to contact.php*/
	        $.ajax({
	            type: "POST",
	            url: url,
	            data: $("#contact").serialize(),
	            success: function (response) {

	             /*Response from contact.php*/
	                $('.message').html(response).slideDown(500);
	                $('form#contact input:not([type=submit]),form#contact textarea').val('');
	            },
	            error: function () {
	             /*Error message*/
	                $('.message').html('<div class="alert alert-danger" role="alert"> <strong> Oh snap! </strong>Something went wrong, try again !</div>').slideDown('300');
	            }
	        });
	        return false;
	    });
	};







// Google Map

	if ($('#map').length > 0) {
	    var g_map = $("#map"),

        /*Data Attribute*/
            latitude = g_map.data("latitude"),
            longitude = g_map.data("longitude");

	  /*Google Map Usage*/
	    var map = new google.maps.Map(document.getElementById('map'), {
	        center: { lat: latitude, lng: longitude },
	        zoom: 12,
	        scrollwheel: false,
	        mapTypeId: 'roadmap',
	        styles: [
              {
                  featureType: 'all',
                  stylers: [
                    { saturation: -380 }
                  ]
              }, {
                  featureType: 'road.arterial',
                  elementType: 'geometry',
                  stylers: [
                    { hue: '#00ffee' },
                    { saturation: 50 }
                  ]
              }, {
                  featureType: 'poi.business',
                  elementType: 'labels',
                  stylers: [
                    { visibility: 'off' }
                  ]
              }
	        ],
	        zoomControl: true,
	        zoomControlOptions: {
	            style: google.maps.ZoomControlStyle.SMALL,
	            position: google.maps.ControlPosition.RIGHT_CENTER
	        },
	    });

      /*Marker Icon*/
	    var marker_url = 'images/marker.png';
	    var marker = new google.maps.Marker({
	        position: { lat: latitude, lng: longitude },
	        map: map,
	        visible: true,
	        icon: marker_url,
	    });
	};



});
