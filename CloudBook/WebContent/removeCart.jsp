<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<html>
<head>
	<title>Remove from Cart</title>
	<style>
		.button {
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
	<div align=center>
		<%
			int book_id = Integer. parseInt(request.getParameter("book_id"));
			String username = (String)session.getAttribute("username");
			
			int customer_id = 0;
			try
			{
				java.sql.Connection con;
			    Class.forName("com.mysql.jdbc.Driver");
			    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudBook?autoReconnect=true&useSSL=false","root", "root");
			         
			    Statement st=con.createStatement();
			    st.execute("DELETE FROM shopping_cart WHERE book_id =" + book_id 
			    		+ " AND customer_id = (SELECT customer_id FROM customer "
	            		+ "WHERE username = '" + username + "')");
			   
			    out.println("<h1>Book successfully removed from Cart!</h1>");
			    } catch(Exception e) {
			        e.printStackTrace();
			    }
		 %>
		 
		 <form action="./cart.jsp" method="post">
			<button type="submit" class="button">Return to Cart</button>
		</form>
	</div>
</body>
</html>
 