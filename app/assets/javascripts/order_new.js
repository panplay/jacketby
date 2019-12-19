$(document).on(‘turbolinks:load’, function() {
  $('[name="btn"]:radio').change( function() {
    if($('[id=a]').prop('checked')){
      $('.text').fadeOut();
      $('.text01').fadeIn();
    } else if ($('[id=b]').prop('checked')) {
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
