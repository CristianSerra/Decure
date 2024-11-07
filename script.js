var items = [];

inicializarLoja = () => {
        let url = "carrega.php";
        let xhr = new XMLHttpRequest();
        xhr.open("GET", url, true);
        xhr.responseType='json';
        xhr.onload = function () {
            items = xhr.response;
            filtro("EX");

            var links = document.getElementsByClassName("card");
            for (var i=0; i< links.length; i++) {
                    links[i].addEventListener("click",function() {
                        let key = this.getAttribute('key');
                        var meuModal = new bootstrap.Modal(document.getElementById('detalhes'));
                        meuModal.show();
                        return false;
                    });
            };
            $(".nav-link").click(function() {
                let key2 = this.getAttribute('key');
                $("#painel").hide();
                filtro(key2);
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
            if (categoria == chave || chave=="limpar") saida+=`
                    <div class="col card text-center h-10">
                            <div class="card-body">   
                                <a href="#">
                                    <img src="images/`+val.imagem+`" class="card-img-top">      
                                    <h5 class="card-title">`+val.Instituicao+`</h5>
                                    <p class="card-text">`+val.Titulo+`</p>
                                </a>
                            </div>
                    </div>
                `;
    });
    container.innerHTML=saida;
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

inicializarLoja();

function recarga() {
    var userlogado = localStorage.getItem("usuario");
    if (userlogado==null) {
        document.getElementById("nomeusuario").innerText="";
    }
    else {
        document.getElementById("nomeusuario").innerText="Usuario: "+userlogado;
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

function cadastro() {
    load_pag("painel","cadastro.html");

}

const pesquisa = document.querySelector("input");

pesquisa.addEventListener("input", function() {
    filtro(pesquisa.value);
});