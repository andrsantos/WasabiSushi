
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tela de Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script type="text/javascript" src="script.js"></script>

  </head>
  <link rel="stylesheet" type="text/css" href="estilo.css">
  <body>
     
     <!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Cadastre-se</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">        
      <div class="cadastro-container-login">
       <form action="http://localhost:8006/ProjetoWeb/ClienteController" method="post">
         <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Email</span>
        <input type="text" name="email" class="form-control" placeholder="Digite seu email.." aria-label="Username" aria-describedby="basic-addon1">
        </div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Nome Completo</span>
        <input type="text" name="nome" class="form-control" placeholder="Nome completo..." aria-label="Username" aria-describedby="basic-addon1">
        </div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">CPF</span>
        <input type="text" name="cpf" class="form-control" placeholder="Digite seu cpf..." aria-label="Username" aria-describedby="basic-addon1" type="text" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" title="Digite um CPF no formato: xxx.xxx.xxx-xx" maxlength="14">
        </div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Telefone</span>
        <input type="text" name="telefone" class="form-control" placeholder="Digite seu número de telefone..." aria-label="Username" aria-describedby="basic-addon1" maxlength="13">
        </div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Senha</span>
        <input type="password" name="senha" class="form-control" placeholder="Digite sua senha..." aria-label="Username" aria-describedby="basic-addon1">
        </div>
        <div class="input-group margin-bottom">
        <span class="input-group-text">Endereço</span>
        <textarea class="form-control" name="endereco" aria-label="With textarea"></textarea>
        </div>
      	<input type="hidden" name="tipoformulario" value="cadastro">
        <input class="btn btn-dark full-width" type="submit" value="Cadastrar">
       </form>  
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>


     <div class="container-fluid d-flex no-margin no-padding flow align-items-center justify-content-center viewport-login"> 


     <div class="container-login d-flex flow">
       
    <div class="logo-login">
      <div class="logo-login-img"></div>

    </div>
    

    <div class="form-login">
        <form class="margin" method="post" action="http://localhost:8006/ProjetoWeb/ClienteController">
        <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Usuário</span>
        <input type="text" name="cpf" class="form-control" placeholder="CPF do usuário..." aria-label="Username" aria-describedby="basic-addon1"  maxlength="14">
        </div>

       <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">Senha</span>
       <input type="password" name="senha" class="form-control" placeholder="Senha do usuário" aria-label="Password" aria-describedby="basic-addon2">
       </div>
       <input type="hidden" name="tipoformulario" value="login">
       <input class="btn btn-dark full-width margin-bottom" type="submit" value="Fazer Login">
       <input class="btn btn-dark full-width margin-bottom" type="button" value="Registre-se agora!" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
      </form>
    </div> 

     </div>

















</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

  </body>
</html>
    