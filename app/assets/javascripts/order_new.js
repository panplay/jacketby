$(document).on('turbolinks:load', function() {
$(function() {
  $('[name="btn"]:radio').change( function() {
    if($('[id=a]').prop('checked')){
      $('[id=a]').prop('disabled',false);
      $('[id=b]').prop('disabled',true);
      $('.text').fadeOut();
      $('.text01').fadeIn();
    } else if ($('[id=b]').prop('checked')) {
      $('[id=b]').prop('disabled',false);
      $('[id=a]').prop('disabled',true);
      $('.text').fadeOut();
      $('.text02').fadeIn();
    } 
  });
});

   