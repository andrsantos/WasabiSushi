<jsp:include page="topo.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="model.ProdutoDAO"%>
    <%@page import ="java.util.List"%>
     <%@page import ="java.util.ArrayList"%>
   <%@page import="model.Produto" %>
   <%@page import="model.ProdutoSacola" %>
   <%@page import="model.ProdutoSacolaDAO" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Wasabi Sushi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/288102535f.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
  </head>
  <link rel="stylesheet" type="text/css" href="estilo.css">
  <body>
<!-- Modal lateral -->
  
  <div class="modal right fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document" style="right:-30% !important;">
      <div class="modal-content">

        <div class="modal-header flow">
          <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h5 class="modal-title" id="myModalLabel2">Sacola</h5>
        </div>
        <form method="post" action="http://localhost:8006/ProjetoWeb/ClienteController">
        <div class="modal-body">
        <div class="sacola" id="items">
        
     <% 
      List<ProdutoSacola> sacola = new ArrayList<ProdutoSacola>();
	  ProdutoSacolaDAO dao = new ProdutoSacolaDAO();  
	  sacola = ProdutoSacolaDAO.listarSacola();
	  if(sacola == null){
		  System.out.println("Sacola vazia");
	  } else{
      for(ProdutoSacola p: sacola){ 
      %>
        <div class="produto">
        <div class="row">
        <div class="col-md-12"><strong><%= p.getValor() %></strong></div>
        </div>

        <div class="row">
        <div class="col-md-6"><%= p.getNome() %></div>
        <div class="col-md-6"><%= p.getValor() %></div>
        </div>  

        <div class="row">
        <div class="col-md-6"></div>
        <div class="col-md-6"><input class="btn btn-danger" value="Remover" id="<%= p.getProdutoSacolaId() %>" onclick="deletar(id)"></div>
         <input type="hidden" name="<%= p.getProdutoSacolaId() %>" value="" id="hiddenInput">
        </div>  

        </div>   
        <% }
      } %>
       <!--  <div class="produto">
        <div class="row">
        <div class="col-md-12">Nome do Cardápio</div>
        </div>

        <div class="row">
        <div class="col-md-6">Quantidade e Nome do Item</div>
        <div class="col-md-6">Valor total do item</div>
        </div>  

        <div class="row">
        <div class="col-md-6">Editar</div>
        <div class="col-md-6">Remover</div>
        </div>  

        </div>   -->
        



        
       
         
        </div>        
        </div>
        <input type="hidden" name="tipoformulario" value="produtoSacola">
      <input type="submit" class="btn btn-dark full-width" value="Fazer Pedido">   
      </form>
      </div><!-- modal-content -->
    </div><!-- modal-dialog -->
  </div><!-- modal -->
  

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Adicionar Produto</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">        
       <div class="row">
       <div class="col-md-6">
        <div id="modal-imagem" class="img-modal"><img src="" class="img-geral" /></div>
       </div>
       <div class="col-md-6">
        <div class="formulario-compra">

         <!--<form method="get" action="http://localhost:8089/ProjetoWeb/ServletSacola"> -->

            <div class="input-group mb-3">
            Valor:
            <input type="text" class="form-control border-none background-none" aria-label="Username" readonly value="" id="valor" style="width:100%;">
            Nome:
            <input type="text" class="form-control border-none background-none" aria-label="Username" readonly value="" id="nome" style="width:100%;">
          </div>
    <!--  PRIMEIRA MODAL PARE AQUI -->
             
           <input class="btn btn-dark" id="criarSacola" value="Adicionar � sacola" aria-label="Username" aria-describedby="basic-addon1">
           <input type="hidden" name="produto" value="" id="hiddenInput">
            
         <!-- </form> -->

        </div>
       </div>
       </div>
      </div>
      <div class="modal-footer">
      
      </div>
    </div>
  </div>
