console.log('scripts')
 $( document ).ready(function() {

   document.getElementById('search-form').addEventListener('submit', function (e) {
         e.preventDefault();
        song = ['in da club', 'fight song', 'in da club']
        artist = ['50 cent', 'rachel platten', '50 cent']

  $.ajaxSetup({
     headers:{
      "accept": "application/json"
           }
  });

for(i=0; i<song.length; i++){
  var Track = Backbone.Collection.extend({
    url: 'https://api.spotify.com/v1/search?q=track:'+song[i]+'%20artist:'+artist[i]+'&type=track&limit=1',
  });
   var TrackList = Backbone.View.extend({
     el: '.spotify-el',
     render: function(){
       var that = this;
       var track = new Track()
         track.fetch({
           success: function(track){
           var template = _.template($('#albumListtempplate').html(), {tracks: track.models}); //cant get this to render on the page. If I put in album instead of all allalbums it just puts{objectobject}on the screen] trying to figure it out}
           var trackm = track.models
           console.log(trackm)
          that.$el.append(template)
           }
       })
     }
   });

var trackList = new TrackList();
trackList.render();
}
}, false);

});
