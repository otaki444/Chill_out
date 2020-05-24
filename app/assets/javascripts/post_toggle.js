$(document).on('turbolinks:load', function() {
	$(function(){
		$('#post_new').click(function(){
			$('#post_form').fadeIn();
		});

		$('#close').click(function() {
			$('#post_form').fadeOut();
		});
	});
});