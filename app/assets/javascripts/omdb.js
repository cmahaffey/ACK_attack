console.log('scripts_omdb')

/// Function to get movie info from OMDB API takes in two arguments movie name and the year it was released.
function movieInfo(movie, year){
  $.ajaxSetup({
    headers:{
      "accept": "application/json"
      }
  })


// Sometimes the movies in the datbase dont have years set up an if statement to handle both situations for the API call
  if(year != 'undefined'){
    url = 'http://www.omdbapi.com/?t='+movie+'&y='+year+'&plot=short&r=json'
    }else{
     url = 'http://www.omdbapi.com/?t='+movie+'&y=&plot=short&r=json'
   }

//Backbone Colection Model to set up Url for AJAX call
  var Movie = Backbone.Collection.extend({
    url:url
  });

//Backbone View model to render the movies on the page.
  var MovieList = Backbone.View.extend({
   el: '.movie-el',
    render: function(){
      var that = this;
      var movie = new Movie()
      that.$el.empty()
      movie.fetch({
        success: function(movies){
          var template = _.template($('#movieListtempplate').html(), {movies: movies.models}); //cant get this to render on the page. If I put in album instead of all allalbums it just puts{objectobject}on the screen] trying to figure it out}
          var movie = movies.models
          that.$el.html(template)
        }
      })
    }
  });

  var movieList = new MovieList();
  movieList.render();
}
