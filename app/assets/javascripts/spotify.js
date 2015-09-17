console.log('scripts')


  function songInfo(song, artist, song_id){

  $.ajaxSetup({
     headers:{
      "accept": "application/json"
           }
  });

  var Track = Backbone.Collection.extend({
    url: 'https://api.spotify.com/v1/search?q=track:'+song+'%20artist:'+artist+'&type=track&limit=1',
  });
   var TrackList = Backbone.View.extend({
     el: '.spotify-el',
     render: function(){
       var that = this;
       that.$el.empty()
       var track = new Track()
         track.fetch({
           success: function(track){
          //  that.$el.empty();
           var template = _.template($('#albumListtempplate').html(), {tracks: track.models, song: $song_id}); //cant get this to render on the page. If I put in album instead of all allalbums it just puts{objectobject}on the screen] trying to figure it out}
           var trackm = track.models
           //console.log(song_id)
          that.$el.append(template)
          var $song_id = $('#song_id')
          //$song_id.val(song_id)
           }
       })
     }
   });

var trackList = new TrackList();
trackList.render();
}
