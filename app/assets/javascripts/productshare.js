$(function() {

  $('.add-product-link').click(function() {
    $('.new_product').show();
  });

  $('.dropdown-link').mouseenter(function() {
    $(this).parent().find('.dropdown-menu').addClass('active');
  });

  $('.dropdown').mouseleave(function() {
    $('.dropdown-menu').removeClass('active');
  });

  $('.tooltip-link').mouseenter(function() {
    $(this).parent().find('.tooltip-content').addClass('active');
  });

  $('.tooltip').mouseleave(function() {
    $('.tooltip-content').removeClass('active');
  });

});
