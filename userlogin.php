<?php
include 'credencial.php';
header('Content-Type: application/json');

// Verifica se os dados foram enviados via POST
if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    http_response_code(405); // Método não permitido
    echo json_encode(["success" => false, "error" => "Método inválido. Use POST."]);
    exit();
}

// Verifica se os campos obrigatórios existem
if (!isset($_POST["Email"]) || !isset($_POST["Senha"])) {
    echo json_encode(["success" => false, "error" => "Campos 'Email' e 'Senha' são obrigatórios."]);
    exit();
}

$email = $_POST["Email"];
$senha = $_POST["Senha"];
$response = ["success" => false];

// Conecta ao banco
$conexao = mysqli_connect($host, $username, $password, $dbname);
$conexao->set_charset("utf8");

if ($conexao->connect_errno) {
    http_response_code(500);
    echo json_encode(["success" => false, "error" => "Erro de conexão com o banco de dados."]);
    exit();
}

// Consulta com prepared statement
$stmt = $conexao->prepare("SELECT id, Nome, Senha FROM usuarios WHERE Email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->bind_result($id, $nome, $passBD);

if ($stmt->fetch()) {
    if (password_verify($senha, $passBD)) {
        $stmt->close();
        // Gera token seguro
        $token = bin2hex(random_bytes(32)); // 64 caracteres

        // Salva o token no banco
        $stmtUpdate = $conexao->prepare("UPDATE usuarios SET token = ? WHERE id = ?");
        $stmtUpdate->bind_param("si", $token, $id);
        $stmtUpdate->execute();
        $stmtUpdate->close();

        $response["success"] = true;
        $response["token"] = $token;
        $response["usuario"] = $nome;
    } else {
        $response["error"] = "Senha incorreta.";
		$stmt->close();
    }
} else {
    $response["error"] = "Usuário não encontrado.";
    $stmt->close();
}

echo json_encode($response);

$conexao->close();

exit();
?>
