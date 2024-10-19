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
        var container = document.getElementsByClassName("carousel-inner")[0];
        var container2 = document.getElementById("exposicoes");
        items.map((val)=>{
            if (val.categoria==1) {
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
            }
            if (val.categoria==2) {
                container2.innerHTML+=`
                    <div class="col-md-3">
                        <div class="card">
                            <img src="imagens/`+val.imagem+`" class="card-img-top" alt="Exposição">
                            <div class="card-body">
                                <h5 class="card-title">`+val.descricao+`</h5>
                            </div>
                        </div>
                    </div>
                `;
            }
        });

        // carrega menu principal
        var linkfiltro = document.getElementsByClassName("nav-link");
        for (var i=0; i< linkfiltro.length; i++) {
            linkfiltro[i].addEventListener("click",function() {
                let key2 = this.getAttribute('key');
                filtro(key2);
                return false;
            });
        };

    }
    xhr.send();
}

carregamento();
