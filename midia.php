<?php
    $host = 'localhost';
    $usuario = 'FATEC';
    $senha = 'Fat2023!';
    $bcodados = 'decure';
    
    // Conexão com o banco de dados
    try {
        $pdo = new PDO("mysql:host=$host;dbname=$bcodados", $usuario, $senha);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Erro na conexão com o banco de dados: " . $e->getMessage());
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST" ) {
        $imagem= $_POST['imagem'];
        $descricao=$_POST['descricao'];
        $endereco=$_POST['endereco'];
        $contato=$_POST['contato'];
        $agendamento=$_POST['agendamento'];
        $link=$_POST['link'];

        try {
            $sql = "INSERT INTO midias (imagem, descricao, endereco, contato, agendamento, link ) VALUES (:imagem,:descricao,:endereco, :contato, :agendamento,:link)";
            $stmt = $pdo->prepare($sql);
            
            // Vincular os parâmetros
            $stmt->bindParam(':imagem', $imagem);
            $stmt->bindParam(':descricao', $descricao);
            $stmt->bindParam(':endereco', $endereco);
            $stmt->bindParam(':contato', $contato);
            $stmt->bindParam(':agendamento', $agendamento);
            $stmt->bindParam(':link', $link);
            
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
