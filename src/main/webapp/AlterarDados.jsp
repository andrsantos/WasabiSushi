<jsp:include page="topo.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="Imagens/Login/LoginLogo/LoginLogo.jpg"/>
    <title>Alterar Dados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script type="text/javascript" src="script.js"></script>

  </head>
  <link rel="stylesheet" type="text/css" href="estilo.css">
  <body>

     <div class="container-fluid d-flex no-margin no-padding flow align-items-center justify-content-center viewport-login"> 


     <div class="container-login d-flex flow fit-size" style="padding:1%;">
       
    
    <div class="cadastro-container-login">
       <form action="http://localhost:8006/ProjetoWeb/ClienteController" method="post">
         <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">EMAIL</span>
        <input type="text" name="email" class="form-control" placeholder="Digite seu email.." aria-label="Username" aria-describedby="basic-addon1" value = "<%= session.getAttribute("email") %>">
        </div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">NOME</span>
        <input type="text" name="nome" class="form-control" placeholder="Nome completo..." aria-label="Username" aria-describedby="basic-addon1" value = "<%= session.getAttribute("nome") %>">
        </div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">CPF</span>
        <input type="text" name="cpf" class="form-control" placeholder="Digite seu cpf..." aria-label="Username" aria-describedby="basic-addon1" value = "<%= session.getAttribute("cpf") %>" type="text" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" title="Digite um CPF no formato: xxx.xxx.xxx-xx" maxlength="14">
        </div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">TELEFONE</span>
        <input type="text" name="telefone" class="form-control" placeholder="Digite seu número de telefone..." aria-label="Username" aria-describedby="basic-addon1" maxlength="13" value = "<%= session.getAttribute("telefone") %>">
        </div>
        <div class="input-group margin-bottom">
        <span class="input-group-text">ENDEREÇO</span>
        <textarea class="form-control" name="endereco" aria-label="With textarea"><%= session.getAttribute("endereco") %></textarea>
         <input type="hidden" name="endereco" value = "<%= session.getAttribute("endereco") %>">
        </div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">CARTÃO</span>
        <input type="text" name="numerodecartao" class="form-control" placeholder="Digite seu número de cartão..." aria-label="Username" aria-describedby="basic-addon1" maxlength="13" value = "<%= session.getAttribute("numeroCartao") %>">
        </div>
        
        
      
      	<input type="hidden" name="tipoformulario" value="alterar">
        <input class="btn btn-dark full-width" type="submit" value="Alterar" style="margin-bottom:1%;">
        <button type="button" class="btn btn-dark full-width" data-bs-dismiss="modal" onclick="redireciona2()">Voltar para a loja</button>
       </form>  
      </div>
       

     </div>



</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

  </body>
</html>