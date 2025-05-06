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
                if (key2=="SN") {
                    aboutUs();
                } 
                else 
                filtro(key2);
                $("#painel").hide();
            });
        };
        xhr.send();
        
        $(".navbar-brand").click(function() {
            location.reload();
        });
}

function aboutUs() {
    let saida="";
    var container = document.getElementById("cultura");
    container.innerHTML=saida;
    var container = document.getElementById("sobrenos");
    saida=`
        Decure é uma plataforma digital que centraliza e divulga informações sobre exposições de artes visuais em galerias, museus e outras instituições culturais no Brasil de forma acessível e abrangente.<br><br>
    
        <h1>Missão, Visão e Valores</h1><br>
        
        <h2>Missão</h2>
        <p>Democratizar o acesso à arte, conectando artistas, amantes da arte e o público em geral em um ambiente inspirador e inclusivo.</p><br>
        
        <h2>Visão</h2>
        <p>Ser o principal hub de arte online, reconhecido por sua qualidade, acessibilidade e por promover a conexão entre criadores e apreciadores.</p><br>
        
        <h2>Valores</h2>
        <p>
        Acessibilidade: Tornar a arte acessível a todos, independentemente de seu conhecimento ou experiência.<br><br>
        Inovação: Buscar constantemente novas formas de conectar pessoas e promover a arte através de ferramentas e estratégias inovadoras.<br><br>
        Transformação: Nossa missão nos pede para desafiar o status quo. Abraçamos o feedback, o aprendizado e a mudança para que possamos transformar nossa indústria, nossa empresa e nós mesmos.<br><br>
        Sustentabilidade: Usando arte e ciência, buscamos promover práticas éticas e sustentáveis em todas as etapas do negócio.
        </p>
    `;
    container.innerHTML=saida;
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

    $.post("login.php", {
        Email : auxemail,
        Senha : auxsenha
    }, function(result){
        if (result=="true") {
            localStorage.setItem("usuario",auxemail);
            location.reload();
        }
        else {
            $("#erro").html("credencial inválida. Tente novamente...");
        }
    });
}

function cadastra() {
    var auxnome = document.getElementById("Nome").value;
    $.post("cadusuario.php", {
        Nome: document.getElementById("Nome").value,
        Senha: document.getElementById("Senha").value,
        Email: document.getElementById("Email").value,
        CPF: document.getElementById("CPF").value,
        Telefone: document.getElementById("Telefone").value,
        DTNascimento: document.getElementById("DTNascimento").value,
        CEP: document.getElementById("cep").value,
        logradouro: document.getElementById("logradouro").value,
        complemento: document.getElementById("complemento").value,
        bairro: document.getElementById("bairro").value,
        localidade: document.getElementById("localidade").value,
        uf: document.getElementById("uf").value
    }, function(result,status){
            localStorage.setItem("usuario",auxnome);
            location.reload();
    });
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

function pagcadastro() {
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
    
