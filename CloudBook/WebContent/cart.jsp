<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
		<style>
			.button {
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
        	<h1>${firstName}'s Shopping Cart</h1>
			
			<!-- get user info from session -->
        	<%
        		String firstName = (String)session.getAttribute("firstName"); 
            	session.setAttribute("firstName", firstName); 
				
				String lastName = (String)session.getAttribute("lastName"); 
				session.setAttribute("lastName", lastName);
				
				String username = (String)session.getAttribute("username"); 
				session.setAttribute("username", username);
				
				String password = (String)session.getAttribute("password"); 
				session.setAttribute("password", password);
				
				String address = (String)session.getAttribute("address"); 
				session.setAttribute("address", address);
			%> 
			
			<%
		        
		        try {
		        	
		        	java.sql.Connection con;
		            Class.forName("com.mysql.jdbc.Driver");
		            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook?autoReconnect=true&useSSL=false", "root", "root");
		
		
		            //out.println("Current Available Books: <br/><br/>");
		            Statement stmt = con.createStatement();
		            ResultSet rs = stmt.executeQuery("SELECT * FROM book "
		            		+ "WHERE book_id IN (SELECT book_id FROM shopping_cart " 
		            		+ "WHERE customer_id = (SELECT customer_id FROM customer "
		            		+ "WHERE first_name = '" + firstName + "' AND last_name = '" + lastName + "'));");
		            
		            out.write("<table border ='1'>" +
		            		"<tr>" +
		            		"<th>Book ID</th>" +
		            		"<th>Title</th>" +
		            		"<th>Price</th>" +
		            		"</tr>");
		            double total = 0;
		            ArrayList<Integer> bookList = new ArrayList<Integer>();
		            
		            while (rs.next()) {
		            	out.write("<tr><td>" + rs.getInt("book_id") + "</td>");
		            	out.write("<td>" + rs.getString("title") + "</td>");
	            	    out.write("<td>$" + rs.getDouble("price") + "0</td></tr>");
	            	    total += rs.getDouble("price");
	            	    bookList.add(rs.getInt("book_id"));
	            	}
		            out.write("<tr><th>Total</th><th></th>");
		            out.write("<th>$" + total + "0</th></tr>");
		            out.write("</table>");
		            
		            session.setAttribute("total", total);
		            session.setAttribute("bookList", bookList);
		            
		            rs.close();
		            stmt.close();
		            con.close();
		        } catch(SQLException e) {
		            out.println("SQLException caught: " + e.getMessage());
		        }
		    %>
			
			<br>
			<form action="./removeCart.jsp" method="post">
				Enter Book ID to remove from Cart: 
	        	<input type="number" name="book_id" class="searchBox"/>
	        	<input type="submit" value="Remove" class="button"/><br><br>
			</form>
			
			<form action="./checkout.jsp" method="post">
				Proceed to Checkout: 
				<button type="submit" class="button">Checkout</button>
			</form>
        	
    	</div>
    </body>
</html>