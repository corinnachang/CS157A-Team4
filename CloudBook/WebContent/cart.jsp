<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
        
        <!-- use jquery to include same header for every page -->
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script > 
			$(function(){
				$("#header").load("header.html"); 
			});
		</script> 
		
		<style>
	        table,
	        th,
	        td {
	            border: none;
	            border-collapse: collapse;
	            padding: 5px;
	            text-align: left;
	        }
	 
	        tr:nth-child(odd) {
	            background-color: lightgray;
	        }
    	</style>
		
		
    </head>
    <body>
    	<div id="header"></div>
    	<div align = "center">
        	<h1>${firstName}'s Cart</h1>
        	
        
			
			<%
		        String user = "root";
		        String password = "root";
		        try {
		        	
		        	String firstName = (String) session.getAttribute("firstName");
	        		String lastName = (String) session.getAttribute("lastName");		
		            
		        	java.sql.Connection con;
		            Class.forName("com.mysql.jdbc.Driver");
		            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook?autoReconnect=true&useSSL=false",user, password);
		
		
		            //out.println("Current Available Books: <br/><br/>");
		            Statement stmt = con.createStatement();
		            ResultSet rs = stmt.executeQuery("SELECT title, price FROM book "
		            		+ "WHERE book_id IN (SELECT book_id FROM shopping_cart " 
		            		+ "WHERE customer_id = (SELECT customer_id FROM customer "
		            		+ "WHERE first_name = '" + firstName + "' AND last_name = '" + lastName + "'));");
		            
		            out.write("<table border ='1'>" +
		            		"<tr>" +
		            		"<th>Title</th>" +
		            		"<th>Price</th>" +
		            		"</tr>");
		            int total = 0;
		            while (rs.next()) {
	            	    out.write("<tr><td>" + rs.getString(1) + "</td>");
	            	    out.write("<td>" + rs.getInt(2) + "</td></tr>");
	            	    total += rs.getInt(2);
	            	}
		            out.write("<tr><th>Total</th>");
		            out.write("<th>" + total + "</th></tr>");
		            out.write("</table>");
		           
		            
		            rs.close();
		            stmt.close();
		            con.close();
		        } catch(SQLException e) {
		            out.println("SQLException caught: " + e.getMessage());
		        }
		    %>
			
        	
    	</div>
    </body>
</html>