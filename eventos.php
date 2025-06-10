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
if (!isset($_POST["Email"]) || !isset($_POST["Token"])) {
    http_response_code(400);
    echo json_encode(["success" => false, "error" => "Falha na requisicao"]);
    exit();
}

$email = $_POST["Email"];
$token = $_POST["Token"];
$data  = date("Y-m-d H:i:s");

$response = ["success" => false];

// conexao ao banco de dados
$conexao = mysqli_connect($host, $username, $password, $dbname);
$conexao->set_charset("utf8");

if ($conexao->connect_errno) {
    http_response_code(500);
    echo json_encode(["success" => false, "error" => "Erro de conexão"]);
    exit();
}

// Consulta por token
$stmt = $conexao->prepare("SELECT token, created_at FROM usuarios WHERE Email = ? AND token = ?");
$stmt->bind_param("ss", $email, $token);
$stmt->execute();
$stmt->bind_result($tokenlido,$dtcriado);

if ($stmt->fetch()) {
        $stmt->close();
        $dtCriadoObj = new DateTime($dtcriado);
        $dtCriadoObj->modify('+23 hours'); //verifica validade do token
        $dataObj = new DateTime($data);
        if ($dataObj <= $dtCriadoObj) {
        // ler dados dos eventos
            banco("SELECT * FROM homepage");
        } else {
            $response["error"] = "token expirado.";
            echo json_encode($response); 
        }
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