$( document ).ready(function() {
    console.log( "ready!" );
    $("form").submit(function() {
		console.log("submit");
  		$(this).find("input[type=hidden].contenteditable").each(function() {
    	$input = $(this);
    	$input.val($input.siblings("div.contenteditable:first").html());
  		});
	});
});

