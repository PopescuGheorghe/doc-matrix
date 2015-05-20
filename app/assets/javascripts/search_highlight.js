$(document).ready(function(){
        $('#search').on('keyup', function(){
            console.log($(this).val());
                $('#document_content').unhighlight();
                $('#document_content').highlight($(this).val());

        });
    });