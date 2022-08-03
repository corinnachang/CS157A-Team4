<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<html>
<head>
	<title>Add to Cart</title>
</head>

<body>
	<jsp:include page="header.jsp"/><br>
	<div align=center>
		<h1>Book successfully added to Cart!</h1>
	
		<%
		String book_id = request.getParameter("book_id");
		String customer_username = request.getParameter("customer_username");
		
		int customer_id = 0;
		
		try
		{
			java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudBook?autoReconnect=true&useSSL=false","root", "root");
		         
		    Statement st=con.createStatement();
		    ResultSet rs = st.executeQuery("SELECT customer_id FROM customer "
		    		+ "WHERE username = '" + customer_username + "' ");
		    
		    while (rs.next()) {
        	    customer_id = rs.getInt("customer_id");
        	}
		         
		    st.execute("INSERT INTO shopping_cart (customer_id, book_id) VALUES (" + customer_id + "," + book_id + ")");
	        

		    
		    out.println("Book Added to Cart!<br>");
		    
		    
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
		 %>
		 
	</div>
</body>
</html>
 