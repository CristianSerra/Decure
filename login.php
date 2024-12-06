<?php
include 'credencial.php';

$conexao = mysqli_connect($host, $username, $password, $dbname);
$conexao->set_charset("utf8");
    
    if ( $conexao->connect_errno ) {
        echo "Problemas para conectar";
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $email = $_POST["Email"];
        banco("SELECT Senha FROM usuarios WHERE Email='$email'");
    }
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