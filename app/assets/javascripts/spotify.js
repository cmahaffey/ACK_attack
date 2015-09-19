console.log('scripts')

/// Function to get song info from spotify API takes in three arguments song name, artist, and the songs_ID from internal API.
function songInfo(song, artist, song_id){
  $.ajaxSetup({
     headers:{
      "accept": "application/json"
    }
  });
//Backbone Colection Model to set up Url for AJAX call to spotify
  var Track = Backbone.Collection.extend({
    url: 'https://api.spotify.com/v1/search?q=track:'+song+'%20artist:'+artist+'&type=track&limit=1',
  });

//Backbone View model to render the songs on the page.
  var TrackList = Backbone.View.extend({
    el: '.spotify-el',
     render: function(){
       var that = this;
       that.$el.empty();
       var track = new Track();
         track.fetch({
           success: function(track){
             var template = _.template($('#albumListtempplate').html(), {tracks: track.models, song_id: song_id}); //cant get this to render on the page. If I put in album instead of all allalbums it just puts{objectobject}on the screen] trying to figure it out}
             var trackm = track.models
            that.$el.append(template);
           }
       })
     }
   });

 var trackList = new TrackList();
 trackList.render();
}
