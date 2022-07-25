<!DOCTYPE html>
<html>
    <head>
        <title>User Login</title>
        
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
        <div align="center">
            <h1>User Login</h1>
            <form action="<%=request.getContextPath()%>/login" method="post">
	            <label>Username: </label>
	            <input type="text" name="username" /><br><br>
	            <label for="password">Password: </label>
	            <input type="text" name="password" /><br>
	            ${message}<br><br>           
	            <button type="submit">Login</button>
            </form>
        </div>
    </body>
	
	<!-- for validating fields before the form is submitted -->
	<script type="text/javascript">
	    $(document).ready(function() {
	        $("#loginForm").validate({
	            rules: {
	                username: "required",
	                password: "required",
	            },
	             
	            messages: {
	                username: "Please enter username",
	                password: "Please enter password",
	            }
	        });
	    });
	</script>
</html>