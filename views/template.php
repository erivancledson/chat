<html>
    <head>
        <title>CHAT</title>
        <link rel="stylesheet" href="assets/css/template.css" />
        <script type="text/javascript" src="assets/js/jquery-3.0.0.min.js"></script>
        <script type="text/javascript" src="assets/js/script.js"></script>
    </head>
    <body>
        <!-- ficar uma cor para saber se é usuario comum ou adm!-->
        <div class="environment" style="background-color:<?php
        //se area for igual a suporte fica da cor #ff0000
        if(isset($_SESSION['area']) && $_SESSION['area'] == 'suporte') {
            echo '#ff0000';
            //caso contrario se for cliente fica dessa '#00ff00'
        } elseif(isset($_SESSION['area']) && $_SESSION['area'] == 'cliente') {
            echo '#00ff00';
        } else {
            //pagina de escolha do usuario fica preto
            echo '#000000';
        }
        ?>"></div>
        <div class="container">
            <?php $this->loadViewInTemplate($viewName, $viewData); ?>
        </div>
    </body>
</html>