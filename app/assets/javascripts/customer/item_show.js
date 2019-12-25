$(document).ready(function() {
  $('.slider').slick({
  slidesToShow: 6,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 1000,
	});

	$('.comment-create').click(function() {
	var $answer = $(this).find('.comment');
	if($answer.hasClass('open')) {
	  $answer.removeClass('open');
	  $answer.slideUp();

	  $(this).find('i').text('');
	} else {
	  $answer.addClass('open');
	   $answer.slideDown();
	  $(this).find('span').text('-');
	}
	});

	$('.search-btn').click(function() {
	var $answer = $(this).find('.search-form');
	if($answer.hasClass('open')) {
	  $answer.removeClass('open');

	  $(this).find('i').text('');
	} else {
	  $answer.addClass('open');
	   $answer.slideDown();
	}
	});

 });