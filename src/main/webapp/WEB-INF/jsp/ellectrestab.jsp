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

    <div class="container-fluid">
        <div id="tab" class="panel col-sm-10">

            <table class="table table-striped">
                <thead>
                <tr id = "tableHead">
                </tr>
                </thead>
                <tbody id ="tbody">
                </tbody>
            </table>

        </div>




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
            <button type="button" class="btn btn-success" onclick="loadTable()">Показати</button>

        </div>
    </div>
</div>
</body>
<script>





    var partialist = [];
    function loadTable() {
        $('#tbody').empty();
        $('#tableHead').empty();

        var globalCount = 0;
        var globalYavka = 0;
        var globalParties = [];


        var tableHead = document.getElementById("tableHead");
        var th1 = document.createElement("th");
        th1.setAttribute("scope","col");
        th1.innerHTML="ДВК"
        var th2 = document.createElement("th");
        th2.setAttribute("scope","col");
        th2.innerHTML="ОТГ"
        var th3 = document.createElement("th");
        th3.setAttribute("scope","col");
        th3.innerHTML="Виборців"
        var th4 = document.createElement("th");
        th4.setAttribute("scope","col");
        th4.innerHTML="Явка"
        var selectedPartia = $(pt).children(":selected").attr("id");
        var selectedYear = document.getElementById("year").value;
        console.log(selectedYear + " IS SELECTED YEAR");
        tableHead.appendChild(th1);
        tableHead.appendChild(th2);
        tableHead.appendChild(th3);
        tableHead.appendChild(th4);

        $.getJSON("./getPartiesElTab?type="+selectedPartia+"&year="+selectedYear, function(result){

            $.each(result, function(i, field){
                var th =  document.createElement("th");
                th.setAttribute("scope","col");
                th.setAttribute("name",field.id);
                th.innerHTML=field.name;
                tableHead.appendChild(th);
                var partia = {};
                partia.name = field.name;
                partia.votes =0;
                globalParties.push(partia);

            });
            partialist = result;

            $.getJSON("./getdvkByCName?id="+document.getElementById("citnames").value+"&t="+$(po).children(":selected").attr("id"), function(result){


                $.each(result, function(i, field){
                    var tr = document.createElement("tr");
                    tr.setAttribute("id","pl"+field.id);
                    var td =  document.createElement("td");
                    td.setAttribute("scope","col");
                    td.setAttribute("name",field.id);
                    td.innerHTML=field.id + ' '+field.name;
                    document.getElementById("tbody").appendChild(tr);
                    tr.appendChild(td);

                    for (var ii = 0, len = partialist.length+3; ii < len; ii++) {
                        var td2 = document.createElement("td");
                        if(ii>2){
                            td2.setAttribute("id","pid"+field.id+""+partialist[ii-3].id);
                        }
                        var tdinput =  document.createElement("p");
                        td2.appendChild(tdinput);
                        tr.appendChild(td2);
                    }

                    /*var td2 = document.createElement("td");
                     var tdinput =  document.createElement("input");
                     tdinput.className="form-control";
                     td2.appendChild(tdinput);
                     console.log(partialist.length)*/






                });

                $.getJSON("./getResulttype?city_name="+document.getElementById("citnames").value+"&year="+document.getElementById("year").value +"&type="+$(pt).children(":selected").attr("id")+"&po="+$(po).children(":selected").attr("id"), function(result){

                    var placeid = [];


                    $.each(result, function(i, field) {
                        var tr = document.getElementById("pl" + field.place.id);
                        console.log(field.place.id + " PL ID " + field.id);
                        tr.setAttribute("name", field.id);
                        tr.childNodes[1].childNodes[0].innerHTML = field.place.city.otg;
                        tr.childNodes[2].childNodes[0].innerHTML = field.allcount;

                        tr.childNodes[3].childNodes[0].innerHTML = field.yavka;
                        var tdinput = document.getElementById("pid" + field.place.id + "" + field.partia.id);
                        tdinput.childNodes[0].innerHTML = field.votes;

                        var metka = 0;

                        for (var r = 0; r < placeid.length; r++) {
                            if (field.place.id === placeid[r]) {
                                metka = 1;
                            }
                        }
                        if (metka === 0) {
                        globalCount = globalCount + field.allcount;
                        globalYavka = globalYavka + field.yavka;
                        placeid.push(field.place.id);
                        }

                        for (var i = 0; i < globalParties.length; i++){
                            if (globalParties[i].name === field.partia.name){
                                globalParties[i].votes = globalParties[i].votes + field.votes;

                            }
                        }



                    });


                    var table = document.getElementById("globalTab");

                    if(table.firstChild != null) {
                        table.removeChild(table.firstChild);
                    }

                    var tableTag = document.createElement("table");
                    tableTag.className = "table table-striped";
                    table.appendChild(tableTag);
                    var head = document.createElement("thead");
                    head.innerHTML = globalCount+'/'+globalYavka;
                    tableTag.appendChild(head);
                    var tbody = document.createElement("tbody");
                    tableTag.appendChild(tbody);


                    console.log(globalParties);
                    console.log(globalCount + " " + globalYavka)
                    for (x in globalParties) {
                        var tRowg = document.createElement("tr");
                        var nameTdg = document.createElement("th");
                        nameTdg.setAttribute("scope","row")
                        var countTdg = document.createElement("td");
                        var prcntTdg = document.createElement("td");
                        tbody.appendChild(tRowg);
                        tRowg.appendChild(nameTdg);
                        tRowg.appendChild(countTdg);
                        tRowg.appendChild(prcntTdg);
                        var prcnt = globalParties[x].votes/(globalYavka / 100);
                        nameTdg.innerHTML = globalParties[x].name;
                        countTdg.innerHTML = globalParties[x].votes;
                        prcntTdg.innerHTML = parseFloat(prcnt).toFixed(2)+'%';
                    }

                });

            });
        });





    }


</script>
<!-- SUGGESTIONS --------------------------------------------------------------------- -->
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