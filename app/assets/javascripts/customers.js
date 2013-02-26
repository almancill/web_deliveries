$(document).ready(function(){
	$("#new-telephone-form").dialog({
    autoOpen: false,
    height: 200,
    width: 280,
    modal: true,
    buttons: {
      'Agregar Teléfono': function() {
          if ($('#telephone_number').val() != ''){
              $('#telephone_number').val('');  
              $('#telephone_number').removeClass('error');
              $('#telephone_number').addClass('valid');
              $(this).dialog("close");
          }
          
      }
    },
    close: function() {
        $('#telephone_number').val('');
        $('#telephone_number').removeClass('error');
        $('#telephone_number').addClass('valid');
    }
  });
  


  $('#add-telephone-button').click(function() {
        $( '#new-telephone-form' ).dialog('open');
  });
  
  $('#new_telephone').submit(function(){
    if ($('#telephone_number').val() != ''){
      $('#telephone_number').val('');
      $('#telephone_number').removeClass('error');
      $('#telephone_number').addClass('valid');
      $('new-telephone-form').dialog('close');
    }

    return false;
  });

  $('#new_telephone').validate();
});
