$(document).ready(function(){
	$('#date').datepicker({
        dateFormat: "dd-mm-yy",
        firstDay: 1,
        dayNamesMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
        dayNamesShort: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
        monthNames:
            ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio",
            "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
        monthNamesShort:
            ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul",
            "Ago", "Sep", "Oct", "Nov", "Dic"]
    });
    $('.report').click(function(e){
        e.preventDefault();  //stop the browser from following
        window.location.href = '/reports/'+$('#date').val()+'.xls';
        //$.get('/reports/'+$('#date').val()+'.xls');
        //alert($('#date').val());
    });
});
