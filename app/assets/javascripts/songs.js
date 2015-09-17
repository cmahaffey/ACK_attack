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
//console.log(data[0].id)
      // console.log(data[0]);
      // console.log(data[0].artist);


for(i=0; i<data.length; i++){
      songInfo(data[i].name, data[i].artist,data[i].id)
}
    });


  });
});
