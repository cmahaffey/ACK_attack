console.log('scripts')


 $( document ).ready(function() {
   movieName = $('.title').text()
   movieYear = $('.year').text()
   songName = $('')

     //movieData = "test"
   console.log(movieName)
   console.log(movieYear)
document.getElementById('search-form').addEventListener('submit', function (e) {
         e.preventDefault();
         search = document.getElementById('query').value;
        $.ajaxSetup({
           headers:{
             "accept": "application/json"
           }
         })

var year;
if(year == 'undefined'){
  url = 'http://www.omdbapi.com/?t='+search+'&y='+year+'&plot=short&r=json'
 }else{
   url = 'http://www.omdbapi.com/?t='+search+'&y=&plot=short&r=json'
 }

var Movie = Backbone.Collection.extend({
  url:url
  });

   var MovieList = Backbone.View.extend({
     el: '.movie-el',
     render: function(){
       var that = this;
       var movie = new Movie()
         movie.fetch({
           success: function(movies){
            var template = _.template($('#movieListtempplate').html(), {movies: movies.models}); //cant get this to render on the page. If I put in album instead of all allalbums it just puts{objectobject}on the screen] trying to figure it out}
           var movie = movies.models

console.log(movies.models)

          that.$el.html(template)
           }
       })
     }
   });

var movieList = new MovieList();
movieList.render();

}, false);



});
