<%@ page import="java.sql.*"%>
<html>
<head>
	<title>Available Books</title>
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
   	</style>
</head>
<body>
	<jsp:include page="header.jsp" /><br>
	<div align="center">
		<h1>Available Books</h1>

		<table border="10" , align="center">
			<tr>
				<th>Title</th>
                <th>Genre</th>
                <th>Author First Name</th>
                <th>Author Last Name</th>
                <th>Publisher</th>
                <th>Year Published</th>
                <th>Price</th>
			</tr>

			<%
	        String user = "root";
	        String password = "Venatorclass";
	        try {

	            java.sql.Connection con;
	            Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook?autoReconnect=true&useSSL=false", user, password);

	            Statement stmt = con.createStatement();
	            String sqlStr = "SELECT * FROM book JOIN listing USING (book_id) "
                        + "JOIN author USING (author_id) "
                        + "JOIN publisher USING (publisher_id)"
                        + "JOIN genre USING (genre_id); ";
    			ResultSet rs = stmt.executeQuery(sqlStr);
	            while (rs.next()) {
	            	%>
                    <tr>
                    <td><%=rs.getString("title") %></td>
                    <td><%=rs.getString("genre_name") %></td>
                    <td><%=rs.getString("first_name") %></td>
                    <td><%=rs.getString("last_name") %></td>
                    <td><%=rs.getString("publisher_name") %></td>
                    <td><%=rs.getInt("year") %></td>
                    <td>$<%=rs.getDouble("price") %>0</td>
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
	</div>
</body>
</html>