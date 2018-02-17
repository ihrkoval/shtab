<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <script type="text/javascript" src="./vendor/moment/moment.js"></script>
    <script type="text/javascript" src="./vendor/moment/moment.min.js"></script>
    <script type="text/javascript" src="./vendor/moment/moment-with-locales.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./vendor/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="./vendor/bootstrap/css/bootstrap-datetimepicker.css" />
</head>

<body>
<div class="well">
    <div class="container-fluid">

        <div class="panel panel-primary col-sm-4">

            <div class="panel-heading">Додати місто
                <input   type="text" id="autocomplete" onFocus="geolocate()"  aria-label="name" class="form-control" aria-describedby="basic-addon1" placeholder="Швидкий пошук">
            </div>
            <div class="panel-body">

                <form role="form" enctype="multipart/form-data" class="form-signin" action="./cityadd" method="post">
                    <p><th scope="col"><input id="cid" type="hidden" class="form-control" name = "id"  aria-describedby="basic-addon1">
                    <input  type="text" id="locality" class="form-control" placeholder="Назва" name = "name" aria-label="name" aria-describedby="basic-addon1">
                    </p>
                    <p><input type="text" id = "administrative_area_level_2" class="form-control" placeholder="Район" name = "rayon" aria-label="rayon" aria-describedby="basic-addon1"></p>
                    <p><input  type="text" id = "administrative_area_level_1" class="form-control" placeholder="Область" name = "oblast" aria-label="oblast" aria-describedby="basic-addon1"></p>
                    <p><input id = "otg" type="text" class="form-control" placeholder="ОТГ" name = "otg" aria-label="otg" aria-describedby="basic-addon1"></p>
                    <p> <button type="submit" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-ok"></span>Ok</button> </p>
                </form>
                <input class="field" hidden="true" id="administrative_area_level_3"
                       disabled="true">
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
            getCitById(obj);

            //ocument.getElementById("oblast").innerHTML = field.oblast;
            //ocument.getElementById("rayon").innerHTML = field.rayon; */
        }

        function delFunction(cid) {
            jQuery.ajax({
                url: './delCity?id='+cid,
                method: 'GET',
                statusCode: {
                    200: function(response) {

                        renderCity(response);
                    },
                    500: function() {
                        alert("ОШИБКА!");
                    }
                }
            });
        }


        function getCitById(citId){
            jQuery.ajax({
                url: './getCityById?id='+citId,
                method: 'GET',
                statusCode: {
                    200: function(response) {
                        document.getElementById("cid").value = response.id;
                        document.getElementById("locality").value = response.city_name;
                        document.getElementById("administrative_area_level_1").value = response.oblast_name;
                        document.getElementById("administrative_area_level_2").value = response.rayon_name;
                        document.getElementById("otg").value = response.otg;
                    },
                    500: function() {
                        alert("ОШИБКА!");
                    }
                }
            });
        }

        function renderCity(citlist){
            $("#tbody").empty();
            $.each(citlist, function(i, field){
                //$("divb").append(JSON.stringify(field) + " ");
                console.log(JSON.stringify(field));
                const agentTopObj = field;
                console.log(field.rayoun + "  "+field.oblast_name);
                var table = document.getElementById("tbody");
                var tblTr = document.createElement("tr");
                var tblTh = document.createElement("th");
                tblTh.innerHTML = field.id;
                var tblTd = document.createElement("td");
                tblTd.innerHTML = field.city_name;
                var tblTd1 = document.createElement("td");
                tblTd1.innerHTML = field.rayon_name;
                var tblTd2 = document.createElement("td");
                tblTd2.innerHTML = field.oblast_name;
                var tblTd3 = document.createElement("td");
                tblTd3.innerHTML =  '<button type="submit" class="btn btn-info btn-sm" onclick="editFunction('+field.id+')">'+
                        '<span class="glyphicon glyphicon-pencil"></span></button>'+
                        '<button type="submit" class="btn btn-danger btn-sm" onclick="delFunction('+field.id+')">'+
                        '<span class="glyphicon glyphicon-remove"></span></button>';
                table.appendChild(tblTr);
                tblTr.appendChild(tblTh);
                tblTr.appendChild(tblTd);
                tblTr.appendChild(tblTd1);
                tblTr.appendChild(tblTd2);
                tblTr.appendChild(tblTd3);
            });

        }


        $(document).ready(function(){
            $.getJSON("./getAllCities", function(result){
                $.each(result, function(i, field){
                    //$("divb").append(JSON.stringify(field) + " ");
                    console.log(JSON.stringify(field));
                    const agentTopObj = field;
                    console.log(field.rayoun + "  "+field.oblast_name);
                    var table = document.getElementById("tbody");
                    var tblTr = document.createElement("tr");
                    var tblTh = document.createElement("th");
                    tblTh.innerHTML = field.id;
                    var tblTd = document.createElement("td");
                    tblTd.innerHTML = field.city_name;
                    var tblTd1 = document.createElement("td");
                    tblTd1.innerHTML = field.rayon_name;
                    var tblTd2 = document.createElement("td");
                    tblTd2.innerHTML = field.oblast_name;
                    var tblTd3 = document.createElement("td");
                    tblTd3.innerHTML =  '<button type="submit" class="btn btn-info btn-sm" onclick="editFunction('+field.id+')">'+
                            '<span class="glyphicon glyphicon-pencil"></span></button>'+
                            '<button type="submit" class="btn btn-danger btn-sm" onclick="delFunction('+field.id+')">'+
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
        <form role="form" enctype="multipart/form-data" class="form-signin" action="./partyadd" method="post">
            <div class="panel panel-info col-sm-3">

                <div class="panel-heading">

                    <div class="form-group">
                        <label for="pt">Хто?</label>
                        <select class="form-control" id = "pt"  name="ptype">
                            <option value = "p" id = "p" selected = "selected">Партії</option>
                            <option value = "m" id = "m" >Мажоритарники</option>
                            <option value = "pr" id = "pr" >Президент</option>
                        </select>
                    </div>

                </div>
                <div class="panel-body">

                    <p><th scope="col">
                    <input id="pid" type="hidden" class="form-control" name = "id"  aria-describedby="basic-addon1">
                    <input id="namep" type="text" class="form-control" placeholder="Назва кандидата" name = "pname" aria-label="namep" aria-describedby="basic-addon1">


                    <div class='input-group date' id='datetimepicker10'>
                        <input type='text' class="form-control" name="eldate"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar">
                    </span>
                </span>
                    </div>

                    <script type="text/javascript">
                        $(function () {
                            $('#datetimepicker10').datetimepicker({
                                viewMode: 'years',
                                format: 'YYYY',
                                locale: 'ru'
                            });
                        });
                    </script>

                </th></p>
                    <p> <button type="submit" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-ok"></span>Ok</button> </p>
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

                        <script>
                            $(document).ready(function(){
                                $.getJSON("./getallparties", function(result){
                                    $.each(result, function(i, field){
                                        var table = document.getElementById("tparty");
                                        var tblTr = document.createElement("tr");
                                        var tblTh = document.createElement("th");
                                        tblTh.innerHTML = field.id;
                                        var tblTd = document.createElement("td");
                                        tblTd.innerHTML = field.name;
                                        var tblTd1 = document.createElement("td");
                                        tblTd1.innerHTML = 'edit/delete';
                                        table.appendChild(tblTr);
                                        tblTr.appendChild(tblTh);
                                        tblTr.appendChild(tblTd);
                                        tblTr.appendChild(tblTd1);
                                    });
                                });
                            });
                        </script>

                        </tbody>
                    </table>

                </div>

            </div>
        </form>
    </div>
</div>
<script>
    var placeSearch, autocomplete;
    var componentForm = {
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        administrative_area_level_2: 'short_name',
        administrative_area_level_3: 'short_name'
    };

    function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
                /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
                {types: ['geocode']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
    }

    function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
            document.getElementById(component).value = '';
            document.getElementById(component).disabled = false;

        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
            var addressType = place.address_components[i].types[0];
            if (componentForm[addressType]) {
                var val = place.address_components[i][componentForm[addressType]];


                if (addressType === 'administrative_area_level_1' && val != null){
                    document.getElementById("administrative_area_level_1").value = val.split(' ')[0];
                } else
                if (addressType === 'administrative_area_level_2' && val != null){
                    document.getElementById("administrative_area_level_2").value = val.split(' ')[0];
                } else
                if (addressType === 'administrative_area_level_3' && val != null){
                    document.getElementById("administrative_area_level_2").value = val.split(' ')[0];
                } else { document.getElementById(addressType).value = val;}

            }
        }
    }

    // Bias the autocomplete object to the user's geographical location,
    // as supplied by the browser's 'navigator.geolocation' object.
    function geolocate() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var geolocation = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                var circle = new google.maps.Circle({
                    center: geolocation,
                    radius: position.coords.accuracy
                });
                autocomplete.setBounds(circle.getBounds());
            });
        }
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2JeHQGYQyjgy_jO89fH4iJpa3GJYoedM&libraries=places&callback=initAutocomplete"
        async defer></script>
</body>