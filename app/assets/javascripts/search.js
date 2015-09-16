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
      url:'/movies/api',
      dataType: 'json',
      data:  {
          name: $('#query').val()
        }
    }).done(function(data, search){
      console.log(data[0].name);
      console.log(data[0].year);


    });


  });
});
movie
