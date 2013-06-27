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
					$('#customer_name').val(name); 
					if ($('#telephone_number').val() != ''){
						$('#customer_telephones_attributes_0_number').val($('#telephone_number').val());
					}
					$('#telephone_number').val('');
					$.get('/customer/'+id+'/addresses',function(data){
						var i, temp;
						temp = '';

						for(i=0;i<data.length;i++){
							temp += "<input type='radio' value='"+data[i].id+"' name='customer[addresses_attributes][0][id]' id='address_id_"+data[i].id+"' class='address'>"+data[i].value+"<br>";
						}
						$('#new_customer p:nth-child(5)').fadeIn('300', function(){
							$(this).html(temp);
						});
					});
				}else{
					$('#customer_name').val('');
					if ($('#telephone_number').val() != ''){
						$('#customer_telephones_attributes_0_number').val($('#telephone_number').val());
					}
					$('#new_customer p:nth-child(5)').fadeIn('300', function(){
						$(this).html('');
					});
				}
				$('#customer_id').val(id);
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
						temp += "<li class='ui-widget-content' name='delivery[customer][id]' id='customer_"+data[i].id+"'>"+data[i].name+"</li>"
					}
					temp += "<li class='ui-widget-content' name='delivery[customer][id]' id='customer_-1'>Nuevo Usuario</li></ol>";
					$(this).fadeIn('50',function(){
						$(this).html(temp);
					});
				})
			});
		}
	});
});