var items = [];


function carregamento() {
    let url = "carrega.php";
    let xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);
    xhr.responseType='json';
    xhr.onload = function () {
        items = xhr.response;
        let conta=0;
        let primeiro="";
        //console.log("conta= "+conta);
        var container = document.getElementsByClassName("carousel-inner")[0];
        items.map((val)=>{
            if (conta==0) { primeiro=" active "; conta++; }
            container.innerHTML+=`
                <div class="carousel-item`+ primeiro + `">
                    <a href="https://`+val.link+`">
                        <img src="imagens/`+val.imagem+`" class="d-block w-100" alt="...">
                    </a>
                    <div class="carousel-caption d-none d-md-block">
                    <h5>`+val.descricao+`</h5>
                    </div>
                </div>
            `;
        });
    }
    xhr.send();
}

inicializarLoja = () => {
        let url = "carrega.php";
        let xhr = new XMLHttpRequest();
        xhr.open("GET", url, true);
        xhr.responseType='json';
        xhr.onload = function () {
            items = xhr.response;
            var container = document.getElementById("produtos");
            items.map((val)=>{
                let preco = parseFloat(val.PrecoVenda);
                container.innerHTML+=`
                    <div class="produto-single">
                        <img src="imagens/`+val.Imagem+`" />
                        <p>`+val.Descricao+`</p>
                        <p>`+preco.toLocaleString('pt-BR', {style: 'currency', currency: 'BRL'})+`</p>
                        <a class="botao" key="`+val.Codigo+`" href="#">Comprar<a/>
                    </div>
                `;
            });

            var links = document.getElementsByClassName("botao");
            for (var i=0; i< links.length; i++) {
                    links[i].addEventListener("click",function() {
                        let key = this.getAttribute('key');
                        var qtdaux=localStorage.getItem(key);
                        var qtd=0;
                        if (qtdaux == null) qtd=1; else qtd=parseInt(qtdaux)+1;
                        localStorage.setItem(key,qtd.toString());
                        return false;
                    });
            };

            var linkfiltro = document.getElementsByClassName("marcas");
            for (var i=0; i< linkfiltro.length; i++) {
                linkfiltro[i].addEventListener("click",function() {
                    let key2 = this.getAttribute('key');
                    filtro(key2);
                    return false;
                });
            };

        };
        xhr.send();
}

function filtro(chave) {
    var newpainel = document.getElementById("painel");
    newpainel.innerHTML="";
    var container = document.getElementById("produtos");
    container.innerHTML="";
    items.map((val)=>{
            let descricao = val.Descricao;
            let preco = parseFloat(val.PrecoVenda);
            if (descricao.search(chave) != -1 || chave=="limpar") container.innerHTML+=`
                    <div class="produto-single">
                        <img src="images/`+val.Imagem+`" />
                        <p>`+val.Descricao+`</p>
                        <p>`+preco.toLocaleString('pt-BR', {style: 'currency', currency: 'BRL'})+`</p>
                        <a class="botao" key="`+val.Codigo+`" href="#">Comprar</a>
                    </div>
                `;
    });

    var links = document.getElementsByClassName("botao");
    for (var i=0; i< links.length; i++) {
            links[i].addEventListener("click",function() {
                let key = this.getAttribute('key');
                var qtdaux=localStorage.getItem(key);
                var qtd=0;
                if (qtdaux == null) qtd=1; else qtd=parseInt(qtdaux)+1;
                localStorage.setItem(key,qtd.toString());
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
    document.getElementById("produtos").innerHTML="";

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

carregamento();

function recarga() {
    var userlogado = localStorage.getItem("usuario");
    if (userlogado==null) {
        document.getElementById("nomeusuario").innerText="";
    }
    else {
        document.getElementById("nomeusuario").innerText="Usuario: "+userlogado;
    }
}
//window.onload = recarga();
//window.addEventListener("focus", recarga);

function inicio() {
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
    
    const pesquisa = document.querySelector("input");

    pesquisa.addEventListener("input", function() {
        filtro(pesquisa.value);
    });
}

function cadastro() {
    load_pag("painel","cadastro.html");

}

