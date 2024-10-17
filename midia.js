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
                        <th>Preview</th>
                        <th>Imagem</th>
                        <th>Descrição</th>
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
            <tr style="height:90px">
                <td><input type="checkbox" name="controle[]" value="`+conta+`"></td>
                <td style="width:300px"><img src='imagens/`+val.imagem+`' alt='Imagem'></td>
                <td><input type="text" name="imagem[]" value="`+val.imagem+`"></td>
                <td><input type="text" name="descricao[]" value="`+val.descricao+`"></td>
                <td><input type="text" name="link[]" value="`+val.link+`"></td>
            </tr>
            `;
            conta++;
        });
    }
    xhr.send();
}

carregamento();