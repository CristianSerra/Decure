<?php
include 'credencial.php';

$conexao = mysqli_connect($host, $username, $password, $dbname);
$conexao->set_charset("utf8");

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