</div>
  <div class="container-fluid d-flex full-height border-gray-light no-margin no-padding flow">


 <!--NAVBAR-->
  <nav class="navbar navbar-expand-lg background-white" style="position: fixed;top: 0;left: 0;right: 0;box-shadow: 2px 2px 5px 5px rgba(238, 237, 237, 0.6); z-index:1000;">
  <a class="navbar-brand" href="index.jsp">Wasabi Sushi</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
    
    <!-- ---------------------------- ITEM  ------------------------------ -->
      <li class="nav-item active">
        <a class="nav-link" href="">Bem vindo, ${nome}<span class="sr-only">(current)</span></a>
      </li>
    <!-- ---------------------------- ITEM  ------------------------------ -->
    
      
    <!-- ---------------------------- ITEM  ------------------------------ -->

    </ul>
    
      
        <a class="nav-link" href="http://localhost:8006/ProjetoWeb/AlterarDados.jsp">Editar Perfil<span class="sr-only" style="margin-right:2%">(current)</span></a>
      
     
        <a class="nav-link btn btn-danger" href="" data-bs-toggle="modal" data-bs-target="#myModal2" style="margin-right:2%;"><i class="fa-solid fa-bag-shopping"></i><span class="sr-only">(current)</span></a>
     
    <a href="logout.jsp"><span class="navbar-text">
      Sair
    </span></a>
  </div>
</nav>
  <!--NAVBAR-->

  <!--CONTAINER DA IMAGEM-->
  

  <div class="img-container d-flex justify-content-center align-items-center flow">  

  <div class="imagem-central d-flex">
    
    
  </div>

  <div class="pesquisa-container d-flex justify-content-start  align-items-center">
    
   <h2>Bem vindo ao Wasabi Sushi!</h2>

  </div>

  </div>
  
 <!--CONTAINER DA IMAGEM-->

 <!--GRID PROMOï¿½ï¿½O--->
 <div class="promocao-container ">
  <div class="titulo"><h2>Promo��o</h2></div>
  <div class="grid-container no-margin no-padding">
   <% 
      int cont = 1;
      List<Produto> produtos = new ArrayList<Produto>();
	  ProdutoDAO dao2 = new ProdutoDAO();  
	  produtos = ProdutoDAO.listarProdutos(1);
      for(Produto p: produtos){ 
      %>
  <div class="grid-item z-index grow no-margin no-padding">
  <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="<%= cont %>" value="<%= p.getPreco() %> "onclick="setaModal(id)" >
   <div class="grid-item-dsc"><strong><%= p.getNome() %></strong><br><%= p.getDescricao() %><br><br>Valor: <%= p.getPreco() %> R$</div>
   <input type="hidden" name="NomeEscondido" value="<%= p.getNome() %>" id="hiddenNome">
    <div class="grid-promocao-img" value="<%= p.getUrl() %>"><img class="img-background-properties" value="<%= p.getId() %>" id="imagemProduto" src="<%= p.getUrl() %>"/></div>
  </div>

  </div>
<% cont++;
} %>
 <!--  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="2" onclick="setaImagem(id)">
    <div class="grid-item-dsc"> Descriï¿½ï¿½o <br>  Roll de sushi com hot...<br><br>Valor:</div>
    <div class="grid-promocao-img1" value="Imagens/Promoï¿½ï¿½o/img02.jpg"></div>
  </div>
  </div> -->

  <!--   <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="3" onclick="setaImagem(id)">
   <div class="grid-item-dsc">Descriï¿½ï¿½o<br> Sushi enrolado com cream chesse e..<br><br>Valor:</div>
    <div class="grid-promocao-img2" value="Imagens/Promoï¿½ï¿½o/imagem03.jpg"></div>
  </div>
  </div> --> 

  <!--  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="4" onclick="setaImagem(id)">
    <div class="grid-item-dsc">Descriï¿½ï¿½o<br> Arroz marinado, enrolado com...<br><br>Valor:</div>
    <div class="grid-promocao-img3" value="Imagens/Promoï¿½ï¿½o/imagem04.jpg"></div>
  </div> 
  </div> -->

  <!--  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="5" onclick="setaImagem(id)">
    <div class="grid-item-dsc">Descriï¿½ï¿½o<br> Enrolado de arroz com pele de peixe...<br><br>Valor:</div>
    <div class="grid-promocao-img4" value="Imagens/Promoï¿½ï¿½o/imagem05.jpg"></div>
  </div>
  </div> -->

  </div>

</div>




<!--GRID PROMOï¿½ï¿½O-->

