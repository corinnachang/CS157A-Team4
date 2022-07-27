<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<html>
<head>
	<title>Home Page</title>
</head>

<body>
	<jsp:include page="header.jsp"/><br>
	<div align=center>
		<h1>Book successfully added to Cart!</h1>
	
		<%
		String book_title = request.getParameter("book_title");
		String book_author = request.getParameter("book_author");
		String customer_firstName = request.getParameter("customer_firstName");
		String customer_lastName = request.getParameter("customer_lastName");
		
		int book_id = 0;
		int customer_id = 0;
		
		try
		{
			java.sql.Connection con;
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudBook?autoReconnect=true&useSSL=false","root", "root");
		         
		    Statement st=con.createStatement();
		    ResultSet rs = st.executeQuery("SELECT book_id FROM book WHERE title = '" + book_title + "' AND "
		    		+ "author_id IN (SELECT author_id FROM author "
		    		+ "WHERE last_name = '" + book_author + "') ");
		    
		    while (rs.next()) {
        	    book_id = rs.getInt("book_id");
        	}
		    
		    
		    rs = st.executeQuery("SELECT customer_id FROM customer "
		    		+ "WHERE first_name = '" + customer_firstName +"' AND last_name = '" + customer_lastName + "' ");
		    
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
 