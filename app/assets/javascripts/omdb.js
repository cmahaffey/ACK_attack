console.log('scripts')
 $( document ).ready(function() {
   document.getElementById('search-form').addEventListener('submit', function (e) {
         e.preventDefault();
         search = document.getElementById('query').value;

         $.ajaxSetup({
           headers:{
             "accept": "application/json"
           }
         })



  var Movie = Backbone.Collection.extend({
    url: 'http://www.omdbapi.com/?t='+search+'&y=&plot=short&r=json'
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
           //$.each(allalbums, function( index, value ) {
              //   console.log(value["name"])
                //     });
console.log(movies.models)
           //console.log(allalbums)//prints out in the console correctly.
          that.$el.html(template)
           }
       })
     }
   });


var movieList = new MovieList();
movieList.render();

}, false);



});
