<?php
include 'credencial.php';
header('Content-Type: application/json');

// Permite apenas método POST
if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    http_response_code(405);
    echo json_encode(["success" => false, "error" => "Método inválido. Use POST."]);
    exit();
}

// Verifica campos obrigatórios
if (empty($_POST["Email"]) || empty($_POST["Senha"]) || empty($_POST["Nome"])) {
    echo json_encode(["success" => false, "error" => "Campos obrigatórios ausentes (Nome, Email ou Senha)."]);
    exit();
}

// Conecta ao banco
$conexao = new mysqli($host, $username, $password, $dbname);
$conexao->set_charset("utf8");

if ($conexao->connect_errno) {
    http_response_code(500);
    echo json_encode(["success" => false, "error" => "Erro de conexão com o banco de dados."]);
    exit();
}

// Campos obrigatórios
$nome       = $_POST["Nome"];
$email      = $_POST["Email"];
$usersenha  = $_POST["Senha"];
$novasenha  = password_hash($usersenha, PASSWORD_DEFAULT); // mais seguro que SHA1

// Campos opcionais
$cpf         = $_POST["CPF"] ?? "";
$telefone    = $_POST["Telefone"] ?? "";
$dtNascimento = $_POST["DTNascimento"] ?? null; // pode ser null
$logradouro  = $_POST["logradouro"] ?? "";
$complemento = $_POST["complemento"] ?? "";
$bairro      = $_POST["bairro"] ?? "";
$localidade  = $_POST["localidade"] ?? "";
$uf          = $_POST["uf"] ?? "";
$token       = bin2hex(random_bytes(32));

$stmread = $conexao->prepare("SELECT id, Nome FROM usuarios WHERE Email = ?");
$stmread->bind_param("s", $email);
$stmread->execute();
$stmread->bind_result($id, $nome);

if ($stmread->fetch()) {
    echo json_encode(["success" => false, "error" => "Usuário já cadastrado " . $email]);
    $stmread->close();
    $conexao->close();
    exit();
}
$stmread->close();

// Prepara a query com placeholders ?
$sql = "INSERT INTO usuarios (
    Nome, Email, CPF, Senha, Telefone, DTNascimento, 
    logradouro, complemento, bairro, localidade, uf, token
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $conexao->prepare($sql);

if (!$stmt) {
    echo json_encode(["success" => false, "error" => "Erro na preparação da query: " . $conexao->error]);
    exit();
}

// Liga os parâmetros (tudo string, exceto dtNascimento que pode ser null)
$stmt->bind_param(
    "ssssssssssss",
    $nome, $email, $cpf, $novasenha, $telefone,
    $dtNascimento, $logradouro, $complemento, $bairro,
    $localidade, $uf, $token
);

// Executa
if ($stmt->execute()) {
    echo json_encode(["success" => true, "token" => $token, "usuario" => $nome]);
} else {
    echo json_encode(["success" => false, "error" => "Erro ao inserir: " . $stmt->error]);
}

// Fecha conexão
$stmt->close();
$conexao->close();
exit();
?>