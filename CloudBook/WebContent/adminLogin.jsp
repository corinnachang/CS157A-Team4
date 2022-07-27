<!DOCTYPE html>
<html>
    <head>
        <title>Admin Login</title>
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
            <h1>Admin Login</h1>
            <form action="<%=request.getContextPath()%>/adminLogin" method="post">
	            <label>Admin ID: </label>
	            <input type="text" name="adminID" class="inputBox"/><br><br>
	            
	            <label>First Name: </label>
	            <input type="text" name="firstName" class="inputBox"/><br><br>
	            
	            <label>Last Name: </label>
	            <input type="text" name="lastName" class="inputBox"/><br>
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
	            	adminID: "required",
	            	firstName: "required",
	            	lastName: "required",
	            },
	             
	            messages: {
	            	adminID: "Please enter ID",
	            	firstName: "Please enter first name",
	            	lastName: "Please enter last name",
	            }
	        });
	    });
	</script>
</html>