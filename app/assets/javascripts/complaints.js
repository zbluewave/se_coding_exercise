
$(document).ready(function() {
  $('button[type=\'submit\']').click(function(e) {
    e.preventDefault();
    $.post("/",function(data){

      });
    console.log('Search Form Submitted');
  });
});