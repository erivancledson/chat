<?php
class Mensagens extends model {

	public function sendMessage($idchamado, $origem, $msg) {
            //verifica se os campos de id chamado e mensagem foram respondidos
		if(!empty($idchamado) && !empty($msg)) {
                    //insrindo  a mensagem no banco
			$sql = "INSERT INTO mensagens SET id_chamado = '$idchamado', mensagem = '$msg', origem = '$origem', data_enviado = NOW()";
			$this->db->query($sql);
		}
	}

	public function getMessage($idchamado, $lastmsg) {
		$array = array();

		$sql = "SELECT * FROM mensagens WHERE id_chamado = '$idchamado' AND data_enviado > '$lastmsg'";
		$sql = $this->db->query($sql);
                   //se tive mensagem preenche no array
		if($sql->rowCount() > 0) {
			$array = $sql->fetchAll();

			foreach($array as $chave => $valor) {
				$array[$chave]['data_enviado'] = date('H:i', strtotime($valor['data_enviado']));
			}
		}
                //atualizar a data
		$c = new Chamados();
		$area = $_SESSION['area'];
		$c->updateLastMsg($idchamado, $area);

		return $array;
	}

}