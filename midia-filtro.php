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
        $enderecos=$_POST['endereco'];
        $contatos=$_POST['contato'];
        $agendamentos=$_POST['agendamento'];
        $links=$_POST['link'];
        for ($i = 0; $i < count($controles); $i++) {            
            $aux = $controles[$i];
            $imagem = $imagens[$aux];
            $descricao = $descricoes[$aux];
            $endereco = $enderecos[$aux];
            $contato = $contatos[$aux];
            $agendamento = $agendamentos[$aux];
            $link = $links[$aux];
            $sql="INSERT INTO filtro (imagem, descricao, endereco, contato, agendamento, link ) VALUES ('$imagem','$descricao','$endereco', '$contato', '$agendamento','$link')";
            mysqli_query($conexao,$sql);
        }
        echo "banco de dados atualizado";
    } else {
        echo "sem atualizações";
    }
    mysqli_close($conexao);
    
exit();
?>
