function imprimecredencial( element ) { 
	var id = $(element).attr('credential_id'); 
	var janela = window.open ("/credentials/"+id+"/print",'janela', "width=450, height=250, scrollbars = no"); 
}

