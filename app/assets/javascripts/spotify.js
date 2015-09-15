
console.log('spotify scripts')
 $( document ).ready(function() {
   document.getElementById('search-form').addEventListener('submit', function (e) {
         e.preventDefault();
         search = document.getElementById('query').value + " motion picture soundtrack";

    $.ajaxSetup({
          headers:{
            "accept": "application/json"
                 }
        });
  var Album = Backbone.Collection.extend({
    url: 'https://api.spotify.com/v1/search?q='+search+'&type=album'

  });

   var AlbumList = Backbone.View.extend({
     el: '.spotify-el',
     render: function(){
       var that = this;
       var album = new Album()
         album.fetch({
           success: function(album){
            var template = _.template($('#albumListtempplate').html(), {albums: album.models}); //cant get this to render on the page. If I put in album instead of all allalbums it just puts{objectobject}on the screen] trying to figure it out}
           var albums = album.models
           var test = albums[0]
           console.log(test)
          that.$el.html(template)
           }
       })
     }
   });


var albumList = new AlbumList();
albumList.render();

}, false);
});
