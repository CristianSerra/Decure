<?php
include 'credencial.php';
$novasenha="";
$conexao = mysqli_connect($host, $username, $password, $dbname);
$conexao->set_charset("utf8");
    
    if ( $conexao->connect_errno ) {
        echo "Problemas para conectar";
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $email = $_POST["Email"];
        $senha = $_POST["Senha"];
        $novasenha = sha1($senha);
        banco("SELECT Senha FROM usuarios WHERE Email='$email'");
    }
    mysqli_close($conexao);

    function banco ($consulta)
    {
            global $conexao,$novasenha;
            $res = $conexao->query($consulta);
            while ($linha = $res->fetch_row()) {
                if ($linha[0] == $novasenha) echo "true"; else echo "false";
            }
    }

exit();
?>