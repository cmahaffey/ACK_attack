console.log('AJAX all the time')

$( document ).ready(function() {

  document.getElementById('search-form').addEventListener('submit', function (e) {
        e.preventDefault();
        search = document.getElementById('query').val();

   $.ajaxSetup({
         headers:{
           "accept": "application/json"
                }

 var Album = Backbone.Collection.extend({
   url: '/json'
   callback: function(){
     var movie_info={
       name:
     }
   }
 });

 Album.fetch();
}
