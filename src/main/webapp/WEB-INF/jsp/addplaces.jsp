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



            function setLatLng(lat, lng) {
                console.log(lat+" "+lng)

            }






            function addMarker(location, map) {
                // Add the marker at the clicked location, and add the next-available label
                // from the array of alphabetical characters.

                var marker = new google.maps.Marker({
                    position: location,
                    label: labels[labelIndex++ % labels.length],
                    map: map
                });

                google.maps.event.addListener(marker, "rightclick",
                        function (point) {
                            marker.setMap(null); } );



                marker.addListener('click', function() {

                    marker.setMap(null);


                });
                document.getElementById("lat").value = marker.getPosition().lat();
                document.getElementById("lng").value = marker.getPosition().lng();

            }

        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2JeHQGYQyjgy_jO89fH4iJpa3GJYoedM&callback=initMap"
                async defer></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="resources/js/vendor/jquery.min.js"><\/script>')</script>
        <script type="text/javascript">
        </script>



        <div class="col-sm-2 sidenav" id="ads">
            <div class="container-fluid">
                <div class="panel panel-primary">
                    <div class="panel-heading">Додати місце</div>
                    <div class="panel-body">
                        <form role="form" enctype="multipart/form-data" class="form-signin" action="./placeadd" method="post">
                        <label for="citnames">Населений пункт: </label>
                        <input id="citnames" class="form-control" list="suggestions" name="city">
                        <datalist id="suggestions">
                        </datalist>

                        <div class="form-group">
                            <label for="ptype">Тип</label>
                            <select class="form-control" id="ptype" name="ptype">
                                <option>ДВК</option>
                                <option>Школа</option>
                                <option>ДК</option>
                                <option>Пошта</option>
                            </select>
                        </div>

                        <p><input type="text" id = "num" class="form-control" placeholder="Номер" name = "num" aria-label="num" aria-describedby="basic-addon1"></p>
                            <p><input type="text" id = "name" class="form-control" placeholder="Назва" name = "name" aria-label="name" aria-describedby="basic-addon1"></p>
                        <p>
                            <input type="text" id = "lat" class="form-control" placeholder="lat" name = "lat" aria-label="lat" aria-describedby="basic-addon1">
                            <input type="text" id = "lng" class="form-control" placeholder="lng" name = "lng" aria-label="lng" aria-describedby="basic-addon1">

                        </p>
                        <p><button type="submit" class="btn btn-success">Ok</button></p>
                    </form>
                    </div>
                </div>
                </div>
        </div>
    </div>
</div>
<script>

    var cities = {};
    $(document).ready(function(){

        $.getJSON("./getAllCities", function(result){
            cities = result;
            $.each(result, function(i, field){
                var cname =  document.createElement("option");
                cname.setAttribute("value", field.city_name);
                cname.innerHTML = field.id;
                document.getElementById("suggestions").appendChild(cname);


            });

        });
    });

</script>
</body>
</html>