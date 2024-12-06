<?php
// Configurações do banco de dados
include 'credencial.php';

// Conexão com o banco de dados
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
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
    $horario = $_POST['horario'];
    $endereco = $_POST['endereco'];
    $contato = $_POST['contato'];
    $agendamento = $_POST['agendamento'];
    $link = $_POST['link'];

    // Inserir os dados no banco de dados
    try {
        $sql = "INSERT INTO instituicoes (nome, categoria, descricao, horario, endereco, contato, agendamento, link) VALUES (:nome, :categoria, :descricao, :horario, :endereco, :contato, :agendamento, :link)";
        $stmt = $pdo->prepare($sql);
        
        // Vincular os parâmetros
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':categoria', $categoria);
        $stmt->bindParam(':descricao', $descricao);
        $stmt->bindParam(':horario', $horario);
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
}
?>
