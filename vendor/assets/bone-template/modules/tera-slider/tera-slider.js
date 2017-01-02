/*

Tera Slider JS
Version 3.1
Made by Themanoid

*/

(function($) {

    "use strict"; // Strict mode

    var $slider = $('.slider'); // Define the slider
    var $mousePos = { x: -1, y: 0 }; // We need the mouse position for the slider controls
    var $autoSlide;
    var $autoSlideDirection = 'right'; // Can be 'right' or 'left' to set the direction
    var $transition = 'slide';
    var $indicatorWrapper = $('<ul class="slide-indicators"></ul>');
    var trigger = 'trigger';

    if($slider.hasClass('fade-slide'))
      $transition = 'fade';

    $(window).resize(function(){
      sliderResize();
    });

    $slider.mousemove(function(e){ // Get the cursor position
        var $sldr = $(this);
        var $offset = $sldr.offset();
        if($sldr.hasClass('multi-slides')){
            $mousePos.x = e.pageX - $offset.left;
            $mousePos.y = e.pageY - $offset.top;
            if($mousePos.x > $sldr.width()/2) {
              $sldr.find('.slides').css('cursor', 'url(/assets/modules/tera-slider/slide-right-dark.png) 5 -25, e-resize');
              if($('body').hasClass('dark-hero'))
                $sldr.find('.slides').css('cursor', 'url(/assets/modules/tera-slider/slide-right.png) 5 -25, e-resize');
            } else {
              $sldr.find('.slides').css('cursor', 'url(/assets/modules/tera-slider/slide-left-dark.png) 5 -25, w-resize');
              if($('body').hasClass('dark-hero'))
                $sldr.find('.slides').css('cursor', 'url(/assets/modules/tera-slider/slide-left.png) 5 -25, w-resize');
            }
            if($mousePos.y > ($sldr.height() - 15)) {
              $sldr.css('cursor', 'default');
            }
        }
    });

    // For each slider
    $slider.each(function(){
        var index = 0;
        var s = $(this);
        var slideCount = parseInt(s.find('li.slide').length);

        $(this).find('li.slide').each(function(){ // For each slide
            $(this).attr('data-index',index); // Add index to element
            var $slide = $(this);
            if(index > 0)
                s.addClass('multi-slides');
            if(index == 0)
                setTimeout(function(){$slide.addClass('active');},1); // Add the active state to the first slide
            index++;
        });

        setTimeout(function(){
          var $curSlide = s.find('.active');
          var $video = $curSlide.find("video");
          var autoSlide = s.attr('auto-slide');

          if($video.length == 1){
            $video[0].play();
          }
          if($curSlide.hasClass('dark') && s.find('.hero').length != 0) // Set dark mode if available for the first slide
            $('body').addClass('dark-hero');
          sliderResize();

          if (typeof autoSlide !== typeof undefined && autoSlide !== false) {
            $autoSlide = setInterval( function() { toggleSlide(s,$autoSlideDirection,trigger); }, 4500 );
          }

        },100);

        var $indicators = $(this).attr('indicators');
        if($indicators){
          for (var n = 0; n < slideCount; ++ n)
            $indicatorWrapper.append('<li class="slider-trigger" data-trigger="'+n+'"></li>');
          $(this).append($indicatorWrapper);
        }
        $('.slider-trigger').first().addClass('active');
    });

    function sliderResize(){
        $slider.each(function(){ // Resize functions for each slider
            var isCarousel = $(this).hasClass('carousel');
            var slideCount = parseInt($(this).find('li.slide').length);
            var $sliderWidth = $(this).width();
            var $slides = $(this).find('ul.slides');
            var $curSlide = parseInt($slides.find('.active').attr('data-index'));
            if(isCarousel){
              var $visibleItems = $(this).attr('data-visible');
              $slides.width(($sliderWidth/$visibleItems)*(slideCount));
              $slides.css({ 'transform': 'translate3d(-'+($sliderWidth/$visibleItems)*($curSlide)+'px, 0, 0)'})
              $(this).find('li.slide').width((100/slideCount)+'%');
            } else {
              $slides.width($sliderWidth*slideCount);
              $slides.css({ 'transform': 'translate3d(-'+$sliderWidth*($curSlide)+'px, 0, 0)'})
              $(this).find('li.slide').width(100/slideCount+'%');
            }
        });
    }

    $('body').on('click', '.slider-trigger', function(e){
      e.stopPropagation();
      var dataTrigger = parseInt($(this).attr('data-trigger'));
      toggleSlide($(this).parent().parent(),null,dataTrigger);
      e.preventDefault();
    });

    $('body').on('click', '.slider .slides', function(){
        toggleSlide($(this).parent(),null,trigger);
        var s = $(this).parent();
        var autoSlide = s.attr('auto-slide');
        if (typeof autoSlide !== typeof undefined && autoSlide !== false) {
            clearInterval($autoSlide);
            $autoSlide = setInterval( function() { toggleSlide(s,$autoSlideDirection,trigger); }, 4500 );
        }
    });

    function toggleSlide(e,d,n) {

        // Slide controls
        var $sliderWidth = e.width();
        var $slides = e.find('ul.slides');
        var $slideCount = e.find('li.slide').length;
        var $activeSlide = e.find('.slide.active');
        var $carousel = e.hasClass('carousel');
        var $activeSlideIndex = parseInt($activeSlide.attr('data-index'));
        var $carouselSlideCount = parseInt(e.attr('data-visible'));
        var $newSlide;
        var $delay = 0;

        // Pause video
        var $curVideo = $activeSlide.find("video");
        if($curVideo.length == 1){
          $curVideo[0].pause();
          $curVideo.addClass('pause');
        }
        if($curVideo.length == 1 && $transition == 'slide'){
          $delay = 500; // This fixes a performance issue
        }

        // If direction is set
        if(d){
            if(d == 'right'){
                if($slideCount - $activeSlideIndex == $carouselSlideCount || ($slideCount-1) == $activeSlideIndex)
                  $newSlide = 0;
                else
                  $newSlide = $activeSlideIndex+1;
            } else if(d == 'left') {
                if(0 == $activeSlideIndex)
                  $newSlide = ($slideCount-1);
                else
                  $newSlide = $activeSlideIndex-1;
            }
        } else {
            // If clicked on next slide
            if($mousePos.x > $sliderWidth/2) {
                if($slideCount - $activeSlideIndex == $carouselSlideCount || ($slideCount-1) == $activeSlideIndex)
                  $newSlide = 0;
                else
                  $newSlide = $activeSlideIndex+1;
            }
            // If clicked on previous slide
            else {
                if(0 == $activeSlideIndex)
                  $newSlide = $slideCount-1;
                if(0 == $activeSlideIndex && $carousel)
                  $newSlide = ($carouselSlideCount-1);
                else if (0 != $activeSlideIndex)
                  $newSlide = ($activeSlideIndex-1);
            }
        }

        if(n != trigger)
          $newSlide = n;

        e.find('[data-trigger]').removeClass('active');
        e.find('[data-trigger='+$newSlide+']').addClass('active');
        var $video = $slides.find('[data-index='+$newSlide+']').find("video");
        if($video.length == 1){
          $video.removeClass('pause');
          $video[0].play();
        }

        setTimeout(function(){

          $slides.find('li').removeClass('active'); // First remove all active classes
          $slides.find('[data-index='+$newSlide+']').addClass('active'); // Set the current slide to active
          if($slides.find('.hero').length != 0){
            if($slides.find('.active').hasClass('dark')) // If the current slide is dark
                $('body').addClass('dark-hero'); // Set dark mode
            else
                $('body').removeClass('dark-hero'); // Unset dark mode
          }
          window.requestAnimationFrame(animateSlide);
        }, $delay);


        function animateSlide(){
          if($transition == 'slide' && $slideCount != 1 && $newSlide != $activeSlideIndex){
            $slides.css({ 'transform': 'translate3d(-'+$sliderWidth*($newSlide)+'px, 0, 0)'}) // Using translate3d for performance boost
            e.find('.slide').css({ 'transform': 'scale(1)'});
            $activeSlide.css({ 'transform': 'scale(.7)'});
            sliderResize();
          }
          if($transition == 'fade' && $slideCount != 1 && $newSlide != $activeSlideIndex){
            e.find('.slide').css({ 'opacity': '0' });
            setTimeout(function(){
              $slides.css({ 'transform': 'translate3d(-'+$sliderWidth*($newSlide)+'px, 0, 0)'});
            }, 1000);
            setTimeout(function(){
              e.find('.slide').css({ 'opacity': '1' });
              sliderResize();
            }, 1000);
          }
        }

    }

})(jQuery);
