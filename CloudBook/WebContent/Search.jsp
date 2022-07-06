<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<html>

    <head>
        <meta http-equiv="Content-Type" content="Text/html; charset=UTF-8">
        <title> JSP Page </title>
    <head>
    <body>
    <div align="center">
        <table border="1">
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Genre</th>
                <th>ISBN</th>
            </tr>
            <%

                 String db = "HamzaKhan";
                 ResultSet rs = null;

                    try {

                        java.sql.Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CloudBook?autoReconnect=true&useSSL=false","root", "Venatorclass");

                        Statement st = con.createStatement();
                        String user = request.getParameter("user");
                        String sqlStr = "select * from Inventory where Title ='"+user+"'";
                        rs = st.executeQuery(sqlStr);

                      while (rs.next()) {
                                      out.println(rs.getString(1) + " - " + rs.getString(2) + " - " + rs.getString(3) + " - "+ rs.getInt(4) + "<br/><br/>");
                                  }



                    } catch(SQLException e) {
                        out.println("SQLException caught: " + e.getMessage());
                    }
                %>
        </table>
    </div>
    </body>
</html>