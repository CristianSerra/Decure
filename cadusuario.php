<?php
    $nome = $_POST["Nome"];
    $email = $_POST["Email"];
    $cpf = $_POST["CPF"];
    $usersenha = $_POST["Senha"];
    $telefone = $_POST["Telefone"];
    $dtNascimento = $_POST["DTNascimento"];
    $logradouro = $_POST["logradouro"];
    $complemento = $_POST["complemento"];
    $bairro = $_POST["bairro"];
    $localidade = $_POST["localidade"];
    $uf = $_POST["uf"];

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

    $sql="INSERT INTO usuarios (Nome, Email, CPF, Senha, Telefone, DTNascimento, logradouro, complemento, bairro, localidade, uf) VALUES ('$nome','$email','$cpf','$usersenha','$telefone','$dtNascimento','$logradouro','$complemento','$bairro','$localidade','$uf')";

    mysqli_query($conexao,$sql);
    
    mysqli_close($conexao);

echo '
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<a href="index.html">Cadastro Efetivado. Clique aqui para voltar</a>
</body>
</html>
';
exit();
?>
