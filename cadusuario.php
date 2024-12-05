<?php
    //$host = 'localhost'; // Host do MySQL
    //$dbname = 'decure'; // Nome do banco de dados
    //$username = 'FATEC'; // Nome de usuário do MySQL
    //$password = 'Fat2023!'; // Senha do MySQL
    
    $host = "artmap.mysql.dbaas.com.br";
    $username = "artmap";
    $password = "V@xd3v44#Fgdb";
    $dbname = "artmap";
    
    // Conexão com o banco de dados
    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Erro na conexão com o banco de dados: " . $e->getMessage());
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
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

    // Inserir os dados no banco de dados
    try {
        $sql = "INSERT INTO usuarios (Nome, Email, CPF, Senha, Telefone, DTNascimento, logradouro, complemento, bairro, localidade, uf) VALUES (:nome, :email, :cpf, :usersenha, :telefone, :dtNascimento, :logradouro, :complemento, :bairro, :localidade, :uf)";
        $stmt = $pdo->prepare($sql);

        // Vincular os parâmetros
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':email', $categoria);
        $stmt->bindParam(':cpf', $cpf);
        $stmt->bindParam(':usersenha', $usersenha);
        $stmt->bindParam(':telefone', $telefone);
        $stmt->bindParam(':dtNascimento', $dtNascimento);
        $stmt->bindParam(':logradouro', $logradouro);
        $stmt->bindParam(':complemento', $complemento);
        $stmt->bindParam(':bairro', $bairro);
        $stmt->bindParam(':localidade', $localidade);
        $stmt->bindParam(':uf', $uf);
        
        // Executar o comando SQL
        $stmt->execute();

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
        } catch (PDOException $e) {
            die("Erro ao inserir dados: " . $e->getMessage());
        }
    }
?>
