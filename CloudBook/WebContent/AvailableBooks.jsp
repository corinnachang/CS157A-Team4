<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Available Books</title>
    </head>
  <body align ="center">
    <h1>Available Books</h1>

    <table border="10", align = "center">
      <tr>
        <td>Title</td>
        <td>Author</td>
        <td>Genre</td>
        <td>ISBN</td>
   </tr>
    <%
     String db = "HamzaKhan";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "Venatorclass";
        try {

            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CloudBook?autoReconnect=true&useSSL=false",user, password);


            out.println("Current Available Books: <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Inventory");
            while (rs.next()) {
                out.println(rs.getString(1) + " - " + rs.getString(2) + " - " + rs.getString(3) + " - "+ rs.getInt(4) + "<br/><br/>");
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
