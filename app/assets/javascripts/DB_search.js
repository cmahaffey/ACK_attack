console.log('AJAX all the time')

$( document ).ready(function() {

  document.getElementById('search-form').addEventListener('submit', function (e) {
        e.preventDefault();
        search = document.getElementById('query').val();

   $.ajaxSetup({
         headers:{
           "accept": "application/json"
         });
  $.ajax({
    url:'/json'
  }).done(function(){
    console.log('this works');
  })



 Album.fetch();
}
