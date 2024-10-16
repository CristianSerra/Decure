<?php
$servidor = 'localhost';
$usuario = 'FATEC';
$senha = 'Fat2023!';
$bancoDados = 'decure';
$conexao = mysqli_connect($servidor, $usuario, $senha, $bancoDados);

if ( $conexao->connect_errno ) {
    echo "Problemas para conectar";
}

banco("SELECT * FROM midias");


mysqli_close($conexao);

function banco ($consulta)
{
        global $conexao;
        $res = $conexao->query($consulta);
        $dados = array();
        while($row = mysqli_fetch_assoc($res)) {
                $dados[]=$row;

        }
        echo json_encode($dados);
}

?>