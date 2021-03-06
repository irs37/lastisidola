<!DOCTYPE html>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
	.dropdown-submenu {
		position: relative;
	}

	.dropdown-submenu .dropdown-menu {
		top: 0;
		left: 100%;
		margin-top: -1px;
	}
  table, th, td 
  {
    margin:10px 0;
    border:solid 1px #333;
    padding:2px 4px;
    font:15px Verdana;
  }
  th {
    font-weight:bold;
  }
</style>
</head>

<body onLoad="buildHtmlTable('#excelDataTable')">
  <nav class="navigation">

    <ul>

      <a href="home"><span>Home</span></a>
      
      
    </ul>
    <ul>
		<div class="container">                                       
		<div class="dropdown">
			<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Katalog
				<span class="caret"></span></button>
				<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="laptop">Laptop</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="server">Server</a></li>
				</ul>
			</div>
		</div>
    </ul>

  </nav>


  <table id="excelDataTable" border="1">
  </table>

  <script>
    var myList = {{.json}}

    function buildHtmlTable(selector) {
      var columns = addAllColumnHeaders(myList, selector);

      for (var i = 0; i < myList.length; i++) {
        var row$ = $('<tr/>');
        for (var colIndex = 0; colIndex < columns.length; colIndex++) {
          var cellValue = myList[i][columns[colIndex]];
          if (cellValue == null) cellValue = "";
          row$.append($('<td/>').html(cellValue));
        }
        $(selector).append(row$);
      }
    }
    function addAllColumnHeaders(myList, selector) {
      var columnSet = [];
      var headerTr$ = $('<tr/>');

      for (var i = 0; i < myList.length; i++) {
        var rowHash = myList[i];
        for (var key in rowHash) {
          if ($.inArray(key, columnSet) == -1) {
            columnSet.push(key);
            headerTr$.append($('<th/>').html(key));
          }
        }
      }
      $(selector).append(headerTr$);

      return columnSet;
    }
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</body>
</html>
