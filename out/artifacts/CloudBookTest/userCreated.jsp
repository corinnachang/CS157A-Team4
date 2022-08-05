<!DOCTYPE html>
<html>
    <head>
        <title>Success</title>

        <!-- use jquery to include same header for every page -->
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script >
			$(function(){
				$("#header").load("header.html");
			});
		</script>
    </head>
    <body>
    	<div id="header"></div>
        <h1>Success!</h1>
        <p> New user created! Please go to login page to sign in.</p>
    </body>
</html>