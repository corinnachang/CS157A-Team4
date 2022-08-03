<!DOCTYPE html>
<html>
    <head>
        <title>Admin Account</title>
        <style>
        	.button {
	            color: white;
	            background: #2581DC;
	            border: 3px solid #2581DC;
	            border-radius: 5px 5px 5px 5px;
	            outline: none;            
			}
			
			.inputBox {
	            border: 3px solid #2581DC;
	            border-radius: 5px 5px 5px 5px;
	            outline: none;
			}
        </style>
    </head>
    <body>
    	<jsp:include page="header.jsp"/><br>
    	<div align = "center">
        	<h1>Profile</h1>
        	
        	<!-- get user info from session -->
        	<%
        	int adminID= (int)session.getAttribute("adminID"); 
			out.print("ID: "+ adminID + "<br>");
			session.setAttribute("adminID", adminID);
			
       		String firstName = (String)session.getAttribute("firstName"); 
           	//String firstName = request.getParameter("firstName"); 
			out.print("First name: "+ firstName + "<br>");
			session.setAttribute("firstName", firstName); 
			
			String lastName = (String)session.getAttribute("lastName"); 
			out.print("Last name: "+ lastName + "<br>");
			session.setAttribute("lastName", lastName);
			%> 
			
        	<br><br>
        	<form action="./addToListing.jsp" method="post">
	            <label>Enter Book ID to add to Listing: </label>
	            <input type="number" name="bookID" class="inputBox"/>
	            <button type="submit" class="button">Add Book</button>
            </form>
            <br>
        	<form action="./deleteUser.jsp" method="post">
	            <label>Enter User ID to delete User Account: </label>
	            <input type="number" name="customerID" class="inputBox"/>
	            <button type="submit" class="button">Delete User Account</button>
            </form>
    	</div>
    </body>
</html>