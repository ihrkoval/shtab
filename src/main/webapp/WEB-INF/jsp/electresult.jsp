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
 <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        width: 100%;
        height: 90vh;
      }
       Optional: Makes the sample page fill the window.
      html, body {
        height: 85%;
        margin: 0;
        padding: 0;
      } 
    </style>
<div id="map"></div>
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
           
        </div>
        </body>  