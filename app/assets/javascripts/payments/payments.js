$(function(){
	$("#adicionais").mask("9?99999");
	$("#payment_amount").val(0);

	var adicionais = 0;

	$("#adicionais").blur(
		function() {
			var novoValor = $(this).val() == '' ? 0 : parseInt($(this).val());
			if (novoValor != adicionais) {
				$("#payment_amount").val( 
					parseInt($("#payment_amount").val()) - adicionais + novoValor
				)
			}
			adicionais = novoValor;
		}
	);

	$(":checkbox").change( 
		function() {
			if ($(this).attr('checked') == 'checked') {
				$("#payment_amount").val( 
					parseInt($("#payment_amount").val()) + parseInt($(this).attr('valor'))
				)				
			} 
			else {
				$("#payment_amount").val( 
					parseInt($("#payment_amount").val()) - parseInt($(this).attr('valor'))
				)
			}
		}
	);
});



