// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(function() { //start after HTML, images have loaded

  $(".main-head").fadeIn("slow");


  $('#search-button').hover(function(){
    $(this).css("border", "2px solid white");
  }, function(){
    $(this).css("border", "none");
  });

});
