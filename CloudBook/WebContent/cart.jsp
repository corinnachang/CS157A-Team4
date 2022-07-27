<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
		<style>
			.checkoutButton {
				color: white;
	            background: #2581DC;
	            border: 3px solid #2581DC;
	            border-radius: 5px 5px 5px 5px;
	            outline: none;
			}
			
	        table,
	        th,
	        td {
	            border: none;
	            border-collapse: collapse;
	            padding: 5px;
	            text-align: left;
	        }
	 
	        tr:nth-child(odd) {
	            background-color: lightskyblue;
	        }
    	</style>
    </head>
    <body>
    	<jsp:include page="header.jsp"/><br>
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
		            double total = 0;
		            while (rs.next()) {
	            	    out.write("<tr><td>" + rs.getString(1) + "</td>");
	            	    out.write("<td>$" + rs.getDouble(2) + "0</td></tr>");
	            	    total += rs.getDouble(2);
	            	}
		            out.write("<tr><th>Total</th>");
		            out.write("<th>$" + total + "0</th></tr>");
		            out.write("</table>");
		           
		            
		            rs.close();
		            stmt.close();
		            con.close();
		        } catch(SQLException e) {
		            out.println("SQLException caught: " + e.getMessage());
		        }
		    %>
			
			<br>
			<form action="<%=request.getContextPath()%>/checkout?????" method="post">
				<button type="submit" class="checkoutButton">Checkout</button>
			</form>
        	
    	</div>
    </body>
</html>