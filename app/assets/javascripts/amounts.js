$(document).ready(function(){
	$('#new-amount-form').dialog({
	    autoOpen: false,
	    height: 200,
	    width: 300,
	    modal: true,
	    buttons: {
	      'Agregar Base': function() {
	          if($('#amount_money_amount').val() != ''){
	          	var motorcycle_id = $('#amount_motorcycle_id').val();	
	          	$.post('/motorcycles/'+motorcycle_id+'/amounts.json', $('#new_amount').serialize(), function(){
			    }).success(function(data){
		        	var id = data.id;
			        if($.cookie('admin')){
			        	var temp = "<tr class='item_list'><td width='16'><a rel='nofollow' data-remote='true' data-method='delete' data-confirm='¿Esta seguro que desea eliminar la base?' class='delete-amount' href='/motorcycles/"+motorcycle_id+"/amounts/"+id+"'><img width='16' height='16' src='/assets/delete.png' alt='Delete'></a></td><td width='16'><a id='edit-amount_"+id+"' class='edit-amount' href='#'><img width='16' height='16' src='/assets/edit.png' alt='Edit'></a></td><td width='240' id='money-amount-value_"+id+"'>"+data.money_amount+"</td><td width='180'>"+data.created_at+"</td></tr>";	
			        }else{
			        	var temp = "<tr class='item_list'><td width='16'><a id='edit-amount_"+id+"' class='edit-amount' href='#'><img width='16' height='16' src='/assets/edit.png' alt='Edit'></a></td><td width='240' id='money-amount-value_"+id+"'>"+data.money_amount+"</td><td width='180'>"+data.created_at+"</td></tr>";
			        }
			        
			        $('#amount_money_amount').val('');
			        $('#new-amount-form').dialog('close');
			        $('#amounts_list tbody').fadeIn(200, function(){
			        	$(this).append(temp);
			        });
			      }).error(function(data){
			      
			      });
	          }
	      }
	    },
	    close: function() {
	        $('#amount_money_value').val('');
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
