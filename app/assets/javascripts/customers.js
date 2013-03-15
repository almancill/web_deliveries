$(document).ready(function(){
	$(document).on('click', '.edit', function() { 
    var id = $(this).attr('id').split('_')[1];
    var temp ='#number_'+id; 
    $('#edit_telephone_number').val($(temp).html());
    $('#edit_telephone_id').val(id);
    $('#edit-telephone-form' ).dialog('open');
  });

  $(document).on('click', '.delete', function() { 
    alert( $(this).attr('id').split('_')[1]);
  });  

  $('#edit-telephone-form').dialog({
    autoOpen: false,
    height: 200,
    width: 300,
    modal: true,
    buttons: {
      'Editar Teléfono': function() {
          if ($('#edit_telephone_number').val() != ''){
              var id = $('#edit_telephone_id').val();
              $.ajax({
                url: '/telephones/'+id+'.json',
                data: $('#edit_telephone').serialize(),
                type: 'PUT'
              }).success(function(data){

              }).error(function(data){

              });
              //$.put('/telephones.json', $('#edit_telephone').serialize(), function(){
              //}).success(function(data){
                //var id = data.id;
                //var temp = "<tr class='item_list'>";
                //var temp1 =  "<td width='16'><a href='#' id='edit_"+id+"' class='edit'><img width='16' height='16' src='/assets/edit.png' alt='Edit'></a></td><td width='16'>";
                //var temp2 = "<a href='#' id='delete_"+id +"'' class='delete'><img width='16' height='16' src='/assets/delete.png' alt='Delete'></a></td><td width='240' id='number_"+id+"'>"+$('#telephone_number').val()+"</td></tr>";
                //$('#telephone_number').val('');
                //$('#new-telephone-form').dialog('close');
                //alert(data.id);
                //$('#telephones_table tbody tr:last-child').after(temp+temp1+temp2).fadein();
                //$('#telephones').append("<p><p>")
              //}).error(function(data){
                //$('#edit_telephone_number').val('');
                //$('#edit_telephone_id').val('');
              //});
          }
      }
    },
    close: function() {
        $('#edit_telephone_number').val('');
    }
  });

  $('#new-telephone-form').dialog({
    autoOpen: false,
    height: 200,
    width: 300,
    modal: true,
    buttons: {
      'Agregar Teléfono': function() {
          if ($('#telephone_number').val() != ''){
              $.post('/telephones.json', $('#new_telephone').serialize(), function(){
              }).success(function(data){
                var id = data.id;
                var temp = "<tr class='item_list'>";
                var temp1 =  "<td width='16'><a href='#' id='edit_"+id+"' class='edit'><img width='16' height='16' src='/assets/edit.png' alt='Edit'></a></td><td width='16'>";
                var temp2 = "<a href='#' id='delete_"+id +"'' class='delete'><img width='16' height='16' src='/assets/delete.png' alt='Delete'></a></td><td width='240' id='number_"+id+"'>"+$('#telephone_number').val()+"</td></tr>";
                $('#telephone_number').val('');
                $('#new-telephone-form').dialog('close');
                //alert(data.id);
                $('#telephones_table tbody tr:last-child').after(temp+temp1+temp2).fadein();
                //$('#telephones').append("<p><p>")
              }).error(function(data){
                var x = '';
                alert(data.length);
              });
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
