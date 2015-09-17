console.log('scripts_omdb')

function movieInfo(search, year){
  $.ajaxSetup({
             headers:{
               "accept": "application/json"
             }
           })
 //console.log(year)
  if(year != 'undefined'){
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
