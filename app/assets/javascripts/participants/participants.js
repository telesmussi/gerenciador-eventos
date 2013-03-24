
$(function(){
	$("#participant_main_phone").mask("(99) 9999-9999");
	$("#participant_secondary_phone").mask("(99) 9999-9999");
	$("#participant_cpf").mask("999.999.999-99");
	$('#participant_cpf').blur(function() { if ($(this).val()) { valida_cpf(); } });
    $("#participant_birth").mask("99/99/9999");
	$("#participant_address_attributes_cep").mask("99999-999");
	$('#find_cpf_button').click(function() { if ($("#participant_cpf").val()) $(this).submit; else return false; });
    $('#find_name_button').click(function() { if ($("#participant_name").val()) $(this).submit; else return false; });
});

var primary = false;
var secondary = false;

function nono_digito_primary() {
	if (primary) {
		$("#participant_main_phone").unmask("(99) 99999-9999");
		$("#participant_main_phone").mask("(99) 9999-9999");
		primary = false;
	} else {
		$("#participant_main_phone").unmask("(99) 9999-9999");
		$("#participant_main_phone").mask("(99) 99999-9999");
		primary = true;
	}
}
function nono_digito_secondary() {
	if (secondary) {
		$("#participant_secondary_phone").unmask("(99) 99999-9999");
		$("#participant_secondary_phone").mask("(99) 9999-9999");
		secondary = false;
	} else {
		$("#participant_secondary_phone").unmask("(99) 9999-9999");
		$("#participant_secondary_phone").mask("(99) 99999-9999");
		secondary = true;
	}
}

function valida_cpf() {
        CPF = $("#participant_cpf").val();
        if(!CPF){ return false;}
        erro  = new String;
        cpfv  = CPF;
        if(cpfv.length == 14 || cpfv.length == 11){
            cpfv = cpfv.replace('.', '');
            cpfv = cpfv.replace('.', '');
            cpfv = cpfv.replace('-', '');
  
            var nonNumbers = /\D/;
    
            if(nonNumbers.test(cpfv)){
                erro = "A verificacao de CPF suporta apenas números!";
            }else{
                if (cpfv == "00000000000" ||
                    cpfv == "11111111111" ||
                    cpfv == "22222222222" ||
                    cpfv == "33333333333" ||
                    cpfv == "44444444444" ||
                    cpfv == "55555555555" ||
                    cpfv == "66666666666" ||
                    cpfv == "77777777777" ||
                    cpfv == "88888888888" ||
                    cpfv == "99999999999") {
                            
                    erro = "Número de CPF inválido!"
                }
                var a = [];
                var b = new Number;
                var c = 11;
  
                for(i=0; i<11; i++){
                    a[i] = cpfv.charAt(i);
                    if (i < 9) b += (a[i] * --c);
                }
                if((x = b % 11) < 2){
                    a[9] = 0
                }else{
                    a[9] = 11-x
                }
                b = 0;
                c = 11;
                for (y=0; y<10; y++) b += (a[y] * c--);
    
                if((x = b % 11) < 2){
                    a[10] = 0;
                }else{
                    a[10] = 11-x;
                }
                if((cpfv.charAt(9) != a[9]) || (cpfv.charAt(10) != a[10])){
                    erro = "Número de CPF inválido.";
                }
            }
        }else{
            if(cpfv.length == 0){
                return false;
            }else{
                erro = "Número de CPF inválido.";
            }
        }
        if (erro.length > 0){
            $('#participant_cpf').val('');
            alert(erro);
            return false;
        }
		return true;
}