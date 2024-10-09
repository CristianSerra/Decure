<?php
// Configurações do banco de dados
$host = 'localhost'; // Host do MySQL
$dbname = 'decure'; // Nome do banco de dados
$username = 'FATEC'; // Nome de usuário do MySQL
$password = 'Fat2023!'; // Senha do MySQL

// Conexão com o banco de dados
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erro na conexão com o banco de dados: " . $e->getMessage());
}

// Verifica se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Coletar os dados do formulário
    $nome = $_POST['nome'];
    $categoria = $_POST['categoria'];
    $descricao = $_POST['descricao'];
    $link = $_POST['link'];

    // Inserir os dados no banco de dados
    try {
        $sql = "INSERT INTO instituicoes (nome, categoria, descricao, link) VALUES (:nome, :categoria, :descricao, :link)";
        $stmt = $pdo->prepare($sql);
        
        // Vincular os parâmetros
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':categoria', $categoria);
        $stmt->bindParam(':descricao', $descricao);
        $stmt->bindParam(':link', $link);
        
        // Executar o comando SQL
        $stmt->execute();
        echo "Dados inseridos com sucesso!";
    } catch (PDOException $e) {
        die("Erro ao inserir dados: " . $e->getMessage());
    }
}
?>
