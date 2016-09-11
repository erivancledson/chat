//abrir chat do cliente
function abrirChat() {
     //abrir a janela extra de chat, nome da janela chatWindow,   altura e largura
	window.open("/chat/chat", "chatWindow", "width=400,height=400");
}
//envia uma repeticao temporal que requisita o ajax para saber
//se tem chamado novo
function iniciarSuporte() {
    // a cada dois segundos realiza uma busca no chamado
	setTimeout(getChamado, 2000);
}
function getChamado() {
    //faz uma requisição ajax para o getchamado
	$.ajax({
		url:'/chat/ajax/getchamado',
                //retorno da minha requisição vai ser um json
		dataType:'json',
		success:function(json) {
                    //limpar a tabela de chamados
			resetChamados();
                          //verificar se tem mais do que 0
                          //ele mostra na tela de chamados
			if(json.chamados.length > 0) {
                            //percorrendo os chamados que foram iniciado e 
                            //colocando eles na tela
				for(var i in json.chamados) {
                                    // se for 1 ele mostra em andamento o atendimento
					if(json.chamados[i].status == '1') {
                                            //informação que vão ser adicionadad na tabela id, data inicio, nome
                                            //em atendimento 
						$('#areadechamados').append("<tr class='chamado' data-id='"+json.chamados[i].id+"'><td>"+json.chamados[i].data_inicio+"</td><td>"+json.chamados[i].nome+"</td><td>Em Atendimento</tr>");
					} else {
                                            // com o botão chamado
                                            // é zero botão abrir chamado                                                                                                                                                    evento para abrir o chamado
						$('#areadechamados').append("<tr class='chamado' data-id='"+json.chamados[i].id+"'><td>"+json.chamados[i].data_inicio+"</td><td>"+json.chamados[i].nome+"</td><td><button onclick='abrirChamado(this)'>Abrir Chamado</button></td></tr>");
					}
				}
			} 

			setTimeout(getChamado, 2000);
		},
		error:function(){
			setTimeout(getChamado, 2000);
		}
	});
}
//exluir todas as linhas da tabela menos a primeira
//todos que tiver um class= chamado da um remove
function resetChamados() {
	$('.chamado').remove();
}
function abrirChamado(obj) {
    // pega a classe chamada mais proxima e pega o atributo data id
	var id = $(obj).closest('.chamado').attr('data-id');
        //abrindo a janela do chamado
	window.open('/chat/chat?id='+id, 'chatWindow', 'width=400,height=400');
}
//para quando apertar enter a mensagem digitada do chat ir para cima no chat
function keyUpChat(obj, event) {
	if(event.keyCode == 13) { // Tecla Enter
            //pegar a mensagem que foi inscrita
		var msg = obj.value;
              //quando pegar a mensagem limpa o campo de chat  
		obj.value = '';
                  //pega a hora e os minutos
		var dt = new Date();
                //pega horas e minutos
		var hr = dt.getHours()+':'+dt.getMinutes();
                //pega o nome se for suporte aparece o nome suporte, nome da pessoa se for cliente
		var nome = $('.inputarea').attr('data-nome');

		//$('.chatarea').append('<div class="msgitem">'+hr+' <strong>'+nome+'</strong>: '+msg);
                //enviar a mensagem para  o servidor
		$.ajax({
			url:'/chat/ajax/sendmessage',
			type:'POST',
			data:{msg:msg}
		});
	}
}
//verifica se tem mensagem nova
function updateChat() {

	$.ajax({
		url:'/chat/ajax/getmessage',
                //transforma em json
		dataType:'json',
		success:function(json) {
                    
			if(json.mensagens.length > 0) {
				for(var i in json.mensagens) {
					var hr = json.mensagens[i].data_enviado;
					if(json.mensagens[i].origem == '0') {
						var nome = 'Suporte';
					} else {
						var nome = $('.inputarea').attr('data-nome');
					}
					var msg = json.mensagens[i].mensagem;
                                        //para ver se a menssagem foi enviada e enviando ela mesmo com hora e nome
					$('.chatarea').append('<div class="msgitem">'+hr+' <strong>'+nome+'</strong>: '+msg);
				}
                                //para quando digitar e a barra de rolagem aparecer exibir a ultima mensagem digitada pelo o usuario
                                //sem ta movimentando na a barra de rolagem
				$('.chatarea').scrollTop($('.chatarea')[0].scrollHeight);
			}
                         //repete de dois em dois segundos
			setTimeout(updateChat, 2000);
		},
		error:function() {
			setTimeout(updateChat, 2000);
		}
	});

}













