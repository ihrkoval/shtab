<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<head>
     <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
 <div class="well">
<div class="container-fluid">
 
 <div class="panel panel-primary col-sm-4">
  
    <div class="panel-heading">Додати місто</div>
    <div class="panel-body">
    <form role="form" enctype="multipart/form-data" class="form-signin" action="./cityadd" method="post">
    <p><th scope="col"><input id="id" type="hidden" class="form-control" name = "id"  aria-describedby="basic-addon1">
    <input id="name" type="text" class="form-control" placeholder="Назва" name = "name" aria-label="name" aria-describedby="basic-addon1"></input>
    </p>
    <p><input type="text" id = "rayon" class="form-control" placeholder="Район" name = "rayon" aria-label="rayon" aria-describedby="basic-addon1"></p>
    <p><input id = "oblast" type="text" class="form-control" placeholder="Область" name = "oblast" aria-label="oblast" aria-describedby="basic-addon1"></p>
    <p> <button type="submit" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-ok"></span>Ok</button> </p>

   </div>
  </div>	

  <div class="panel panel-primary col-sm-8" >
    <div class="panel-heading">Населені пункти</div>
    <div class="panel-body pre-scrollable">
    <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">Назва</th>
      <th scope="col">Районний центр</th>
      <th scope="col">Областний центр</th>
      <th scope="col">функ.</th>
    </tr>
     <tr>
 
    </tr>
  </thead>
  <tbody id = "tbody">
   
  </tbody>
</table>
    </div>
  </div>
  </div>
  <!-- TABLE WITH CitiesS -->
  
 
  <script>
  function editFunction(obj){
  	
  	console.log("ID IS "+obj);
  	var city = getCitById(obj);
  	 // document.getElementById("id").innerHTML = field.city_id;
  	 //document.getElementById("name").innerHTML = field.city_name;
  	 //ocument.getElementById("oblast").innerHTML = field.oblast;
  	 //ocument.getElementById("rayon").innerHTML = field.rayon; */
  }

  function getCitById(citId){
		 jQuery.ajax({
		        url: './getCityById?id='+citId,
		        method: 'GET',
          statusCode: {
              200: function(response) {
					 
                 
                  alert(JSON.stringify(response));
              },
              500: function() {
                  
                  alert("ОШИБКА!");
              }
          }
      });
	}
  
$(document).ready(function(){
	
        $.getJSON("./getAllCities", function(result){
            $.each(result, function(i, field){
                //$("divb").append(JSON.stringify(field) + " ");
                console.log(JSON.stringify(field));
                              const agentTopObj = field;
                              console.log(field.rayoun + "  "+field.oblast);
                              var table = document.getElementById("tbody");
                              var tblTr = document.createElement("tr");
                              
                              var tblTh = document.createElement("th");
                              tblTh.innerHTML = field.city_id;
                              var tblTd = document.createElement("td");
                              tblTd.innerHTML = field.city_name+" name"; 
                              var tblTd1 = document.createElement("td");
                             
                              tblTd1.innerHTML = field.rayoun;
                              var tblTd2 = document.createElement("td");
                              tblTd2.innerHTML = field.oblast+" obl";
                             
                              var tblTd3 = document.createElement("td");
                             
                              tblTd3.innerHTML =  '<button type="submit" class="btn btn-info btn-sm" onclick="editFunction('+field.city_id+')">'+
                              '<span class="glyphicon glyphicon-pencil"></span></button>'+
                              '<button type="submit" class="btn btn-danger btn-sm" onclick="delFunction('+field.city_id+')">'+
                              '<span class="glyphicon glyphicon-remove"></span></button>';                             
                              table.appendChild(tblTr);
                              tblTr.appendChild(tblTh);
                              tblTr.appendChild(tblTd);
                              tblTr.appendChild(tblTd1);
                              tblTr.appendChild(tblTd2);
                              tblTr.appendChild(tblTd3); 
        });
          
         	 
           
    });
       
});
</script>
</div>

<div class="well">
<div class="container-fluid">
<div class="panel panel-info col-sm-2">
    <div class="panel-heading">Додати партію</div>
    <div class="panel-body">
    <form role="form" enctype="multipart/form-data" class="form-signin" action="./partyadd" method="post">
    <p><th scope="col"><input id="id" type="hidden" class="form-control" name = "id"  aria-describedby="basic-addon1">
    <input id="name" type="text" class="form-control" placeholder="Назва" name = "name" aria-label="name" aria-describedby="basic-addon1"></input>
    </p>
    <p> <button type="submit" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-ok"></span>Ok</button> </p>

   </div>
  </div>
  
  <div class="panel panel-info col-sm-2">
  <div class="panel-heading">Партії</div>
    <div class="panel-body">
    	 <div class="panel-body pre-scrollable">
    <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">Назва</th>
      <th scope="col">функ.</th>
    </tr>
     <tr>
 
    </tr>
  </thead>
  <tbody id = "tparty">
   
  </tbody>
</table>
    </div>
    </div>
  </div>
</div>


<div class="container-fluid">
<div class="panel panel-info col-sm-2">
    <div class="panel-heading">Додати мажоритарника</div>
    <div class="panel-body">
    <form role="form" enctype="multipart/form-data" class="form-signin" action="./partyadd" method="post">
    <p><th scope="col"><input id="id" type="hidden" class="form-control" name = "id"  aria-describedby="basic-addon1">
    <input id="name" type="text" class="form-control" placeholder="Назва" name = "name" aria-label="name" aria-describedby="basic-addon1"></input>
    </p>
    <p> <button type="submit" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-ok"></span>Ok</button> </p>

   </div>
  </div>
  
  <div class="panel panel-info col-sm-2">
  <div class="panel-heading">Мажоритарники</div>
    <div class="panel-body">
    	 <div class="panel-body pre-scrollable">
    <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">Назва</th>
      <th scope="col">функ.</th>
    </tr>
     <tr>
 
    </tr>
  </thead>
  <tbody id = "tparty">
   
  </tbody>
</table>
    </div>
    </div>
  </div>
</div>

</div>

</body>