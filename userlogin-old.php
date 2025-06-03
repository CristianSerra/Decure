<?php
include 'credencial.php';

header('Content-Type: application/json'); // <-- Define resposta como JSON

$conexao = mysqli_connect($host, $username, $password, $dbname);
$conexao->set_charset("utf8");

$response = ["success" => false]; // resposta padrão

if ($conexao->connect_errno) {
    http_response_code(500); // erro interno
    $response["error"] = "Problemas para conectar ao banco de dados.";
    echo json_encode($response);
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["Email"] ?? "";
    $senha = $_POST["Senha"] ?? "";
    $novasenha = sha1($senha);

    $stmt = $conexao->prepare("SELECT Senha FROM usuarios WHERE Email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->bind_result($senhaHashBD);

    if ($stmt->fetch()) {
        if ($senhaHashBD === $novasenha) {
            $response["success"] = true;
            $response["token"] = "09248th9hg";
        } else {
            $response["success"] = false;
            $response["error"] = "Senha incorreta.";
        }
    } else {
        $response["error"] = "Usuário não encontrado";
    }

    $stmt->close();
}

$conexao->close();
echo json_encode($response);
exit();
?>
