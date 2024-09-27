<?php
    $servidor = 'localhost';
    $usuario = 'FATEC';
    $senha = 'Fat2023!';
    $bancoDados = 'carros';

    $conexao = mysqli_connect($servidor, $usuario, $senha, $bancoDados);
    
    if ( $conexao->connect_errno ) {
        echo "Problemas para conectar";
    }

    $aux = explode("/", $_SERVER["REQUEST_URI"]);
    $email=$aux[3];

    banco("SELECT Senha FROM usuarios WHERE Email='$email'");

    mysqli_close($conexao);

    function banco ($consulta)
    {
            global $conexao;
            $res = $conexao->query($consulta);
            while ($linha = $res->fetch_row()) {
                for ($conta=0; $conta < count($linha); $conta++) {
                    echo $linha[$conta];
                }
            }
    }

exit();
?>