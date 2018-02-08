<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  

    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
  
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed)
    .row.content {height: 450px}  */
    
    /* Set gray background color and 100% height 
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
      
    }  */
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}  */
    }
  </style>
  
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a id="menu-toggle" class="navbar-brand" href="#">Меню >></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#" onClick='document.getElementById("ifr").src="admin";'>Ключова інформація</a></li>
        <li><a href="#" onClick='document.getElementById("ifr").src="addplace";'>Місця</a></li>
        <li><a href="#">Projects</a></li>
        <li></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"  onClick='document.getElementById("ifr").src="admin";'><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">  
  <div id="wrapper">  
  <div class="row content">
    <div class="sidenav">
     <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                 
                    <a href="#"  onClick='document.getElementById("ifr").src="./electresult"; document.getElementById("ifr").src="./electresult";'>Результати виборів</a>
                </li>
                <li>
                    <a href="#">Агітпродукція</a>
                </li>
                <li>
                    <a href="#">Місця агітпродукції</a>
                </li>
                <li>
                    <a href="#">Газета</a>
                </li>
                <li>
                    <a href="#">Зустрічі</a>
                </li>
                <li>
                    <a href="#">Поздоровлення</a>
                </li>
                <li>
                    <a href="#">Гуманітарка</a>
                </li>
                <li>
                    <a href="#">МАГ</a>
                </li>
                <li>
                    <a href="#">Активісти</a>
                </li>
                <li>
                    <a href="#">Фермери</a>
                </li>
                <li>
                    <a href="#">ДВК</a>
                </li>
                <li>
                    <a href="#">Листоноши</a>
                </li>
            </ul>
        </div>
    </div>
    

    <iframe id = "ifr" width="100%" height="900vh" src="./electresult"></iframe>



  </div>
</div>
</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
<script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
</body>
</html>
