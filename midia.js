var items = [];

function carregamento() {
    let url = "midia-leitura.php";
    let xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);
    xhr.responseType='json';
    xhr.onload = function () {
        items = xhr.response;
        
        var container = document.getElementById("formulario");
        container.innerHTML+=`<form id="edit-form" action="midia-filtro.php" method="POST">
            <table>
                <thead>
                    <tr style="height:50px">
                        <th>Controle</th>
                        <th>Imagem</th>
                        <th>Descrição</th>
                        <th>Endereço</th>
                        <th>Contato</th>
                        <th>Agendamento</th>
                        <th>Link</th>
                    </tr>
                </thead>
                <tbody id="conteudo">
                </tbody>
            </table>
            <br>
            <button type="submit">Enviar</button>
        </form>`;
        container = document.getElementById("conteudo");
        var conta=0;
        items.map((val)=>{
            container.innerHTML+=`
            <tr>
                <td><input type="checkbox" name="controle[]" value="`+conta+`"></td>
                <td><img src='`+val.imagem+`' alt='Imagem'>
                <input type="text" name="imagem[]" value="`+val.imagem+`"></td>
                <td><textarea name="descricao[]" rows="4">`+val.descricao+`</textarea></td>
                <td><textarea name="endereco[]" rows="4">`+val.endereco+`</textarea></td>
                <td><input type="text" name="contato[]" value="`+val.contato+`"></td>
                <td><textarea name="agendamento[]" rows="4">`+val.agendamento+`</textarea></td>
                <td><input type="text" name="link[]" value="`+val.link+`"></td>
            </tr>
            `;
            conta++;
        });
    }
    xhr.send();
}

carregamento();