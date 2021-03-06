$(document).ready(function(){
	$('#telephones_table tbody tr:last-child').remove();
  $('#addresses_table tbody tr:last-child').remove();

  $(document).on('click', '.edit-telephone', function() { 
    var id = $(this).attr('id').split('_')[1];
    var temp ='#number_'+id; 
    $('#edit_telephone_number').val($(temp).html());
    $('#edit_telephone_id').val(id);
    $('#edit-telephone-form' ).dialog('open');
  });

  $(document).on('click', '.edit-address', function() { 
    var id = $(this).attr('id').split('_')[1];
    var temp ='#value_'+id; 
    $('#edit_address_value').val($(temp+" a").html());
    $('#edit_address_id').val(id);
    $('#edit-address-form' ).dialog('open');
  });

  $(document).on('ajax:success', '.delete-telephone', function(data){
    $(this).closest('tr').fadeOut(100, function(){
      $(this).closest('tr').remove()
    })
  });

  $(document).on('ajax:error', '.delete-telephone', function(){
    alert('error al eliminar');
  });

  $('#new-telephone-form').dialog({
    autoOpen: false,
    height: 200,
    width: 300,
    modal: true,
    buttons: {
      'Agregar Teléfono': function() {
          new_telephone();
      }
    },
    close: function() {
        $('#telephone_number').val('');
    }
  });

  $('#edit-telephone-form').dialog({
    autoOpen: false,
    height: 200,
    width: 300,
    modal: true,
    buttons: {
      'Editar Teléfono': function() {
        edit_telephone();        
      }
    },
    close: function() {
        $('#edit_telephone_id').val('');
        $('#edit_telephone_number').val('');
    }
  });

  $('#new-address-form').dialog({
    autoOpen: false,
    height: 200,
    width: 300,
    modal: true,
    buttons: {
      'Agregar Dirección': function() {
          new_address();
      }
    },
    close: function() {
        $('#address_value').val('');
    }
  });

  $('#edit-address-form').dialog({
    autoOpen: false,
    height: 200,
    width: 300,
    modal: true,
    buttons: {
      'Editar Dirección': function() {
          edit_address();
      }
    },
    close: function() {
        $('#edit_address_value').val('');
    }
  });  

  $('#add-telephone-button').click(function() {
        $( '#new-telephone-form' ).dialog('open');
  });

  $('#add-address-button').click(function() {
        $( '#new-address-form' ).dialog('open');
  });
  
  $('#new_telephone').submit(function(){
    new_telephone();

    return false;
  });

  $('#edit_telephone').submit(function(){
    edit_telephone();

    return false;
  });

  $('#new_address').submit(function(){
    new_address();

    return false;
  });
  
  $('#edit_address').submit(function(){
    edit_address();

    return false;
  });
});
function new_address(){
  if ($('#address_value').val() != ''){
      $.post('/addresses.json', $('#new_address').serialize(), function(){
      }).success(function(data){
        var id = data.id;
        var temp = "<tr class='item_list'><td width='16'><a id='edit-address_"+data.id+"' class='edit-address' href='#''><img width='16' height='16' src='/assets/edit_address.png' alt='Edit_address'></a></td><td width='240' id='value_"+data.id+"'><a href='/customers/"+data.customer_id+"/addresses/"+data.id+"'>"+data.value+"</a></td></tr>"

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
}

function edit_address(){
  if ($('#edit_address_value').val() != ''){
      var id = $('#edit_address_id').val();
      $.ajax({
        url: '/addresses/'+id+'.json',
        data: $('#edit_address').serialize(),
        type: 'PUT'
      }).success(function(data){
        var temp = "<a href='/customers/"+data.customer_id+"/addresses/"+data.id+"'>"+data.value+"</a>"
        $('#value_'+data.id).html(temp);
        $('#edit_address_value').val('');
        $('#edit_address_id').val('');
        $('#edit-address-form').dialog('close');
      }).error(function(data){

      });
  }
}

function new_telephone(){
  if ($('#telephone_number').val() != ''){
      $.post('/telephones.json', $('#new_telephone').serialize(), function(){
      }).success(function(data){
        var id = data.id;
        var temp = "<tr class='item_list'><td width='16'><a id='edit_"+data.id+"' class='edit-telephone' href='#'><img width='16' height='16' src='/assets/edit.png' alt='Edit'></a></td><td width='16'><a rel='nofollow' data-remote='true' data-method='delete' data-confirm='¿Esta seguro que desea eliminar el número?' class='delete-telephone' href='/telephones/"+data.id+"'><img width='16' height='16' src='/assets/delete.png' alt='Delete'></a></td><td width='240' id='number_"+data.id+"'>"+data.number+"</td></tr>" 

        $('#telephone_number').val('');
        $('#new-telephone-form').dialog('close');
        if($('#telephones_table tbody tr:last-child').length > 0){
          $('#telephones_table tbody tr:last-child').fadeIn(200, function(){
            $(this).after(temp);
          });
        }else{
          $('#telephones_table tbody').fadeIn(200, function(){
            $(this).after(temp);
          });
        }

        
      }).error(function(data){
      
      });
  }
}

function edit_telephone(){
  if ($('#edit_telephone_number').val() != ''){
      var id = $('#edit_telephone_id').val();
      $.ajax({
        url: '/telephones/'+id+'.json',
        data: $('#edit_telephone').serialize(),
        type: 'PUT'
      }).success(function(data){
        $('#number_'+data.id).html(data.number);
        $('#edit_telephone_number').val('');
        $('#edit_telephone_id').val('');
        $('#edit-telephone-form').dialog('close');
      }).error(function(data){

      });
  }
}