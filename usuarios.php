<?php
$servidor = 'localhost';
$usuario = 'FATEC';
$senha = 'Fat2023!';
$bancoDados = 'decure';

$host = "artmap.mysql.dbaas.com.br";
$username = "artmap";
$password = "V@xd3v44#Fgdb";
$dbname = "artmap";

$conexao = mysqli_connect($servidor, $usuario, $senha, $bancoDados);

if ( $conexao->connect_errno ) {
    echo "Problemas para conectar";
}

banco("SELECT * FROM usuarios");

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