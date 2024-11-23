<?php

$host = 'localhost'; // Host do MySQL
$dbname = 'decure'; // Nome do banco de dados
$username = 'FATEC'; // Nome de usuário do MySQL
$password = 'Fat2023!'; // Senha do MySQL

//$host = "artmap.mysql.dbaas.com.br";
//$username = "artmap";
//$password = "V@xd3v44#Fgdb";
//$dbname = "artmap";

$conexao = mysqli_connect($host, $username, $password, $dbname);
$conexao->set_charset("utf8");


if ( $conexao->connect_errno ) {
    echo "Problemas para conectar";
}

banco("SELECT * FROM homepage");


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