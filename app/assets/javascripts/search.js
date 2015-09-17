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

    }).done(function(data){
      // console.log(data[0].name);
      //console.log(data[0].year);

      movieInfo(data[0].name,data[0].year)
     //test(data[data.length-1].name)

      // songInfo(data[0].id)

    });
  });


});

//
// function song_find(movie){
//   $.ajaxSetup({
//         headers:{
//           "accept": "application/json"
//         }});
//   $.ajax({
//    url:'/json',
//    dataType: 'json',
//    data:  {
//        movie_id: movie.id
//      }
//   }).done(function(data, search){
//    console.log(data);
//   });
//
// }
