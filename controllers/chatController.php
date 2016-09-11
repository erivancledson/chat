<?php
class chatController extends controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $dados = array('nome'=>'');

        $c = new Chamados();
        //id chat
        if(isset($_GET['id']) && !empty($_GET['id'])) {
        	$id = addslashes($_GET['id']);
                //atualiza o status para em atendimento coloca o status para 1
        	$c->updateStatus($id, '1');
              //abri uma sessão do usuario no chat
            $_SESSION['chatwindow'] = $id;
        }
        //informações para o chat
        elseif(isset($_POST['nome']) && !empty($_POST['nome'])) {
            //pega o nome
        	$nome = addslashes($_POST['nome']);
                //o ip dela 
        	$ip = $_SERVER['REMOTE_ADDR'];
                //data de inicio do chat
        	$data_inicio = date('H:i:s');
                //inciando o chamado
        	$_SESSION['chatwindow'] = $c->addChamado($ip, $nome, $data_inicio);
        }
               //carrega um novo chamado, newchamado aonde o usuario informa o nome dele e clica para iniciar o chat
        if(!isset($_SESSION['chatwindow']) || empty($_SESSION['chatwindow'])) {
        	$this->loadTemplate('newchamado', $dados);
        	exit;
        }
          //area do usuario, pegar as chamadas
        $idchamado = $_SESSION['chatwindow'];
        $chamado = $c->getChamado($idchamado);
        //pega o nome do cliente
        $dados['nome'] = $chamado['nome'];
           //chama o view chat
        $this->loadTemplate('chat', $dados);
    }

}