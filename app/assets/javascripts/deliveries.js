$(document).ready(function(){
	$('#new-delivery-button').click(function(){
		window.location = '/deliveries/new';
	});

	$('#selectable-customers').selectable();
});