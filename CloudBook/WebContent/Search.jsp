<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<html>

    <head>
        <meta http-equiv="Content-Type" content="Text/html; charset=UTF-8">
        <title> JSP Page </title>
    <head>

    <nav>
        <a href="./AvailableBooks.jsp">Books in Stock</a></br>
        <a href="./SearchB.html">Search</a></br>

    </nav>

    <body>
    <center>
        <table border="1">
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Genre</th>
                <th>ISBN</th>
            </tr>
            <%

                 String db = "cloudbook";
                 ResultSet rs = null;

                    try {

                        java.sql.Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudBook?autoReconnect=true&useSSL=false","root", "Venatorclass");

                        Statement st = con.createStatement();
                        String user = request.getParameter("user");
                        String sqlStr = "select * from Book where Title ='"+user+"'";
                        rs = st.executeQuery(sqlStr);

                      while (rs.next()) {
                                  %>
                                  <tr>
                                  <td><%=rs.getInt("book_id") %></td>

                                  </tr>
                                  <%

                                  }



                    } catch(SQLException e) {
                        out.println("SQLException caught: " + e.getMessage());
                    }
                %>
        </table>
    </center>
    </body>
</html>