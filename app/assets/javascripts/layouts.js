$(document).on('turbolinks:load', function(){
  $('.menu-trigger').on('click', function(){
    $(this).toggleClass('active');
    $('#sidebar').slideToggle();
  });
});