<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>CloudBook Checkout</title>
</head>
<body>
<h1>Your order</h1>
<%
    String db = "Cheah";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "Cheah_123";
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Cheah",user, password);
        out.println("Your Cart: <br/>");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM checkout");
        while (rs.next()) {
            out.println(rs.getString("bookName") + " - " + rs.getString("info") + " - " + rs.getString("price") + " - "+ rs.getInt("bookId") + "<br/><br/>");
        }
        rs.close();
        stmt.close();
        con.close();
    } catch(SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
    }
%>
<a href="./homePage.jsp">Home</a>
</body>
</html>