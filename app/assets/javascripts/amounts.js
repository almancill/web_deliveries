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
		        	new_amount(data, motorcycle_id);
			      }).error(function(data){
			      
			      });
	          }
	      }
	    },
	    close: function() {
	        $('#amount_money_value').val('');
	    }
  	});

	$('#edit-amount-form').dialog({
	    autoOpen: false,
	    height: 200,
	    width: 300,
	    modal: true,
	    buttons: {
	      'Editar Base': function() {
	          edit_amount();
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

	$(document).on('ajax:success', '#new_amount', function(event, data){
		var motorcycle_id = $('#amount_motorcycle_id').val();
		new_amount(data, motorcycle_id);
	});

	$(document).on('ajax:error', '#new_amount', function(){
		alert('error al eliminar');
	});
    
    $(document).on('click', '.edit-amount', function() { 
      var id = $(this).attr('id').split('_')[1];
      var temp ='#money-amount-value_'+id; 
      $('#edit_money_amount').val($(temp).html());
      $('#amount_id').val(id);
      $('#edit-amount-form').dialog('open');
    });

    $('#edit_amount').submit(function(){
      edit_amount();

      return false;
    });

});

function getCookie(c_name)
{
	var c_value = document.cookie;
	var c_start = c_value.indexOf(" " + c_name + "=");
	if (c_start == -1)
	  {
	  c_start = c_value.indexOf(c_name + "=");
	  }
	if (c_start == -1)
	  {
	  c_value = null;
	  }
	else
	  {
	  c_start = c_value.indexOf("=", c_start) + 1;
	  var c_end = c_value.indexOf(";", c_start);
	  if (c_end == -1)
	  {
	c_end = c_value.length;
	}
	c_value = unescape(c_value.substring(c_start,c_end));
	}
	return c_value;
}

function new_amount(data, motorcycle_id){
	var id = data.id;
    if(getCookie('admin')){
    	var date = new Date(data.created_at);
    	var temp = "<tr class='item_list'><td width='16'><a rel='nofollow' data-remote='true' data-method='delete' data-confirm='¿Esta seguro que desea eliminar la base?' class='delete-amount' href='/motorcycles/"+motorcycle_id+"/amounts/"+id+"'><img width='16' height='16' src='/assets/delete.png' alt='Delete'></a></td><td width='16'><a id='edit-amount_"+id+"' class='edit-amount' href='#'><img width='16' height='16' src='/assets/edit.png' alt='Edit'></a></td><td width='240' id='money-amount-value_"+id+"'>"+data.money_amount+"</td><td width='180'>"+date.toString('d-MM-yyyy hh:mm tt')+"</td></tr>";	
    }else{
    	var temp = "<tr class='item_list'><td width='16'><a id='edit-amount_"+id+"' class='edit-amount' href='#'><img width='16' height='16' src='/assets/edit.png' alt='Edit'></a></td><td width='240' id='money-amount-value_"+id+"'>"+data.money_amount+"</td><td width='180'>"+data.created_at+"</td></tr>";
    }
    $('#amount_money_amount').val('');
    $('#new-amount-form').dialog('close');
    $('#amounts_list tbody').fadeIn(200, function(){
    	$(this).prepend(temp);
    });
}

function edit_amount(){
  if ($('#edit_money_amount').val() != ''){
      var motorcycle_id = $('#edit_motorcycle_id').val();
      var amount_id = $('#amount_id').val();
      $.ajax({
        url: '/motorcycles/'+motorcycle_id+'/amounts/'+amount_id+'.json',
        data: $('#edit_amount').serialize(),
        type: 'PUT'
      }).success(function(data){
        $('#money-amount-value_'+amount_id).html(data.money_amount);
        $('#edit_money_amount').val('');
        $('#edit-amount-form').dialog('close');
      }).error(function(data){

      });
  }
}