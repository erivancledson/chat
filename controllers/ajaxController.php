<?php
class ajaxController extends controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $dados = array();


    }

    public function getchamado() {
    	$dados = array();
    	//objeto chamados
    	$c = new Chamados();
    	$dados['chamados'] = $c->getChamados();
        //codifica o array para json
    	echo json_encode($dados);
    }

    public function sendmessage() {
        //receber a mensagem que foi criada
        if(isset($_POST['msg']) && !empty($_POST['msg'])) {
            $msg = addslashes($_POST['msg']);
            $idchamado = $_SESSION['chatwindow'];
            // se area for igual a suporte é 0, se for cliente a origem é 1
            if($_SESSION['area'] == 'suporte') {
                $origem = 0;
            } else {
                $origem = 1;
            }

            $m = new Mensagens();
            //envia id chamado, origem e msg
            $m->sendMessage($idchamado, $origem, $msg);
        }
    }
         
    public function getmessage() {
        $dados = array();

        $m = new Mensagens();
        $c = new Chamados();

        $idchamado = $_SESSION['chatwindow'];
        //saber se ultima mensagem foi do suporte ou do usuario
        $area = $_SESSION['area'];
        $lastmsg = $c->getLastMsg($idchamado, $area);
         //retorna as mensagens dos chat         $lastmsg = é a ultima mensagem que não foi lida
        $dados['mensagens'] = $m->getMessage($idchamado, $lastmsg);
         //mensagem retorna para o json
        echo json_encode($dados);
    }

}