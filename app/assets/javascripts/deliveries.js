$(document).ready(function(){
	$('#new-delivery-button').click(function(){
		window.location = '/deliveries/new';
	});

	$('#selectable-customers').selectable({
		stop: function(){
			$( ".ui-selected", this ).each(function() {
				var id = $(this).attr('id').split('_')[1];
				var name = $(this).html();
				if(id != -1){
					$('#delivery_customer_name').val(name); 
					if ($('#telephone_number').val() != ''){
						$('#delivery_telephone_number').val($('#telephone_number').val());
					}
					$('#telephone_number').val('');
					$.get('/customer/'+id+'/addresses',function(data){
						var i, temp;
						temp = '';

						for(i=0;i<data.length;i++){
							temp += "<input type='radio' value='"+data[i].id+"' name='delivery[address][id]' id='address_id_"+data[i].id+"' class='address'>"+data[i].value+"<br>";
						}
						$('#deliveries_create p:nth-child(5)').fadeIn('300', function(){
							$(this).html(temp);
						});
					});
				}else{
					$('#delivery_customer_name').val('');
					if ($('#telephone_number').val() != ''){
						$('#delivery_telephone_number').val($('#telephone_number').val());
					}
					$('#deliveries_create p:nth-child(5)').fadeIn('300', function(){
						$(this).html('');
					});
				}
				$('#delivery_customer_id').val(id);
			});
		}
	});
	$('.search-button').click(function(){
		alert('Le dio click!!!');
	});
	$(document).on('keypress', '#telephone_number', function(evt){
		if(evt.which == 13){
			$.get('/deliveries/search/'+$(this).val(), function(data){
				var i, temp;
				temp = '';
				$('#selectable-customers').fadeOut('500', function(){
					$(this).html('');
					for(i=0;i<data.length;i++){
						temp += "<li class='ui-widget-content ui-selectee' name='delivery[customer][id]' id='customer_"+data[i].id+"'>"+data[i].name+"</li>"
					}
					temp += "<li class='ui-widget-content ui-selectee' name='delivery[customer][id]' id='customer_-1'>Nuevo Usuario</li></ol>";
					$(this).fadeIn('50',function(){
						$(this).html(temp);
					});
				})
			});
		}
	});
});