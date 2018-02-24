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

                $.getJSON("./getAllPlaces", function(result){
                    $.each(result, function(i, field){
                        var myLatlng = new google.maps.LatLng(field.lat, field.lng);
                        var icon = getIcon(field.type);

                        var txt = " ";
                        if (field.agit != null && field.agit.length > 1){

                            txt=field.agit;
                        }


                      var m =  new google.maps.Marker({
                            position: myLatlng,
                            map: map,
                            label: {
                                text: txt,
                                fontWeight: "bold",
                                color: "blue"
                            },
                            icon: icon
                        });


                        m.addListener('click', function() {

                           document.getElementById("pid").value = field.id;
                           document.getElementById("ptype").value = field.type;
                           document.getElementById("num").value = field.num;
                           document.getElementById("name").value = field.name;
                           document.getElementById("citnames").value = field.city.city_name;
                           document.getElementById("agit").value = field.agit;
                           document.getElementById("lat").value = field.lat;
                           document.getElementById("lng").value = field.lng;
                        });

                        google.maps.event.addListener(m, "rightclick",
                                function (point) {
                                    var r = confirm("Ви впевнені що хочете видалити "+field.type+"?");
                                    if (r == true) {
                                        $.getJSON("./delPlace?id="+field.id, function(result){});
                                        location.reload();
                                    } else {

                                    }
                                } );

                    });
                });



                <!-- IMAGES ICONS -->


                var zabor = {
                    path: 'M470.977,211.704v-53.241h-41.971V66.67l-29.691-41.192l-29.693,41.191v91.793h-49.832V66.67l-29.693-41.192   l-29.691,41.191v91.793h-49.833V66.67L180.88,25.479l-29.692,41.191v91.793h-49.833V66.67L71.662,25.479L41.97,66.67v91.793H0   v53.241h41.97v143.351H0v53.24h41.97v37.203h59.384v-37.203h49.833v37.203h59.384v-37.203h49.833v37.203h59.383v-37.203h49.834   v37.203h59.383v-37.203h41.971v-53.24h-41.971V211.704H470.977z M101.354,355.055V211.704h49.833v143.351H101.354L101.354,355.055z    M210.571,355.055V211.704h49.833v143.351H210.571L210.571,355.055z M369.621,355.055h-49.832V211.704h49.832V355.055z',
                    fillOpacity: 0.8,
                    scale: 0.07
                };


                var shop = {
                    path: 'M473.6,92.43c-8.7-10.6-21.9-16.5-35.6-16.5H140.7c-8.5,0-16.6,2.4-23.6,6.7l-15.2-53.1c-2.5-8.7-10.4-14.7-19.4-14.7H59.4   H15.3c-8.4,0-15.3,6.8-15.3,15.3v1.6c0,8.4,6.8,15.3,15.3,15.3h57.8l29.5,104.3l40.6,143.9c-23.1,5.8-40.2,26.7-40.2,51.5   c0,28.1,21.9,51.2,49.6,53c-2.3,6.6-3.4,13.9-2.8,21.4c2,25.4,22.7,45.9,48.1,47.6c30.3,2.1,55.6-22,55.6-51.8c0-6-1-11.7-2.9-17.1   h60.8c-2.5,7.1-3.5,15-2.6,23.1c2.8,24.6,23.1,44,47.9,45.8c30.3,2.1,55.7-21.9,55.7-51.8c0-28.9-24-52-52.8-52H156.5   c-9.9,0-18.3-7.7-18.7-17.5c-0.4-10.4,7.9-18.9,18.2-18.9h30.5h165.3h46.5c20.6,0,38.6-14.1,43.6-34.1l40.4-162.6   C485.8,117.83,482.6,103.53,473.6,92.43z M360.5,399.73c9.4,0,17.1,7.7,17.1,17.1s-7.7,17.1-17.1,17.1s-17.1-7.7-17.1-17.1   S351,399.73,360.5,399.73z M201.6,399.73c9.4,0,17.1,7.7,17.1,17.1s-7.7,17.1-17.1,17.1c-9.4,0-17.1-7.7-17.1-17.1   C184.5,407.43,192.1,399.73,201.6,399.73z M138.8,151.13l-7.8-27.5c-1.2-4.2,0.5-7.3,1.7-8.8c1.1-1.5,3.7-4,8-4h32.6l8.9,40.4   h-43.4V151.13z M148.6,185.93h41.2l8.2,37.4h-38.9L148.6,185.93z M186.5,293.53c-4.5,0-8.5-3-9.7-7.4l-7.9-28h36.7l7.8,35.3h-26.9   V293.53z M273.6,293.53H249l-7.8-35.3h32.3v35.3H273.6z M273.6,223.33h-40l-8.2-37.4h48.2V223.33z M273.6,151.13h-55.8l-8.9-40.4   h64.7V151.13z M336,293.53h-27.5v-35.3h34.9L336,293.53z M350.8,223.33h-42.3v-37.4h50.2L350.8,223.33z M308.5,151.13v-40.4h66   l-8.5,40.4H308.5z M408.2,285.93c-1.1,4.5-5.1,7.7-9.8,7.7h-26.8l7.5-35.3h36L408.2,285.93z M423.7,223.33h-37.3l7.9-37.4H433   L423.7,223.33z M448.5,123.23l-6.9,27.8h-40l8.5-40.4h28.6c4.3,0,6.8,2.4,7.9,3.9C447.8,116.03,449.6,119.13,448.5,123.23z',
                    fillOpacity: 0.8,
                    labelOrigin: new google.maps.Point(-12,-12),
                    scale: 0.05
                };


                var post = {
                    path: 'M511.646,126.634c-0.021-14.449-11.782-26.189-26.227-26.189c-0.012,0-0.024,0-0.034,0L26.19,101.076    c-7.005,0.009-13.588,2.746-18.535,7.706C2.709,113.743-0.009,120.334,0,127.337l0.355,258.029    c0.009,7.005,2.746,13.588,7.706,18.535c4.951,4.938,11.526,7.655,18.519,7.655c0.012,0,0.025,0,0.035,0l459.194-0.631    c14.458-0.02,26.207-11.799,26.19-26.261L511.646,126.634z M456.611,126.71L256.02,266.154L55.04,127.262L456.611,126.71z     M340.846,292.471l118.971,92.265l-407.972,0.56l119.696-92.825c5.722-4.439,6.764-12.675,2.326-18.399    c-4.439-5.722-12.675-6.764-18.399-2.326L26.561,371.715l-0.32-232.475l222.344,153.657c2.244,1.551,4.849,2.325,7.455,2.325    c2.617,0,5.236-0.783,7.485-2.346l221.912-154.264l0.336,233.066l-128.856-99.931c-5.719-4.437-13.959-3.396-18.397,2.326    C334.081,279.795,335.122,288.033,340.846,292.471z',
                    fillOpacity: 0.8,
                    labelOrigin: new google.maps.Point(-12,-12),
                    scale: 0.05
                };

                var bus = 'http://maps.google.com/mapfiles/ms/micons/bus.png';

                var silrada = 'http://maps.google.com/mapfiles/ms/micons/homegardenbusiness.png';
                var bazar = 'http://maps.google.com/mapfiles/ms/micons/groecerystore.png';

                var bilboard = {
                    path: 'M130.446,199.333H68.888c-1.025,0-1.946-0.626-2.324-1.579s-0.135-2.041,0.612-2.743l18.99-17.842v-60.212h-75.5  c-1.381,0-2.5-1.119-2.5-2.5v-86.25c0-1.381,1.119-2.5,2.5-2.5h35.789l-8.457-15.528l-0.864,5.56  c-0.189,1.217-1.238,2.115-2.471,2.115H24.497c-0.825,0-1.598-0.407-2.063-1.089c-0.466-0.681-0.565-1.548-0.267-2.317l5-12.854  C27.541,0.633,28.466,0,29.497,0h7.115c0.235,0.002,0.47,0.024,0.695,0.084c0,0,0.005,0.002,0.008,0.002  c0.002,0.002,0.003,0.002,0.007,0.002c0.003,0.002,0.006,0,0.008,0.003c0.002,0,0.003,0,0.005,0.001h0.001  c0.003,0.001,0.006,0.002,0.009,0.003l0,0c0.005,0.001,0.011,0.003,0.015,0.004h0.001c0.004,0.001,0.008,0.002,0.01,0.003  c0.005,0.002,0.011,0.005,0.016,0.005c0.004,0.002,0.006,0.002,0.01,0.003c0.002,0,0.005,0.001,0.009,0.003c0.001,0,0.001,0,0.001,0  c0.004,0.001,0.007,0,0.008,0.003c0.573,0.18,1.084,0.565,1.409,1.122c0.015,0.025,0.028,0.051,0.042,0.076l13.285,24.394h95.036  L160.47,1.314c0.014-0.025,0.027-0.051,0.042-0.076c0.312-0.532,0.793-0.909,1.337-1.099c0.001,0,0.002,0.001,0.005-0.002  c0.073-0.025,0.147-0.047,0.224-0.065c0.002,0,0.003-0.001,0.005-0.001h0.001c0.208-0.051,0.422-0.074,0.639-0.07h7.114  c1.031,0,1.956,0.633,2.33,1.594l5,12.854c0.299,0.77,0.199,1.637-0.267,2.317c-0.466,0.682-1.238,1.089-2.063,1.089h-10.166  c-1.232,0-2.281-0.898-2.471-2.115l-0.864-5.56l-8.457,15.528h35.788c1.381,0,2.5,1.119,2.5,2.5v86.25c0,1.381-1.119,2.5-2.5,2.5  h-75.5v60.212l18.991,17.842c0.747,0.702,0.99,1.79,0.612,2.743C132.392,198.707,131.471,199.333,130.446,199.333z M113.167,194.333  h10.967l-10.967-10.304V194.333z M91.167,194.333h17v-77.376h-17V194.333z M75.2,194.333h10.967V184.03L75.2,194.333z   M110.667,111.957h75.5v-81.25h-37.45c-0.034,0.001-0.065,0.001-0.096,0H50.714c-0.03,0.001-0.062,0.001-0.096,0H13.167v81.25  H110.667z M166.811,12.854h4.37L168.127,5h-2.537L166.811,12.854z M28.152,12.854h4.371L33.745,5h-2.538L28.152,12.854z   M180.334,103H19.001c-1.381,0-2.5-1.119-2.5-2.5v-65c0-1.381,1.119-2.5,2.5-2.5h161.333c1.381,0,2.5,1.119,2.5,2.5v65  C182.834,101.881,181.715,103,180.334,103z M21.501,98h156.333V38H21.501V98z',
                    fillOpacity: 0.8,
                    scale: 0.17
                };

                var school = 'http://maps.google.com/mapfiles/ms/micons/rangerstation.png';

                var kinder = {
                    path: 'M439.5,448h-16.938c-0.252,0-0.465-0.188-0.497-0.438L368.694,20.585C367.227,8.85,357.202,0,345.375,0h-227.75  c-11.827,0-21.852,8.85-23.318,20.585L40.934,447.562c-0.031,0.25-0.245,0.438-0.497,0.438H23.5c-4.142,0-7.5,3.357-7.5,7.5  s3.358,7.5,7.5,7.5h16.938c7.801,0,14.413-5.837,15.38-13.577L106.121,47H184v201.441c-13.881,7.232-16,17.486-16,23.059v40  c0,10.336,6.71,19.128,16,22.266V352h-0.5c-9.573,0-17.821,5.756-21.481,13.987c-1.844-1.561-3.019-3.888-3.019-6.487v-16  c0-12.958-10.542-23.5-23.5-23.5c-4.142,0-7.5,3.357-7.5,7.5s3.358,7.5,7.5,7.5c4.687,0,8.5,3.813,8.5,8.5v16  c0,10.681,7.165,19.714,16.939,22.561C163.786,391.835,172.819,399,183.5,399h96c10.681,0,19.714-7.165,22.561-16.939  C311.835,379.214,319,370.181,319,359.5v-16c0-4.687,3.813-8.5,8.5-8.5c4.142,0,7.5-3.357,7.5-7.5s-3.358-7.5-7.5-7.5  c-12.958,0-23.5,10.542-23.5,23.5v16c0,2.599-1.175,4.926-3.019,6.487C297.321,357.756,289.072,352,279.5,352H279v-18.234  c9.29-3.138,16-11.93,16-22.266v-40c0-5.574-2.119-15.827-16-23.059V47h77.879l50.303,402.423c0.967,7.74,7.58,13.577,15.38,13.577  H439.5c4.142,0,7.5-3.357,7.5-7.5S443.642,448,439.5,448z M264,15v17h-65V15H264z M107.996,32l1.194-9.555  c0.53-4.244,4.156-7.445,8.434-7.445H184v17H107.996z M288,375.5c0,4.687-3.813,8.5-8.5,8.5h-96c-4.687,0-8.5-3.813-8.5-8.5  s3.813-8.5,8.5-8.5h96C284.187,367,288,370.813,288,375.5z M199,352v-17h65v17H199z M280,311.5c0,4.687-3.813,8.5-8.5,8.5h-80  c-4.687,0-8.5-3.813-8.5-8.5v-40c0-7.611,12.702-16.5,48.5-16.5s48.5,8.889,48.5,16.5V311.5z M264,243.144  c-8.998-2.087-19.863-3.144-32.5-3.144s-23.502,1.057-32.5,3.144V47h65V243.144z M279,32V15h66.375c4.278,0,7.904,3.201,8.435,7.446  L355.004,32H279z',
                    fillOpacity: 0.8,
                    scale: 0.07
                };

                var dk = {
                    url: './svg/dk.svg',
                    fillOpacity: 0.8,
                    scale: 0.07
                };


                function getIcon(placetype) {
                    if (placetype === 'Забор'){
                        return zabor;
                    }
                    if (placetype === 'Магазин'){
                        return shop;
                    }
                    if (placetype === 'Пошта'){
                        return post;
                    }
                    if (placetype === 'Зупинка'){
                        return bus;
                    }
                    if (placetype === 'Сіль. рада'){
                        return silrada;
                    }
                    if (placetype === 'Базар'){
                        return bazar;
                    }
                    if (placetype === 'Борд'){
                        return bilboard;
                    }
                    if (placetype === 'Школа'){
                        return school;
                    }
                    if (placetype === 'Дит. садок'){
                        return kinder;
                    }
                    if (placetype === 'БК'){
                        return dk;
                    }
                }
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
                                <option>Забор</option>
                                <option>Магазин</option>
                                <option>ФАП</option>
                                <option>Пошта</option>
                                <option>Сільська рада</option>
                                <option>Базар</option>
                                <option>Борд</option>
                                <option>Школа</option>
                                <option>Намет</option>
                                <option>Буд. прихильників</option>
                                <option>БК</option>
                            </select>
                        </div>
                            <p><input type="hidden" id = "pid" class="form-control" placeholder="pid" name = "id" aria-label="num" aria-describedby="basic-addon1"></p>
                            <p><input type="text" id = "num" class="form-control" placeholder="Номер" name = "num" aria-label="num" aria-describedby="basic-addon1"></p>
                            <p><input type="text" id = "name" class="form-control" placeholder="Назва" name = "name" aria-label="name" aria-describedby="basic-addon1"></p>
                            <p><input type="text" id = "agit" class="form-control" placeholder="Агітпродукція" name = "agit" aria-label="agit" aria-describedby="basic-addon1"></p>
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