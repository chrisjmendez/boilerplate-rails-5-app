;(function($) {

  'use strict'; // Using strict mode

  // Page transitions
  // CHANGED
  //$('a[href!=#][data-toggle!=tab][target!=_blank][class!=anchor]').addClass('smooth');

  $('.smooth-transition').animsition({
    linkElement: '.smooth',
    inDuration: 500,
    outDuration: 500,
  });

  var $grid = $('.grid');

  // Initialize Masonry
  $grid.masonry({
    itemSelector: '.grid-item', // Portfolio item
    columnWidth: '.grid-sizer',
    percentPosition: true,
    transitionDuration: 0
  });

  $(window).on('resize', function(){
    // Change Masonry on resize
    setTimeout(function(){
      $grid.masonry('layout');
      window.requestAnimationFrame(inView); // Make new items visible
    }, 1500);
  });

  // Mobile menu trigger for classic menu
  $('.mobile-nav').on('click', function(e){
    $('body').toggleClass('menu-active');
  });

  $('.menu').on('click', function(e){
    e.stopPropagation();
    $('body').addClass('active-menu');
    $('.body-overlay').delay(100).fadeIn(400);
    $('.exit').hide(0).delay(1000).fadeIn(400);
  });

  $('html').on('click', function(e){
    $('body').removeClass('active-menu');
    $('.body-overlay').fadeOut(300);
  });

  $('.nav-container').on('mouseover', function(e){
    e.stopPropagation();
  });

  $('.nav-container .exit').on('click', function(e){
    e.preventDefault();
    $('body').removeClass('active-menu');
    $('.body-overlay').fadeOut(300);
  });

  $('.nav-container .nav li').click(function(e){
    e.stopPropagation();
    var hasDropdown = $(this).has('.dropdown').length;
    if(hasDropdown){
      e.preventDefault();
      if(!$(this).find('.dropdown').hasClass('active')){
        $('.dropdown').removeClass('active');
        $(this).find('.dropdown').addClass('active');
      } else {
        $('.dropdown').removeClass('active');
      }
    } else {
      $('body').removeClass('active-menu');
      $('.body-overlay').fadeOut(500);
    }
  });

  $('html').click(function(){
    $('.dropdown').removeClass('active');
  });

  $('header').affix({
    offset: {
      top: 25
    }
  });

  // You can use anchor links, using the .anchor class
  $('.anchor').on('click', function(e){
    e.preventDefault();
    e.stopPropagation();
    $('body').removeClass('menu-active');
    var href = $(this).attr('href');
    $('html,body').animate({
      scrollTop : $(href).offset().top-48+'px'
    });
  });

  // Parallax background script, use the ".parallax" class.
  var parallaxSpeed = 0.15;

  function parallax(){
    // Parallax scrolling function
    $('.parallax').each(function(){
      var el = $(this);
      var yOffset = $(window).scrollTop(),
      parallaxOffset = yOffset * parallaxSpeed,
      parallaxOffset = +parallaxOffset.toFixed(2);
      if(el.hasClass('fs')){
        el.css('transform','translate3d(-50%,-'+(50-parallaxOffset*0.15)+'%,0)');
      } else {
        el.css('transform','translate3d(0,'+parallaxOffset+'px,0)');
      }
    });
  }

  // Initialize functions on scroll
  $(window).on('scroll', function(){
    window.requestAnimationFrame(parallax); // Parallax
  });

  var $animation_elements = $('.item'); // The fly-in element, used for elements that fly-in the window after they're visible on screen

  function inView() { // Function when element is in view
    var window_height =   $(window).height();
    var window_top_position =   $(window).scrollTop();
    var window_bottom_position = (window_top_position + window_height);

    $.each($animation_elements, function() {
      var $element = $(this);
      var element_height = $element.outerHeight();
      var element_top_position = $element.offset().top-100;
      var element_bottom_position = (element_top_position + element_height);

      //check to see if this current container is within viewport
      if ((element_bottom_position >= window_top_position) &&
      (element_top_position <= window_bottom_position)) {
        $element.addClass('in-view');
      } else {
        $element.removeClass('in-view');
      }
    });
  }

  // Toggle cart
  $('.cart-toggle').on('click', function(){
    $('.cart-container').fadeToggle();
  });

  // Add to cart animation
  $('.add-to-cart').on('click', function(e){
    e.stopPropagation();
    $('.cart-container').fadeIn();
    e.preventDefault();
  });

  // Stop propagation for cart click
  $('.cart').on('click', function(e){
    e.stopPropagation();
  });

  // Fade out cart when clicked anywhere outside
  $('html').on('click', function(){
    $('.cart-container').fadeOut();
  });

  $(window).on('scroll resize', function(){
    window.requestAnimationFrame(inView);
    $('.anchor').each(function(){
      var id = '#'+$('.in-view').attr('id');
      if(id == $(this).attr('href')){
        $('.anchor').removeClass('active');
        $(this).addClass('active');
      }
    });
  });

  $(window).load(function(){
    window.requestAnimationFrame(inView);
  });

  $(window).bind("pageshow", function(event) {
    if (event.originalEvent.persisted) {
      window.location.reload()
    }
  });

})(jQuery);
