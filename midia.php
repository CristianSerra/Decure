<?php
    $servidor = 'localhost';
    $usuario = 'FATEC';
    $senha = 'Fat2023!';
    $bancoDados = 'decure';
    $conexao = mysqli_connect($servidor, $usuario, $senha, $bancoDados);
       
    if ( $conexao->connect_errno ) {
        echo "Problemas para conectar";
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $imagem= $_POST['imagem'];
        $descricao=$_POST['descricao'];
        $link=$_POST['link'];
    }
    #$aux = explode("/", $_SERVER["REQUEST_URI"]);
    

    $sql="INSERT INTO midias (imagem, descricao, link ) VALUES ('$imagem','$descricao','$link')";

    mysqli_query($conexao,$sql);
    
    mysqli_close($conexao);

exit();
?>
