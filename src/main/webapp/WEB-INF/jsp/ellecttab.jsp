<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="panel panel-primary">
        <div class="container-fluid panel-heading">

            <div class = "col-sm-2">
                <label for="citnames">Населений пункт: </label>
                <input id="citnames" class="form-control" list="citsuggestions" name="city" onchange="loadDVK(this.value)">
                <datalist id="citsuggestions">
                </datalist>
            </div>

           <div class = "col-sm-2">
                <label for="dvk">ДВК</label>
                <select class="form-control" id="dvk" name="dvk">
                    <option>ДВК</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
            </div>

            <div class = "col-sm-2">
                <label for="partia">Хто?</label>
                <select class="form-control" id="partia" name="partia">
                    <option>Президент</option>
                    <option>Партії</option>
                    <option>Мажоритарники</option>
                </select>
            </div>


        </div>
        <div class="panel-body">

        </div>
    </div>
</div>
<script>

    function loadDVK(citname) {


        $.getJSON("./getdvkByCName?id="+citname, function(result){
            cities = result;
            $( "#dvk" ).empty();
            $.each(result, function(i, field){

                var cname =  document.createElement("option");
                cname.innerHTML = field.num + ' '+ field.name;
                cname.setAttribute("name", field.id);

                document.getElementById("dvk").appendChild(cname);

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