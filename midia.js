var items = [];


function carregamento() {
    let url = "midia-leitura.php";
    let xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);
    xhr.responseType='json';
    xhr.onload = function () {
        items = xhr.response;
        var container = document.getElementById("conteudo");
        items.map((val)=>{
            container.innerHTML+=`
            <tr>
            <td> 
             <input type="checkbox" id="controle" name="controle">
            </td>
            <td><img src='imagens/`+val.imagem+`' alt='Imagem'></td>
            <td>`+val.descricao+`</td>
            <td><a href='`+val.link+`' target='_blank'>`+val.link+`</a></td>
            </tr>
            `;
        });
    }
    xhr.send();
}

carregamento();