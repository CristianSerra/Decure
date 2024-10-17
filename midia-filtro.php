<?php
    $servidor = 'localhost';
    $usuario = 'FATEC';
    $senha = 'Fat2023!';
    $bancoDados = 'decure';
    $conexao = mysqli_connect($servidor, $usuario, $senha, $bancoDados);
       
    if ( $conexao->connect_errno ) {
        echo "Problemas para conectar";
    }

    if (isset($_POST['controle'])) {
        $controles=$_POST['controle'];
        $imagens= $_POST['imagem'];
        $descricoes=$_POST['descricao'];
        $links=$_POST['link'];
        for ($i = 0; $i < count($controles); $i++) {
            $controle = $controles[$i];
            $imagem = $imagens[$i];
            $descricao = $descricoes[$i];
            $link = $links[$i];
            $sql="INSERT INTO filtro (imagem, descricao, link ) VALUES ('$imagem','$descricao','$link')";
            mysqli_query($conexao,$sql);
        }
        echo "banco de dados atualizado";
    } else {
        echo "sem atualizações";
    }
    mysqli_close($conexao);
    
exit();
?>