<!-- GRID ENTRADAS -->
   <div class="entradas-container">
  <div class="titulo"><h2>Entradas</h2></div>
  <div class="grid-container no-margin no-padding">
  <%
      int cont2 = 6;
      List<Produto> produtos2 = new ArrayList<Produto>();
	  ProdutoDAO dao3 = new ProdutoDAO();  
	  produtos2 = ProdutoDAO.listarProdutos(2);
      for(Produto p: produtos2){ 
      %>
  <div class="grid-item z-index grow no-margin no-padding">
  <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="<%= cont2 %>" value="<%= p.getPreco() %>" onclick="setaModal(id)">
    <div class="grid-item-dsc"><strong><%= p.getNome() %></strong><br><%= p.getDescricao() %><br><br>Valor: <%= p.getPreco() %> R$</div>
   <input type="hidden" name="NomeEscondido" value="<%= p.getNome() %>" id="hiddenNome">
    <div class="grid-item-entradas1" value="<%= p.getUrl() %>" id="entradas1"><img class="img-background-properties" src="<%= p.getUrl() %>"/></div>
    
  </div>
  </div>
  <% cont2++;
  } %>


<!--  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="7" onclick="setaImagem(id)">
    <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Frango xadrez com molho de ...<br><br>Valor</div>
    <div class="grid-item-entradas2" value="Imagens/Entradas/Entrada02.jpg"></div>
  </div>
  </div> -->

 <!--   <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="8" onclick="setaImagem(id)">
     <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Rolinho de primavera chinï¿½s com ...<br><br>Valor</div>
    <div class="grid-item-entradas3" value="Imagens/Entradas/Entrada03.jpg"></div>
  </div> 
  </div> --> 

<!--    <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="9" onclick="setaImagem(id)">
    <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Tempurï¿½ de camarï¿½o com salgado ...<br><br>Valor</div>
    <div class="grid-item-entradas4" value="Imagens/Entradas/Entrada04.jpg"></div>
  </div>
  </div> -->

<!--  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="10" onclick="setaImagem(id)">
     <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Moqueca de lula com soja e ...<br><br>Valor</div>
    <div class="grid-item-entradas5" value="Imagens/Entradas/Entrada05.jpg"></div>
  </div> 
  </div> -->

  </div>

</div>
<!-- GRID ENTRADAS -->

<!-- GRID TEMAKI-->
<div class="temaki-container" >
  <div class="titulo"><h2>Temakis</h2></div>
  <div class="grid-container no-margin no-padding">
 <%
      int cont3 = 11;
      List<Produto> produtos3 = new ArrayList<Produto>();
	  ProdutoDAO dao4 = new ProdutoDAO();  
	  produtos3 = ProdutoDAO.listarProdutos(3);
      for(Produto p: produtos3){ 
      %>
  <div class="grid-item z-index grow no-margin no-padding">

  <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="<%= cont3 %>" value="<%= p.getPreco() %>" onclick="setaModal(id)">
     <div class="grid-item-dsc"><strong><%= p.getNome() %></strong><br><%= p.getDescricao() %><br><br>Valor: <%= p.getPreco() %> R$</div>
   <input type="hidden" name="NomeEscondido" value="<%= p.getNome() %>" id="hiddenNome">
    <div class="grid-item-temaki1" value="<%= p.getUrl() %>" id=""><img class="img-background-properties" src="<%= p.getUrl() %>"/></div>
  </div>

  </div>
 <% cont3++;
 } %>
  
 <!--  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="12" onclick="setaImagem(id)">
    <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Temaki com patï¿½ de atum...<br><br>Valor:</div>
    <div class="grid-item-temaki2" value="Imagens/Temaki/temaki02.jpg"></div>
  </div>
  </div> -->

  <!--  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="13" onclick="setaImagem(id)">
    <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Temaki cru feito com...<br><br>Valor:</div>
    <div class="grid-item-temaki3" value="Imagens/Temaki/temaki03.jpg"></div>
  </div>
  </div>  -->

 <!--   <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="14" onclick="setaImagem(id)">
    <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Temaki frito com peixe e maionese...<br><br>Valor:</div>
    <div class="grid-item-temaki4" value="Imagens/Temaki/temaki04.jpg"></div>
  </div>
  </div> -->

