<!DOCTYPE html>
<html>
    <head>
        <title>User Account</title>
        
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
    	<div align = "center">
        	<h1>Profile</h1>
        	
        	<!-- get user info from session -->
        	<%
        		String firstName = (String)session.getAttribute("firstName"); 
            	//String firstName = request.getParameter("firstName"); 
				out.print("First name: "+ firstName + "<br>");
				session.setAttribute("firstName", firstName); 
				
				String lastName = (String)session.getAttribute("lastName"); 
				out.print("Last name: "+ lastName + "<br>");
				session.setAttribute("lastName", lastName);
				
				String username = (String)session.getAttribute("username"); 
				out.print("Username: "+ username + "<br>");
				session.setAttribute("username", username);
				
				String password = (String)session.getAttribute("password"); 
				out.print("Password: "+ password + "<br>");
				session.setAttribute("password", password);
				
				String address = (String)session.getAttribute("address"); 
				out.print("Address: "+ address + "<br>");
				session.setAttribute("address", address);
			%> 
			
        	<br><br>
        	<form action="<%=request.getContextPath()%>/logout" method="post">
	            <button type="submit">Logout</button>
            </form>
            <br>
            <form action="./cart.jsp" method="post">
	            <button type="submit">Shopping Cart</button>
            </form>
        	
    	</div>
    </body>
</html>