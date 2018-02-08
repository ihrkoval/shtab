<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Sidebar - Start Bootstrap Template</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	
  
 <!-- Bootstrap core CSS   -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
  

    <!-- Custom styles for this template  -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
   
    
     
</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#" onClick='document.getElementById("ifr").src="admin";'>
                        Адміністрування
                    </a>
                </li>
                <li>
                    <a href="#">Результати виборів</a>
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
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        
     
        
        <div id="page-content-wrapper">
                
            <div class="container-fluid">
             <div class="collapse navbar-collapse" id="myNavbar">
      
    </div>
       			<div>
       			 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">>></a></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Page 1</a></li>
      <li><a href="#">Page 2</a></li>
      <li><a href="#">Page 3</a></li>
    </ul>
  </div>
</nav>
</div>
              <div><iframe id = "ifr" width="100%" height="900vh" src="./electresult"></iframe></div>
            </div>
            
           
            
                           
        <!-- /#page-content-wrapper -->
           	
        
    

    </div>
            

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   

    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
       if (document.getElementById("menu-toggle").textContent == '>>'){
    	   document.getElementById("menu-toggle").textContent = '<<';
    	 

       } else
       {
    	   document.getElementById("menu-toggle").textContent = '>>';
       } 
    });
    
  
    </script>
    
   
    <!-- /#wrapper -->

    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="resources/js/vendor/jquery.min.js"><\/script>')</script>

</body>
</html>