<!--  
  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="15" onclick="setaImagem(id)">
    <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Temaki de salmï¿½o com cebola e pepino...<br><br>Valor:</div>
    <div class="grid-item-temaki5" value="Imagens/Temaki/temaki05.jpg"></div>
  </div>
  </div> -->

  </div>

</div>
<!--GRID TEMAKI-->


<!-- GRID WASABI-->
<div class="wasabi-container">
  <div class="titulo"><h2>Wasabi Holl</h2></div>
  <div class="grid-container no-margin no-padding">

  <%
      int cont4 = 16;
      List<Produto> produtos4 = new ArrayList<Produto>();
	  ProdutoDAO dao5 = new ProdutoDAO();  
	  produtos4 = ProdutoDAO.listarProdutos(4);
      for(Produto p: produtos4){ 
      %>
  <div class="grid-item  grow no-margin no-padding">

  <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="<%= cont4 %> %>" value="<%= p.getPreco() %>" onclick="setaModal(id)">
   <div class="grid-item-dsc"><strong><%= p.getNome() %></strong><br><%= p.getDescricao() %><br><br>Valor: <%= p.getPreco() %> R$</div>
   <input type="hidden" name="NomeEscondido" value="<%= p.getNome() %>" id="hiddenNome">
    <div class="grid-item-wasabi1" value="<%= p.getUrl() %>" id=""><img class="img-background-properties" src="<%= p.getUrl() %>"/></div>
  </div>

  </div>
<% cont4++;  
}
%>

<!--  
  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="17" onclick="setaImagem(id)">
   <div class="grid-item-dsc"> <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Wasabi especial com...<br><br>Valor:</div></div>
    <div class="grid-item-wasabi2" value="Imagens/HollWasabi/HollWasabi02.jpg"></div>
  </div>
  </div> -->

  <!--  
  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="18" onclick="setaImagem(id)">
    <div class="grid-item-dsc"> <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Receita de Wasabi Fit com...<br><br>Valor:</div></div>
    <div class="grid-item-wasabi3" value="Imagens/HollWasabi/HollWasabi03.jpg"></div>
  </div>
  </div> -->  

  <!--  
  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="19" onclick="setaImagem(id)">
    <div class="grid-item-dsc"> <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Barca com 20 wasabis...<br><br>Valor:</div></div>
    <div class="grid-item-wasabi4" value="Imagens/HollWasabi/HollWasabi04.jpg"></div>
  </div>
  </div> -->

<!--  
  <div class="grid-item no-margin no-padding">
    <div class="card-components" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id ="20" onclick="setaImagem(id)">
  <div class="grid-item-dsc"> <div class="grid-item-dsc">Descriï¿½ï¿½o<br>Wasabi com molho de gengibre...<br><br>Valor:</div></div>
    <div class="grid-item-wasabi5" value="Imagens/HollWasabi/HollWasabi05.jpg"></div>
  </div>
  </div> -->

  </div>

</div>


<!-- GRID WASABI -->



</div>
  



        <script>
        
        	  $(document).ready(function () {
        		 
                  $('#criarSacola').click(function (event) { 
                	  
                      var nome = $('#nome').val();                    
                      var valor = $('#valor').val();
                      var id = $('#hiddenInput').val();
                      var tipoRequisicao = '1';
                      var ativo ='1';
                      $.post('http://localhost:8006/ProjetoWeb/ServletSacola', {valor: valor, id: id, nome: nome, TipoRequisicao : tipoRequisicao, ativo: ativo}, function (responseText) {
                          var items = document.getElementById('items');        
                          items.innerHTML ="";
                          items.innerHTML = responseText;
                      });
                      
                  });

                 
                 
              });

              function deletar(id){
            	 
                  var ProdutoSacolaID = id;
                  console.log(ProdutoSacolaID);
                  var tipoRequisicao = '2';
                  $.post('http://localhost:8006/ProjetoWeb/ServletSacola', { ProdutoSacolaID : ProdutoSacolaID, TipoRequisicao : tipoRequisicao}, function (responseText) {
                      if(responseText != null){
                      var div = document.getElementById(id);
                      div.parentElement.parentElement.parentElement.style.display = 'none';
                      }
                  });

                  }
        	  
        </script>

 
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  </body>
</html>