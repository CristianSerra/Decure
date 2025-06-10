<?php
include 'credencial.php';
header('Content-Type: application/json');

// Verifica se os dados foram enviados via POST
if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    http_response_code(400);
    echo json_encode(["success" => false, "error" => "Falha na requisicao"]);
    exit();
}

// Verifica se os campos obrigatórios existem
if (!isset($_POST["Email"]) || !isset($_POST["Senha"]) ) {
    http_response_code(400);
    echo json_encode(["success" => false, "error" => "Falha na requisicao"]);
    exit();
}

$email = $_POST["Email"];
$senha = $_POST["Senha"];
$data  = date("Y-m-d H:i:s");
$response = ["success" => false];

// Conecta ao banco
$conexao = mysqli_connect($host, $username, $password, $dbname);
$conexao->set_charset("utf8");

if ($conexao->connect_errno) {
    http_response_code(500);
    echo json_encode(["success" => false, "error" => "Erro de conexão"]);
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
        $stmtUpdate = $conexao->prepare("UPDATE usuarios SET token = ? , created_at = ? WHERE id = ?");
        $stmtUpdate->bind_param("ssi", $token, $data, $id);
        $stmtUpdate->execute();
        $stmtUpdate->close();

        $response["success"] = true;
        $response["token"] = $token;
        $response["usuario"] = $nome;
        $response["created_at"] = $data;
    } else {
        $response["error"] = "Senha incorreta.";
		$stmt->close();
    }
} else {
    $response["error"] = "Usuário não encontrado.";
    $stmt->close();
}
// envia resposta formato json
echo json_encode($response);

$conexao->close();

exit();
?>
