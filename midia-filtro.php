<?php
    $host = 'localhost';
    $usuario = 'FATEC';
    $senha = 'Fat2023!';
    $bcodados = 'decure';
    
    //$host = "artmap.mysql.dbaas.com.br";
    //$username = "artmap";
    //$password = "V@xd3v44#Fgdb";
    //$dbname = "artmap";

    // Conexão com o banco de dados
    try {
        $pdo = new PDO("mysql:host=$host;dbname=$bcodados", $usuario, $senha);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Erro na conexão com o banco de dados: " . $e->getMessage());
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['controle'])) {
        $controles=$_POST['controle'];
        $imagens= $_POST['imagem'];
        $descricoes=$_POST['descricao'];
        $enderecos=$_POST['endereco'];
        $contatos=$_POST['contato'];
        $agendamentos=$_POST['agendamento'];
        $links=$_POST['link'];

        for ($i = 0; $i < count($controles); $i++) {
            $aux = $controles[$i];
            $imagem = $imagens[$aux];
            $descricao = $descricoes[$aux];
            $endereco = $enderecos[$aux];
            $contato = $contatos[$aux];
            $agendamento = $agendamentos[$aux];
            $link = $links[$aux];

            try {
                $sql = "INSERT INTO filtro (imagem, descricao, endereco, contato, agendamento, link ) VALUES (:imagem,:descricao,:endereco, :contato, :agendamento,:link)";
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
        }
    } else {
        echo "sem atualizações";
    }
?>
