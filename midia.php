<?php
    $servidor = 'localhost';
    $usuario = 'FATEC';
    $senha = 'Fat2023!';
    $bancoDados = 'decure';
    $conexao = mysqli_connect($servidor, $usuario, $senha, $bancoDados);
       
    if ( $conexao->connect_errno ) {
        echo "Problemas para conectar";
    }

    $aux = explode("/", $_SERVER["REQUEST_URI"]);
    $imagem=$aux[2];
    $descricao=$aux[3];
    $link=$aux[4];

    $sql="INSERT INTO midias (imagem, descricao, link ) VALUES ('$imagem','$descricao','$link')";

    mysqli_query($conexao,$sql);
    
    mysqli_close($conexao);

exit();
?>
