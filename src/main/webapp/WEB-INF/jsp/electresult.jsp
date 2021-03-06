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

			/*var maj = { "heading":"смт Любимівка. 650341","izber":2317, "yavka":817,
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
			 */


			function initMap() {
				map = new google.maps.Map(document.getElementById('map'), {
					center: {lat: 46.6800073, lng: 33.4441408},
					zoom: 10
				});

				/*  google.maps.event.addListener(map, 'click', function(event) {
				 addMarker(event.latLng, map);
				 });*/
			}



			function showFunction(obj) {
				var table = document.getElementById("tableDiv"+obj.id);
				console.log(obj.id)
				if(table.firstChild != null) {
					table.removeChild(table.firstChild);
				}

				var tableTag = document.createElement("table");
				tableTag.className = "table";
				var tableBody =  document.createElement("tbody");
				tableBody.setAttribute("id", "resTable"+obj.id);
				table.appendChild(tableTag);
				tableTag.appendChild(tableBody);

				/*if(tableDiv.firstChild != null){

				 }*/

				document.getElementById("javk"+obj.id).innerHTML = obj.allcount+'/'+obj.yavka;
				document.getElementById("firstHeading"+obj.id).innerHTML =obj.title;
				var results = obj.parties;
				for (x in results) {



					var tRow = document.createElement("tr");
					var nameTd = document.createElement("td");
					var countTd = document.createElement("td");
					var prcntTd = document.createElement("td");
					tableBody.appendChild(tRow);
					tRow.appendChild(nameTd);
					tRow.appendChild(countTd);
					tRow.appendChild(prcntTd);
					var prcnt =results[x].votes/(obj.yavka / 100);
					nameTd.innerHTML = results[x].name;
					countTd.innerHTML = results[x].votes;
					prcntTd.innerHTML = parseFloat(prcnt).toFixed(2)+'%';
				}
			}

			function renderGlobals(gparts){
				var table = document.getElementById("globalTab");

				if(table.firstChild != null) {
					table.removeChild(table.firstChild);
				}

				var tableTag = document.createElement("table");
				tableTag.className = "table table-striped";
				table.appendChild(tableTag);
				var head = document.createElement("thead");
				head.innerHTML = gparts.allcount+'/'+gparts.yavka;
				tableTag.appendChild(head);
				var tbody = document.createElement("tbody");
				tableTag.appendChild(tbody);
				console.log(gparts.parties);

				var results = gparts.parties;
				for (x in results) {
					var tRowg = document.createElement("tr");
					var nameTdg = document.createElement("th");
					nameTdg.setAttribute("scope","row")
					var countTdg = document.createElement("td");
					var prcntTdg = document.createElement("td");
					tbody.appendChild(tRowg);
					tRowg.appendChild(nameTdg);
					tRowg.appendChild(countTdg);
					tRowg.appendChild(prcntTdg);
					var prcnt =results[x].votes/(gparts.yavka / 100);
					nameTdg.innerHTML = results[x].name;
					countTdg.innerHTML = results[x].votes;
					prcntTdg.innerHTML = parseFloat(prcnt).toFixed(2)+'%';
				}
			}




			/*function addMarker(location, map) {
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
			 }*/
			///////////////////////////////////////////////////////////////////////////////
			var markers = [];
			function renderResults(){
				markers.forEach(function(marker) {
					marker.setMap(null);
				});
				markers = [];
				var ptype = $(pt).children(":selected").attr("id");
				var citid = document.getElementById("citnames").value;
				var year = document.getElementById("year").value;
				var pot = $(po).children(":selected").attr("id");


				$.getJSON("./getResulttype?city_name="+citid+"&type="+ptype+"&year="+year+"&po="+pot, function(result){
					var rows = [];
					var globalCount = 0;
					var globalYavka = 0;
					var globalParties = [];

					$.each(result, function(i, field){
						var partia = field.partia;
						var place = field.place;
						var allcount = field.allcount;
						var yavka = field.yavka;


						if (rows.length === 0){
							var marker = {};
							marker.allcount = allcount;
							globalCount = globalCount + allcount;
							marker.yavka = yavka;
							globalYavka = globalYavka + yavka;
							marker.id = place.id;
							marker.title = place.num+' '+place.name;
							marker.lat = place.lat;
							marker.lng = place.lng;
							var parties = [];
							var mpartia = {};
							mpartia.name = partia.name;
							mpartia.votes = field.votes;
							parties.push(mpartia);
							marker.parties = parties;
							rows.push(marker);
						} else {
							var marker = {};
							var ind = 0;
							$.each(rows, function(i, rmarker){
								if (rmarker.id === place.id){
									var mpartia = {};
									mpartia.name = partia.name;
									mpartia.votes = field.votes;
									rmarker.parties.push(mpartia);
									ind =1;
								}
							});
							if(ind != 1) {
								var marker = {};
								marker.allcount = allcount;
								globalCount = globalCount + allcount;
								marker.yavka = yavka;
								globalYavka = globalYavka + yavka;
								marker.id = place.id;
								marker.title = place.num + ' ' + place.name;
								marker.lat = place.lat;
								marker.lng = place.lng;
								var parties = [];
								var mpartia = {};
								mpartia.name = partia.name;
								mpartia.votes = field.votes;
								parties.push(mpartia);
								marker.parties = parties;
								rows.push(marker);
								ind = 0;
							}
						}
					});
					rows.forEach(function(row) {
						var myLatlng = new google.maps.LatLng(row.lat, row.lng);

						if (globalParties.length === 0){
							globalParties = JSON.parse(JSON.stringify(row.parties));
							console.log('gp is 0')
						} else {
							for (var i = 0; i < globalParties.length; i++){
								for (var j = 0; j < row.parties.length; j++){
									if (globalParties[i].name === row.parties[j].name){
										globalParties[i].votes = globalParties[i].votes + row.parties[j].votes;
									}
								}
							}

						}

						var hlanis = -1;
						var icon = 'http://maps.google.com/mapfiles/ms/micons/red.png';

						var parties = row.parties;

						parties.sort(function (a, b){
							return b.votes - a.votes;
						});

						for (var i = 0; i < parties.length; i++){
							if (parties[i].name === 'Хлань'){
								hlanis = i}
						}

						if (hlanis === 0){
							icon = 'http://maps.google.com/mapfiles/ms/micons/green.png';
						} else

						if (hlanis === 1) {
							icon = 'http://maps.google.com/mapfiles/ms/micons/yellow.png';
						}

						var marker = new google.maps.Marker({
							position: myLatlng,
							map: map,
							icon: icon
						});
						var contentString = '<div id="content'+row.id+'">'+
								'<div id="siteNotice'+row.id+'">'+
								'</div>'+
								'<h6 id="firstHeading'+row.id+'" class="firstHeading"></h6>'+
								'<div id="bodyContent'+row.id+'">'+
								'<p id="javk'+row.id+'"></p><p></p>' +
								'<div id="tableDiv'+row.id+'">'+
								'</div>'+
								'</div>'+
								'</div>';
						console.log(contentString);
						var infowindow = new google.maps.InfoWindow({
							content: contentString
						});
						marker.addListener('click', function() {
							infowindow.open(map, marker);
							showFunction(row);
						});
						markers.push(marker);

					});

					var globals = {};
					globals.yavka = globalYavka;
					globals.allcount = globalCount;
					globals.parties = globalParties;
					console.log(globalParties);
					renderGlobals(globals);
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
					<div class="panel-body"><button type="submit" class="btn btn-primary" onclick="window.location.href='./electresult'">Мапа</button>
						<button type="submit" class="btn btn-success" onclick="window.location.href='./ellectrestab'">Таблиця</button>
					</div>
				</div>
			</div>



				<div class="panel panel-info">
					<div class="panel-heading">По: <select class="form-control" id = "po"  name="po" onchange="suggest()">
						<option value = "poc" id = "poc" selected = "selected">нас.пункту</option>
						<option value = "por" id = "por" >району</option>
						<option value = "pootg" id = "poo" >ОТГ</option>
					</select></div>
					<div class="panel-body">


						<p>
							<input id="citnames" class="form-control" list="suggestions"  placeholder="назва" name="city">
							<datalist id="suggestions">
							</datalist>

						</p>
						<p><input id = "year" type="text" class="form-control" placeholder="Рік" name = "date" aria-label="date" aria-describedby="basic-addon1">
						</p>
						<p>
							<select class="form-control" id = "pt"  name="ptype">
								<option value = "p" id = "p" selected = "selected">Партії</option>
								<option value = "m" id = "m" >Мажоритарники</option>
								<option value = "pr" id = "pr" >Президент</option>
							</select>

						</p>


						<div id = "globalTab" class = "small col-sm-1">

						</div>

					</div>

				</div>
				<button type="button" class="btn btn-success" onclick="renderResults()">Показати</button>

		</div>
	</div>
</div>
</body>
<script>
	var cities = {};
	var rayons = [];
	var otgs = [];
	$(document).ready(function(){
		$.getJSON("./getAllCities", function(result){
			cities = result;
			$.each(result, function(i, field){
				var cname =  document.createElement("option");
				cname.setAttribute("value", field.city_name);
				cname.setAttribute("name", field.id);
				cname.innerHTML = field.id;
				document.getElementById("suggestions").appendChild(cname);
			});
		});
	});

	function suggest() {
		var ptype = $(po).children(":selected").attr("id");
		$('#suggestions').empty();
		var label = 0;
		if (ptype === 'por'){
			cities.forEach(function(cit) {
			if(rayons.length === 0){
				var rayon = cit.rayon_name;
				rayons.push(rayon);

			} else {
				rayons.forEach(function(rayounInarr) {
					if(rayounInarr === cit.rayon_name){
						label = 0;
					} else {label = 1;}

				});
				if (label === 1){
					rayons.push(cit.rayon_name);
					label = 0;
				}
			}
			});
			renderSuggest(rayons);
		}

		if (ptype === 'poo'){

			cities.forEach(function(cit) {
				if(otgs.length === 0){
					var otg = cit.otg;
					otgs.push(otg);

				} else {
					otgs.forEach(function(otgInarr) {
						if(otgInarr === cit.otg){
							label = 0;
						} else {label = 1;}

					});
					if (label === 1){
						otgs.push(cit.otg);
						label = 0;
					}
				}
			});
			renderSuggest(otgs);
		}

		if (ptype === 'poc'){
			$.each(cities, function(i, field){
				var cname =  document.createElement("option");
				cname.setAttribute("value", field.city_name);
				cname.setAttribute("name", field.id);
				cname.innerHTML = field.id;
				document.getElementById("suggestions").appendChild(cname);
			});
		}

console.log(otgs);
	}

	function renderSuggest(arr) {
		$.each(arr, function(i, field){
			var cname =  document.createElement("option");
			cname.setAttribute("value", field);
			document.getElementById("suggestions").appendChild(cname);
		});

	}
</script>
</html>