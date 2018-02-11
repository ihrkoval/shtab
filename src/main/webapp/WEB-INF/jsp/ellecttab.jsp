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
    <link rel="stylesheet" href="./vendor/bootstrap/css/bootstrap-datetimepicker.css"/>
</head>
<body>
<div class="container-fluid">
    <div class="panel panel-primary">
        <div class="container-fluid panel-heading">
            <div class = "col-sm-2">
                <label for="citnames">Населений пункт: </label>
                <input id="citnames" class="form-control" list="citsuggestions" name="city"> // onchange="loadDVK(this.value)"
                <datalist id="citsuggestions">
                </datalist>
            </div>

        <%--   <div class = "col-sm-2">
                <label for="dvk">ДВК</label>
                <select class="form-control" id="dvk" name="dvk">
                    <option>ДВК</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
            </div>--%>

            <div class = "col-sm-2">
                <label for="partia">Вибори</label>
                <select class="form-control" id="partia" name="partia">
                    <option name="pr">Президента</option>
                    <option name = "p">Партії</option>
                    <option name = "m">Мажоритарники</option>
                </select>
            </div>

            <div class="container col-sm-2">
            <label for="datetimepicker10">Дата виборів</label>
            <div class='input-group date' id='datetimepicker10'>
                <input type='text' class="form-control" name="year" id="year"/>
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

           </div>
                <div class="col-sm-2">
                    <label for="but">_________________________</label>
                    <button type="button" class="btn btn-default" id ="but" onclick="loadTable()"> <span class="glyphicon glyphicon-ok"></span>Заповнити</button></div>




    </div>

        <div class="panel-body">

            <table class="table">
                <thead>
                <tr id = "tableHead">
                </tr>
                </thead>
                <tbody id ="tbody">
                </tbody>
            </table>

        </div>
    </div>
</div>
<script>

    var partialist = [];
    function loadTable() {
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
        var selectedPartia = $(partia).children(":selected").attr("name");
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
                th.innerHTML=field.name;
                tableHead.appendChild(th);

            });
            partialist = result;

            $.getJSON("./getdvkByCName?id="+document.getElementById("citnames").value, function(result){

                $.each(result, function(i, field){
                    var tr = document.createElement("tr");
                    var td =  document.createElement("td");
                    td.setAttribute("scope","col");
                    td.innerHTML=field.id + ' '+field.name;
                    document.getElementById("tbody").appendChild(tr);
                    tr.appendChild(td);

                    for (var i = 0, len = partialist.length+3; i < len; i++) {
                        var td2 = document.createElement("td");
                        var tdinput =  document.createElement("input");
                        tdinput.className="form-control";
                        td2.appendChild(tdinput);
                        tr.appendChild(td2);
                    }

                    /*var td2 = document.createElement("td");
                     var tdinput =  document.createElement("input");
                     tdinput.className="form-control";
                     td2.appendChild(tdinput);
                     console.log(partialist.length)*/






                });

            });
        });




    }


    var cities = {};
    $(document).ready(function(){

        $.getJSON("./getAllCities", function(result){
            cities = result;
            $.each(result, function(i, field){
                var cname =  document.createElement("option");
                cname.setAttribute("value", field.city_name);
                cname.setAttribute("name", field.id);
                document.getElementById("citsuggestions").appendChild(cname);

            });

        });
    });

</script>

</body>