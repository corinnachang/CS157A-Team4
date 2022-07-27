<!DOCTYPE html>
<html>
    <head>
        <title>User Login</title>
        <style>
        	.inputBox {
	            border: 3px solid #2581DC;
	            border-radius: 5px 5px 5px 5px;
	            outline: none;
			}
		
        	.loginButton {
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
            <h1>User Login</h1>
            <form action="<%=request.getContextPath()%>/login" method="post">
	            <label>Username: </label>
	            <input type="text" name="username" class="inputBox"/><br><br>
	            <label for="password">Password: </label>
	            <input type="text" name="password" class="inputBox"/><br>
	            ${message}<br>           
	            <button type="submit" class="loginButton">Login</button>
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