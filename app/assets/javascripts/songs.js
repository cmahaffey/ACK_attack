// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
console.log('AJAX all the time')
var search;
$( document ).ready(function() {

  document.getElementById('search-form').addEventListener('submit', function (e) {
      e.preventDefault();
      search = document.getElementById('query').value;

     $.ajaxSetup({
           headers:{
             "accept": "application/json"
           }});
    $.ajax({
      url:'/songs/api',
      dataType: 'json',
      data:
          {
            name:$('#query').val()

       }
    }).done(function(data){
      console.log(data);
      //console.log(data[0].artist);


      songInfo(data[0].name, data[0].artist)

    });


  });
});
