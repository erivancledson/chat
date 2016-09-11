
<!-- area de armazenar a mensagem-->
<div class="chatarea"></div>
<!-- pega o nome-->
<div class="inputarea" data-nome="<?php echo $nome; ?>">
    
	<input type="text" id="msg" onkeyup="keyUpChat(this, event)" />
</div>
<!-- enviar mensagem da caixa digitada para cima-->
<script type="text/javascript">updateChat();</script>