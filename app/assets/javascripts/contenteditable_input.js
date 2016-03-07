$(document).ready(function(){
  $('#document-modal').on('show.bs.modal', function(){
    $('form').submit(function() {
      $(this).find("input[type=hidden].contenteditable").each(function() {
      $input = $(this);
    	$input.val($input.siblings("div.contenteditable:first").html());
  		});
  	});
  });
});

