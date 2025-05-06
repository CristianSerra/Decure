<?php
$uri = $_SERVER['REQUEST_URI'];
$path = parse_url($uri, PHP_URL_PATH);
//usado com Xampp local
$base = '/decure';
if (strpos($path, $base) === 0) {
    $path = substr($path, strlen($base));
}

$path = trim($path, '/');
// Roteia para o arquivo correspondente
switch ($path) {
    case 'api/carrega':
        require 'carrega.php';
        break;
    case 'api/login':
        require 'login.php';
        break;    
    default:
        require 'index.html';
        //http_response_code(404);
        //echo json_encode(['erro' => 'Rota não encontrada']);
        //echo $path;
}
?>