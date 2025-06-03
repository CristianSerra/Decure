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
if (!isset($_POST["Email"]) || !isset($_POST["Token"])) {
    echo json_encode(["success" => false, "error" => "Campos 'Email' e 'Token' são obrigatórios."]);
    exit();
}

$email = $_POST["Email"];
$token = $_POST["Token"];

$response = ["success" => false];

// conexao ao banco de dados
$conexao = mysqli_connect($host, $username, $password, $dbname);
$conexao->set_charset("utf8");

if ($conexao->connect_errno) {
    http_response_code(500);
    echo json_encode(["success" => false, "error" => "Erro de conexão com o banco de dados."]);
    exit();
}

// Consulta por token
$stmt = $conexao->prepare("SELECT token FROM usuarios WHERE Email = ? AND token = ?");
$stmt->bind_param("ss", $email, $token);
$stmt->execute();
$stmt->bind_result($tokenlido);

if ($stmt->fetch()) {
        $stmt->close();
        // ler dados dos eventos
        banco("SELECT * FROM homepage");    
} else {
        $stmt->close();
        $response["error"] = "token inválido.";
        echo json_encode($response);
}

mysqli_close($conexao);
exit();

function banco ($consulta)
{
        global $conexao,$response;
        $res = $conexao->query($consulta);
        $dados = array();
        while($row = mysqli_fetch_assoc($res)) {
                $dados[]=$row;

        }
        $response["success"] = true;
        $response["token"] = $token;
        $response["dados"] = $dados;
        echo json_encode($response);
}

?>