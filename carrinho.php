<?php
    session_start();
    include('ligaDados.php');
    $db = new ligaDados();
    $dados = $db->listar_carrinho($_SESSION['session_id']); 
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
                <h2 style="color:#FFF;" align="center">O Meu Carrinho</h2>
                </td>
            </tr>

            <tr>
              <th align='center'>Nº Artigo</th>
              <th align='center'>Imagem</th>
              <th align='center'>Descrição</th>
              <th align='center'>Preço(€)</th>
              <th align='center'>Apagar</th>
            </tr>
              <?php 
              $cont = 1;
              $total = 0;
                foreach ($dados as $registo) {
                    
                  echo "<tr><td align='center'>{$cont}</td>";
                  echo "<td align='center'><img src='{$registo['imagem']}' width='180px'></td>";
                  echo "<td align='center'>{$registo['marca']}<br>{$registo['modelo']}<br>{$registo['descricao']}</td>";   
                  echo "<td align='center'>{$registo['preco']}</td>";
                  echo "<td align='center'><a href='registar.php?apC=". htmlspecialchars($registo['n_produto'], ENT_QUOTES) .
                     "&s=" . htmlspecialchars($_SESSION['session_id'], ENT_QUOTES) . "'><img src=\"imagens/Delete.png\" width=\"30\" height=\"27\"/></a></td>";
                  echo "</tr>";
                  $cont++;
                  $total = $total + $registo['preco'];
                }
              ?>
          </table>

          <h2> Total a pagar:</h2>
          <p><?php echo ($total); ?></p>
        </div>
       
      </section>
          
    </main>

    <footer>
        <h5>Site feito no âmbito da PAF - 2025</h5>
        <img src="imagens/logos.png" alt="Logos" />
    </footer>
  </div>
</body>
</html>

<script src="script.js"></script>