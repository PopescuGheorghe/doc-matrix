$( document ).ready(function() {
    console.log( "ready!" );
    $("form").submit(function() {
		alert("submit");
  		$(this).find("input[type=hidden].contenteditable").each(function() {
    	$input = $(this);
    	$input.val($input.siblings("div.contenteditable:first").html());
  		});
	});
});

