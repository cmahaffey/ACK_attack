console.log('AJAX all the time')
var search;
$( document ).ready(function() {
  //function that does an AJAX call to internal API using information user inputs into search field
  document.getElementById('search-form').addEventListener('submit', function (e) {
   e.preventDefault();
  //Gets search field value.
   search = document.getElementById('query').value;
//Sets up AJAX call to always return JSON
   $.ajaxSetup({
      headers:{
       "accept": "application/json"
      }

    });
//AJAX call to movies API that will take in the name inputted into the search box and send ajax call to movie api
   $.ajax({
     url:'/movies/api',
     dataType: 'json',
     data:  {
       name: $('#query').val()
    }

    }).done(function(data){
      // function for AJAx call to OMDB API accepts the name and the year argument jsut fetch from Movies API
       movieInfo(data[data.length -1].name,data[data.length -1].year)

       });
   });
});
