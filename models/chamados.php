<?php
class Chamados extends model {
	
	public function getChamados() {
                //array de resposta 
		$array = array();
                //chamados 0 não atendidos, 1 que está sendo atendido
                //2 ja foi atendido
               
		$sql = "SELECT * FROM chamados WHERE status IN (0,1)";
		$sql = $this->db->query($sql);
                
		if($sql->rowCount() > 0) {
			$array = $sql->fetchAll();
		}

		return $array;
	}
        //pega o chmado
	public function getChamado($id) {
		$array = array();

		if(!empty($id)) {
			$sql = "SELECT * FROM chamados WHERE id = '$id'";
			$sql = $this->db->query($sql);

			if($sql->rowCount() > 0) {
				$array = $sql->fetch();
			}
		}

		return $array;
	}
              //atualiza chamado
	public function updateStatus($id, $status) {
            //id preenchido e status preenchido
		if(!empty($id) && !empty($status)) {
			$sql = "UPDATE chamados SET status = '$status' WHERE id = '$id'";
			$this->db->query($sql);
		}
	}
            //chamados
	public function addChamado($ip, $nome, $data_inicio) {
            //inicialmente id 0 que vai ser o status não atendido
		$id = 0;

    	$sql = "INSERT INTO chamados SET ip = '$ip', nome = '$nome', data_inicio = '$data_inicio', status = '0'";
    	$sql = $this->db->query($sql);

    	$id = $this->db->lastInsertId();

    	return $id;
	}
        //ultima mensagem no chat
	public function getLastMsg($id, $area) {
		$dt = '';
		if(!empty($id) && !empty($area)) {
                        
			$sql = "SELECT data_last_".$area." as dt FROM chamados WHERE id = '$id'";
			$sql = $this->db->query($sql);

			if($sql->rowCount() > 0) {
				$sql = $sql->fetch();
				$dt = $sql['dt'];
			}

		}

		return $dt;
	}
           
	public function updateLastMsg($id, $area) {
		if(!empty($id) && !empty($area)) {
                    //atualiza a tabela chamados com o tempo atual
			$sql = "UPDATE chamados SET data_last_".$area." = NOW() WHERE id = '$id'";
			$this->db->query($sql);
		}
	}

}