var items = [];

inicializarLoja = () => {
        let url = "carrega.php";
        let xhr = new XMLHttpRequest();
        xhr.open("GET", url, true);
        xhr.responseType='json';
        xhr.onload = function () {
            items = xhr.response;
            filtro("EX");
            $(".nav-link").click(function() {
                let key2 = this.getAttribute('key');
                filtro(key2);
                $("#painel").hide();
            });
        };
        xhr.send();
        
        $(".navbar-brand").click(function() {
            location.reload();
        });
}

function filtro(chave) {
    var container = document.getElementById("cultura");
    let saida="";
    items.map((val)=>{
            let categoria = val.categoria;
            let titulo = val.Titulo;
            let instituicao = val.Instituicao;
            if (categoria == chave || chave=="limpar" || titulo.search(chave) != -1 || instituicao.search(chave)!=-1) saida+=`
                    <div class="col card text-center h-10" key="`+val.id+`">
                            <div class="card-body">   
                                <a href="#" style="text-decoration: none; color: black;">
                                    <img src="images/`+val.imagem+`" class="card-img-top">      
                                    <h5 class="card-title">`+val.Instituicao+`</h5>
                                    <p class="card-text">`+val.Titulo+`</p>
                                </a>
                            </div>
                    </div>
                `;
    });
    container.innerHTML=saida;
    var links = document.getElementsByClassName("card");
    container = document.getElementById("detalhes");
    for (var i=0; i< links.length; i++) {
            links[i].addEventListener("click",function() {
                let idcard = this.getAttribute('key');
                let insta = items[idcard-1].Instagram.substr(1);
                carddetalhe=`
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">`+items[idcard-1].Titulo+`</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>`+items[idcard-1].descricao+`</p>
                                <p><b>Site: </b><a href="`+items[idcard-1].link+`" target="_blank">`+items[idcard-1].link+`</a></p>
                                <p><b>Instagram: </b><a href="https://instagram.com/`+insta+`" class="card-link" target="_blank">`+items[idcard-1].Instagram+`</a></p>
                                <p><b>Endereço: </b>`+items[idcard-1].Endereco+`</p>
                                <p><b>Contato: </b>`+items[idcard-1].Contato+`</p>
                                <p><b>Agendamento: </b>`+items[idcard-1].Agendamento+`</p>
                                <p><b>Horário: </b>`+items[idcard-1].Horario+`</p>
                                <p><b>Data Publicação: </b>`+items[idcard-1].DataPub+`</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" data-target="detalhes">Close</button>
                            </div>
                        </div>
                    </div>`;
                container.innerHTML=carddetalhe;
                var meuModal = new bootstrap.Modal(document.getElementById('detalhes'));
                meuModal.show();
                return false;
            });
    };
}

function loga() {
    var auxemail = document.getElementById("Email").value;
    var auxsenha = document.getElementById("Senha").value;
    let url = "login.php/"+auxemail;
    let xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);
    xhr.onload = function () {
        senha = xhr.response;
        if (senha==auxsenha) {
            localStorage.setItem("usuario",auxemail);
            location.reload();
        }
        else {
            document.getElementById("erro").innerHTML="credencial inválida. Tente novamente..."
        }
    };
    xhr.send();
}

async function load_pag( div,url ){
    var response = null;
    var r = '';

    try {
        response = await fetch(url);
    } finally {
        //alert('fim ');
    }

    if ( response.ok==false ) {
        r = 'erro: '+response.url+' / '+ response.statusText ;
    } else {
        r = await response.text();
    }
    document.getElementById(div).innerHTML=  r ;
    document.getElementById("cultura").innerHTML="";

    if (url="cadastro.html") {
        const preencher = (endereco) => {
            document.getElementById('logradouro').value = endereco.logradouro;
            document.getElementById('bairro').value = endereco.bairro;
            document.getElementById('localidade').value = endereco.localidade;
            document.getElementById('uf').value = endereco.uf;
        }

        const pesquisarCep = async() => {
            const valorcep = document.getElementById('cep').value;
            const url = `http://viacep.com.br/ws/${valorcep}/json`;
            const dados =  await fetch(url);
            const endereco = await dados.json();
            preencher(endereco);
        }
        document.getElementById('cep').addEventListener('focusout',pesquisarCep);
    }
}

function cadastro() {
    load_pag("painel","cadastro.html");
}

function pesquisar() {
    const pesquisa = document.getElementById("pesquisa");
    filtro(pesquisa.value);
    $("#painel").hide();
}

inicializarLoja();

function recarga() {
    var userlogado = localStorage.getItem("usuario");
    if (userlogado==null) {
        document.getElementById("nomeusuario").innerText="";
    }
    else {
        document.getElementById("nomeusuario").innerText=userlogado;
    }
}
window.onload = recarga();
window.addEventListener("focus", recarga);

document.getElementById("login").addEventListener("click",function() {
    var userlogado = localStorage.getItem("usuario");
    if (userlogado==null) {
        load_pag("painel","logar.html");
    }
    else {
        localStorage.clear();
        recarga();
    }
});
    
