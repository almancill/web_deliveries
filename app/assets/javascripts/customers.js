$(document).ready(function(){
	$('#new-telephone-form').dialog({
    autoOpen: false,
    height: 200,
    width: 300,
    modal: true,
    buttons: {
      'Agregar Teléfono': function() {
          if ($('#telephone_number').val() != ''){
              $.post('/telephones', $('#new_telephone').serialize(), function(){
              }).success(function(){
                $('#telephone_number').val('');
                $('#new-telephone-form').dialog('close');
                //$('#telephones').append("<p><p>")
              }).error(function(){});
          }
          
      }
    },
    close: function() {
        $('#telephone_number').val('');
    }
  });
  
  $('#add-telephone-button').click(function() {
        $( '#new-telephone-form' ).dialog('open');
  });
  
  $('#new_telephone').submit(function(){
    if ($('#telephone_number').val() != ''){
      $.post('/telephones', $('#new_telephone').serialize(), function(){
      }).success(function(){
        $('#telephone_number').val('');
        $('#new-telephone-form').dialog('close');
      }).error(function(){});
    }

    return false;
  });

  //$('#new_telephone').validate();
});
