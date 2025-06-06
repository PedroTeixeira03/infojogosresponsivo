<?php
    session_start();
    include('ligaDados.php');
    $db = new ligaDados();

    $id = $_GET['id'] ?? null;

    if ($id && apcu_exists("dados_$id")) {
      $dados = apcu_fetch("dados_$id");
      apcu_delete("dados_$id");
  
    }
   else{
      $dados = $db->listar_produtos(); 
    } 
    
?>

<!DOCTYPE html>
<html lang="pt">
<head>
  <meta charset="UTF-8" />
  <title>InfoJogos</title>
  <link rel="icon" href="imagens/infojogosicon.png" type="image/x-icon">
  <link rel="stylesheet" href="css.css" />
</head>
<body class="home">
  <div class="wrapper">
    <header>
      <div class="container">
        <img src="imagens/infojogos.png">
        <nav>
          <ul>
            <li><a href="index.php">Home</a></li>
            <li><a href="produtos.php" class="active">Produtos</a></li>
              <?php if (isset($_SESSION['tipo']) && $_SESSION['tipo'] == 1) {
                  echo ('<li><a href="inserir.php">Inserir</a></li>');
              } ?>
            <li><a href="contactos.php">Contactos</a></li>
            <li>
                            <form method="post" action="registar.php">
                                <input type="text" name="search" class="search_box" required/>
                                 <button type="submit" name="pesq" class="search_button">
                                    <img src="imagens/search.png" alt="Enviar" width="30" height="27">
                                </button>
                            </form>
                        </li>
          </ul>
            <?php   
            if (isset($_SESSION['login'])) { 
              if (isset($_SESSION['tipo']) && $_SESSION['tipo'] == 2) {
                echo '<a href="carrinho.php"><img src="imagens/cart.png"/></a>';
              }
              echo '<form action="registar.php" method="post" >
                    <button class="login_button" type="submit" name="logout">Logout</button>
                    </form>';
            }else{
                echo '<button id="form-open" class="login_button">Login</button>';
            }  ?>
        </nav>
        <?php include ('login.php'); ?>
      </div>
    </header>

    <main>
      <section>
        <div id="tabela" class="mostrar">
          <table>
            <tr>
              <?php
              if (isset($_SESSION['tipo'])) {
                if ($_SESSION['tipo'] == 1 || $_SESSION['tipo'] == 0) {
                  echo '<td align="center" colspan="7">';
                } else {
                  echo '<td align="center" colspan="5">';
                }
              }
              ?>  
                <h2 style="color:#FFF;" align="center">Catálogo de jogos</h2>
                </td>
            </tr>

            <tr>
              <th align='center'>Marca</th>
              <th align='center'>Modelo</th>
              <th align='center'>Preço(€)</th>
              <th align='center'>Descrição</th>
              <th align='center'>Imagem</th>
              <?php
              if (isset($_SESSION['tipo'])) {
                if($_SESSION['tipo'] == 1) {
                echo "<th align='center'>Apagar</th><th align='center'>Atualizar</th>";
                }
                if($_SESSION['tipo'] == 2) {
                echo "<th align='center'>Comprar</th>";
                }
              }
              ?>
            </tr>
              <?php 
                foreach ($dados as $registo) {
                  echo "<tr><td align='center'>{$registo['marca']}</td>";
                  echo "<td align='center'>{$registo['modelo']}</td>";
                  echo "<td align='center'>{$registo['preco']}</td>";
                  echo "<td align='center'>{$registo['descricao']}</td>";
                  echo "<td align='center'><img src='{$registo['imagem']}' width='180px'></td>";
                  if($_SESSION){
                  if ($_SESSION['tipo'] == 1) {
                    echo "<td align='center'><a href='registar.php?ap={$registo['n_produto']}'><img src=\"imagens/Delete.png\" width=\"30\" height=\"27\"/></a></td>";
                    echo "<td align='center'><a onclick=\"mostrarEdicao('{$registo['n_produto']}')\"><img src=\"imagens/editar.png\" width=\"30\" height=\"27\"/></td>";
                  }
                  if ($_SESSION['tipo'] == 2) {
                    echo "<td align='center'><a href='registar.php?adS=" . htmlspecialchars($registo['n_produto'], ENT_QUOTES) .
                     "&u=" . htmlspecialchars($_SESSION['user'], ENT_QUOTES) . "&s=" . htmlspecialchars($_SESSION['session_id'], ENT_QUOTES) .
                     "'><img src='imagens/shopping.png' width='30' height='27'/></a></td>";
                  }
                  echo "</tr>";
                }}
              ?>
          </table>
        </div>
        <div id="editar" class="conteudo">
          <div class="form">
            <form action="registar.php" method="POST" enctype="multipart/form-data">
              <h2>Editar Produto</h2>

              <div id="update_form"> </div>  

              <div class="botao_centro">
                <p class="button_inserir" name="cancelar" onclick="alternarConteudo()">Cancelar</p>
                <button class="button_inserir" type="submit" name="atualizar">Atualizar</button>
              </div>
            </form>
          </div>
        </div>
      </section>
          
    </main>

    <footer>
        <h5>Site feito no âmbito da PAF do curso Programador Informático- 2025</h5>
        <img src="imagens/logos.png" alt="Logos" />
    </footer>
  </div>
</body>
</html>

<script src="script.js"></script>