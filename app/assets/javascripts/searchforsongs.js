// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
console.log('AJAX all the time')
var search;
$( document ).ready(function() {
//function that does an AJAX call to internal API using information user inputs into search field
  document.getElementById('search-form').addEventListener('submit', function (e) {
    e.preventDefault();
    //Gets search field value
    search = document.getElementById('query').value;

    //var $moviename = $('#moviesong').val()

    $.ajaxSetup({
        headers:{
          "accept": "application/json"
        }
      });
//AJAX call to songs API that will take in the name inputted into the search box and send ajax call to songs api
    $.ajax({
      url:'/songs/api',
      dataType: 'json',
      data:{
        name:$('#query').val()
      }
    }).done(function(data){
// loop that makes call  to Spotify API to return information about the songs in a particular movie
      for(i=0; i<data.length; i++){
        songInfo(data[i].name, data[i].artist, data[i].id);
      }
    });
  });
});
