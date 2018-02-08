<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<head>

    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     
    
</head>    
 <div>
 <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        /*width: 100%;*/
        height: 100vh;
      }

      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
 <div class="container-fluid">
<div id="map" class="panel col-sm-10"></div>
    						<script>
    						
    						var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    						var labelIndex = 0;
      						var map;
      						
      						var maj = { "heading":"смт Любимівка. 650341","izber":2317, "yavka":817, 
							  		    "results":[ {"name":"Хлань","result":337},
							  		    			{"name":"Мельничук","result":64},
							  		                {"name":"Збаровский","result":41}
							  		              ]
							  		                };
							  	
							  	var part = { "heading":"смт Любимівка. 650341","izber":2317, "yavka":273, 
							  		    "results":[ {"name":"БПП","result":35},
							  		    			{"name":"РП","result":12},
							  		                {"name":"ОБ","result":10}
							  		              ]
							  		                };

						  	
						  	
     						 function initMap() {
    							 	map = new google.maps.Map(document.getElementById('map'), {
          							center: {lat: 46.6800073, lng: 33.4441408},
          							zoom: 10
        							});
    							 	
    							 	  google.maps.event.addListener(map, 'click', function(event) {
    							 		    addMarker(event.latLng, map);
    							 		  });
      							}
     						 
     						
     						
     						function showFunction(obj) {
     								var table = document.getElementById("tableDiv");
     								tableDiv.removeChild(tableDiv.firstChild);
     								
					  		    	var tableTag = document.createElement("table");
					  		    	tableTag.className = "table";
					  		    	var tableBody =  document.createElement("tbody");
					  		    	tableBody.setAttribute("id", "resTable");
					  		    	table.appendChild(tableTag);
					  		    	tableTag.appendChild(tableBody);
     								
     								/*if(tableDiv.firstChild != null){
         								
         								}*/
     								
	     							document.getElementById("javk").innerHTML = obj.izber+'/'+obj.yavka;
	     							document.getElementById("firstHeading").innerHTML =obj.heading;
	     							 var results = obj.results;            
							  		    for (x in results) {
							  		    
							  		    	
							  		    	
							  		        var tRow = document.createElement("tr");
							  		    	var nameTd = document.createElement("td");
							  		    	var countTd = document.createElement("td");
							 
							  		        tableBody.appendChild(tRow);
							  		    	tRow.appendChild(nameTd);
							  		    	tRow.appendChild(countTd);
							  		    	nameTd.innerHTML = results[x].name;
							  		    	countTd.innerHTML = results[x].result;
							  		    }
	     					      }	   
							  
     						
     					      
     						 
     						function addMarker(location, map) {
     							  // Add the marker at the clicked location, and add the next-available label
     							  // from the array of alphabetical characters.
     				 var contentString = '<div id="content">'+			  	
      '<div id="siteNotice">'+
      '</div>'+
      '<h6 id="firstHeading" class="firstHeading"></h6>'+
      '<div id="bodyContent">'+
      '<p><button id="maj" type="button" class="btn btn-info btn-xs" onclick="showFunction(maj)">Мажор.</button><button href="#" id="party"  type="button" class="btn btn-basic btn-xs" onclick="showFunction(part)">Партії.</button></p>'+
      '<p id="javk"></p><p> </p>' +
      '<div id="tableDiv">'+
      '<script>showFunction(maj);<\/script>'+
      '</div>'+
      '</div>'+
      '</div>';
     

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

     							  
     							  var marker = new google.maps.Marker({
     							    position: location,
     							    label: labels[labelIndex++ % labels.length],
     							    map: map
     							  });
     							  
     							 marker.addListener('click', function() {
     								
     							    infowindow.open(map, marker);
     							   showFunction(maj);
     							   
     							  });
     							 
     							}
     						 
   									 </script>
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2JeHQGYQyjgy_jO89fH4iJpa3GJYoedM&callback=initMap"
    async defer></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="resources/js/vendor/jquery.min.js"><\/script>')</script>
    <script type="text/javascript">
    </script>
           


 <div class="col-sm-2 sidenav" id="ads">
	 <div class="well">
		 <div class="panel panel-info">
			 <div class="panel-heading">Режим перегляду</div>
			 <div class="panel-body"><button type="button" class="btn btn-primary">Мапа</button>
				 <button type="button" class="btn btn-success">Таблиця</button>
			 </div>
		 </div>
	 </div>

	 <div class="well">

		 <div class="panel panel-info">
			 <div class="panel-heading">По нас. пункту:</div>
			 <div class="panel-body">

				 <form role="form" enctype="multipart/form-data" class="form-signin" action="./getResultsByCity" method="post">
					 <p><input id = "nasp" type="text" class="form-control" placeholder="Нас.Пункт" name = "nasp" aria-label="nasp" aria-describedby="basic-addon1">
					 </p>

				 </form>


				 <table class="table table-striped">
					 1250 / 480
					 <thead>

					 </thead>
					 <tbody>
					 <tr>
						 <th scope="row">Хлань</th>
						 <td>56</td>
						 <td>12%</td>

					 </tr>
					 <tr>
						 <th scope="row">Пузань</th>
						 <td>32</td>
						 <td>9%</td>

					 </tr>
					 <tr>
						 <th scope="row">Хабарь</th>
						 <td>60</td>
						 <td>8%</td>

					 </tr>
					 </tbody>
				 </table>


			 </div>
		 </div>
	 </div>
 </div>
</div>
 </div>
        </body>
</html>