<!DOCTYPE html>
<html>
<head>
	<title>Home Page</title>
	<style>
		.searchBox {
            border: 3px solid #2581DC;
            border-radius: 5px 5px 5px 5px;
            outline: none;
		}

		.searchButton {
            color: white;
            background: #2581DC;
            border: 3px solid #2581DC;
            border-radius: 5px 5px 5px 5px;
            outline: none;            
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp"/><br>
	<div align="center">
		<h3>Search by Title, Author, Publisher, or Genre:</h3>
		<form action ="./Search.jsp">
        	<input type="text" name="user" class="searchBox"/>
        	<input type="submit" value="Search" class="searchButton"/>
    	</form>
	</div>
</body>
</html>