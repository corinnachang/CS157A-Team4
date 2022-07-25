<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Available Books</title>
    
    <!-- use jquery to include same header for every page -->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script> 
			$(function(){
				$("#header").load("header.html"); 
			});
		</script>
	</head>
<body>
	<div id="header"></div>
  <body align ="center">
    <h1>Available Books</h1>

    <table border="10", align = "center">
      <tr>
        <td>Title</td>
        <td>Author</td>
        <td>Publisher</td>
        <td>Price</td>
   </tr>
    <%
     
        String user; // assumes database name is the same as username
          user = "root";
        String password = "root";
        try {

            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook?autoReconnect=true&useSSL=false",user, password);


            out.println("Current Available Books: <br/><br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT title, first_name, last_name, publisher_name, price "
            		+"FROM book JOIN listing USING (book_id) "
            		+"JOIN author USING (author_id) "
            		+"JOIN publisher USING (publisher_id);");
            while (rs.next()) {
                out.println(rs.getString(1) + ". Author: " + rs.getString(2) + " " + rs.getString(3) 
                	+ ". Publisher: "+ rs.getString(4) + ". Price: " 
                	+ rs.getInt(5) + "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
  </body>
</html>
