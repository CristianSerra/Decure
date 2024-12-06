<?php
include 'credencial.php';

    // Conexão com o banco de dados
    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Erro na conexão com o banco de dados: " . $e->getMessage());
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST" ) {
        $imagem= $_POST['imagem'];
        $descricao=$_POST['descricao'];

        try {
            $sql = "INSERT INTO midias (imagem, descricao ) VALUES (:imagem,:descricao)";
            $stmt = $pdo->prepare($sql);
            
            // Vincular os parâmetros
            $stmt->bindParam(':imagem', $imagem);
            $stmt->bindParam(':descricao', $descricao);
            
            // Executar o comando SQL
            $stmt->execute();
            echo "Dados inseridos com sucesso!";
        } catch (PDOException $e) {
            die("Erro ao inserir dados: " . $e->getMessage());
        }        

    } else {
        echo "sem atualizações";
    }
?>
