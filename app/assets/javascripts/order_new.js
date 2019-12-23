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
  var nowchecked = $('input[name=btn]:checked').val();
  $('input[name=btn]').click(function(){
    if($(this).val() == nowchecked) {
      $(this).prop('checked', false);
      nowchecked = false;
    } else  {
      nowchecked = $(this).val();
    }
  });
});