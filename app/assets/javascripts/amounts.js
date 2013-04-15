$(document).ready(function(){
	$('#new-amount-form').dialog({
	    autoOpen: false,
	    height: 200,
	    width: 300,
	    modal: true,
	    buttons: {
	      'Agregar Base': function() {
	          /*new_address();*/
	          if($('#amount_money_amount').val() != ''){
	          	var motorcycle_id = $('#amount_motorcycle_id').val();	
	          	$.post('/motorcycles/'+ motorcycle_id+ '/amounts.json', $('#new_amount').serialize(), function(){
			    }).success(function(data){
		        	var id = data.id;
			        if($.cookie('admin')){
			        	var temp = "<tr class='item_list'><td width='16'><a id='edit-address_"+data.id+"' class='edit-address' href='#''><img width='16' height='16' src='/assets/edit_address.png' alt='Edit_address'></a></td><td width='240' id='value_"+data.id+"'><a href='/customers/"+data.customer_id+"/addresses/"+data.id+"'>"+data.value+"</a></td></tr>";	
			        }else{
			        	var temp = "";
			        }
			        

			        $('#address_value').val('');
			        $('#new-address-form').dialog('close');
			        if($('#addresses_table tbody tr:last-child').length > 0){
			          $('#addresses_table tbody tr:last-child').fadeIn(200, function(){
			            $(this).after(temp);
			          });
			        }else{
			          $('#addresses_table tbody').fadeIn(200, function(){
			            $(this).after(temp);
			          });
			        }
			      }).error(function(data){
			      
			      });
	          }
	          //alert('Cualquier cosa');
	      }
	    },
	    close: function() {
	        /*$('#address_value').val('');*/
	    }
  	});

  	$(document).on('ajax:success', '.delete-amount', function(data){
    	$(this).closest('tr').fadeOut(100, function(){
      		$(this).closest('tr').remove();
    	});
  	});

	$(document).on('ajax:error', '.delete-amount', function(){
	  alert('error al eliminar');
	});	

  	$('#new-amount-button').click(function(){
		$( '#new-amount-form' ).dialog('open');	
	});

	$(document).on('ajax:success', '#new-amount-form', function(data){
		$('#new-amount-form' ).dialog('close');    
  	});

  $(document).on('ajax:error', '#new-amount-form', function(){
    alert('error al eliminar');
  });
});
