/**
 * 
 */
 /* AO CLICAR NO CARD DE UM PRODUTO, O JAVASCRIPT ENVIA PARA A MODAL OS DADOS DESSE PRODUTO*/
 function setaModal(id){
var aux = document.getElementById(id);
var aux2 = document.getElementById('valor');
var aux4 = document.getElementById('hiddenInput');
var nome = document.getElementById('nome');
var nomeEscondido = document.getElementById('hiddenNome');

var teste2 = aux.childNodes[3].value;
console.log(nomeEscondido.value);
const ultimoFilho = aux.lastElementChild;
const teste = aux.lastElementChild.firstElementChild.attributes[1].textContent;
var stringURL = ultimoFilho.attributes[1];
var valor = aux.attributes[4].textContent;

var modalImagem = document.getElementById('modal-imagem');
var img = modalImagem.firstElementChild;
img.setAttribute('src',stringURL.textContent);
aux2.setAttribute('value', valor);
nome.setAttribute('value',teste2 );
aux4.setAttribute('value',teste);
}

function ImageFunction(value){
	if(value == 1){
		var entradas = document.getElementById('entradas1');
		entradas.classList.add('grid-items-entradas1');
	}
}
/* FUNÇÃO QUE APENAS REDIRECIONA PARA OUTRA PÁGINA*/
function redireciona(){
    window.location.href = "http://localhost:8006/ProjetoWeb/AlterarDados.jsp";

    }

/*FUNÇÃO APENAS PARA REDIRECIONAR PARA OUTRA PÁGINA*/           
    function redireciona2(){
        window.location.href = "http://localhost:8006/ProjetoWeb/index.jsp";

           }
              
          