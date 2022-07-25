<!DOCTYPE html>
<html>
<head>
	<title>Home Page</title>
	
	<!-- use jquery to include same header for every page -->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script> 
			$(function(){
				$("#header").load("header.html"); 
			});
		</script>
</head>
<body>
	<div id="header"></div>
	<div align="center">
		<tr>
			<td><input type="text" name="searchTitle"
				placeholder="Search by Title" /></td>
			<td>OR</td>
			<td><input type="text" name="searchAuthor"
				placeholder="Search by Author" /></td>
		</tr>
		<input type="submit" value="Search" />
		<br><br>
		<form action="./AvailableBooks.jsp">
    		<input type="submit" value="View all books" />
		</form>
		
	</div>
</body>
</html>