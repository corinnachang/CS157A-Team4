<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add to Listing</title>
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
	            background-color: lightskyblue;
	        }
	        
	        .returnButton {
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
    	<div align = "center">
        	<h1>Book successfully added to listing!</h1>
        	<table border="1">
            <tr>
                <th>Listing ID</th>
                <th>Book ID</th>
                <th>Title</th>
                <th>Admin ID</th>
                <th>Admin First Name</th>
                <th>Admin Last Name</th>
            </tr>
			<%
		        String user = "root";
		        String password = "root";
		        try {
		        	
		        	int adminID = (int) session.getAttribute("adminID");
		        	int bookID = Integer.parseInt(request.getParameter("bookID"));
		
		            
		        	java.sql.Connection con;
		            Class.forName("com.mysql.jdbc.Driver");
		            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook?autoReconnect=true&useSSL=false", user, password);
		
		
		            Statement stmt = con.createStatement();
		            stmt.execute("INSERT INTO listing (book_id, admin_id) VALUES (" + bookID + ", " + adminID + ") ");
			        
		            String sqlStr = "SELECT * FROM listing JOIN book USING (book_id) "
                            + "JOIN admin USING (admin_id) "
                            + "WHERE book_id=" + bookID + " AND admin_id=" + adminID;
		            ResultSet rs = stmt.executeQuery(sqlStr);
			
				    while (rs.next()) {
				    	%>
						<tr>
				            <td><%=rs.getInt("listing_id") %></td>
				            <td><%=rs.getInt("book_id") %></td>
				            <td><%=rs.getString("title") %></td>
				            <td><%=rs.getInt("admin_id") %></td>
				            <td><%=rs.getString("first_name") %></td>
				            <td><%=rs.getString("last_name") %></td>
			            </tr>
			          <%
				    }	           
			            
		            rs.close();
		            stmt.close();
		            con.close();
		        } catch(SQLException e) {
		            out.println("SQLException caught: " + e.getMessage());
		        }
		    %>
			</table>
			<br>
			<form action="./adminAccount.jsp" method="post">
	            <button type="submit" class="returnButton">Return to Admin Account</button>
            </form>
    	</div>
    </body>
</html>