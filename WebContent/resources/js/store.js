$(function(){
    $('.nav_downside a').hover(function(){
        $(this).prev().addClass('expended');
    }, function(){
        $(this).prev().removeClass('expended');
    });
})

$(document).ready(function() {
    $('#summernote').summernote({
        minHeight : 400,
        width : 900,
        lang: "ko-KR",
        callbacks: {
			onImageUpload : function(files){
				console.log(files);
				sendFile(files[0],this);
			}
		},
        toolbar: [
            // [groupName, [list of button]]
            ['style', ['bold', 'italic', 'underline']],
            ['fontsize', ['fontsize']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['insert', ['picture']]
          ],
          popover: {
            image: [
              ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
              ['float', ['floatLeft', 'floatRight', 'floatNone']],
              ['remove', ['removeMedia']]
            ]
          }
    });
});





// getter
// $('#summernote').summernote('code');
// setter
// $('#summernote').summernote('code', html);