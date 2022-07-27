<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>CloudBook Check Out</title>
</head>
<body>
<h1>CloudBook Check Out</h1>
<%
    String db = "cloudbook";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "Cheah_123";
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook",user, password);
        out.println("Your Cart: <br/>");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM book");
        Double total = 0.0;
        while (rs.next()) {
            out.println("BOOK NAME: " + rs.getString("book.title") + " - PRICE: $" + rs.getString("book.price") + " - BOOK ID: "+ rs.getInt("book.book_id") + "<br/><br/>");
            total += rs.getDouble("book.price");
        }
        rs.close();
        stmt.close();
        con.close();
        out.println("Total will be:" + total);
        //get all books' prices from book table
        //sum them up add into amount of checkout table
        //print amount
        //check out button
        //print if successful
    }catch(SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
    }
%>
<form method="post" action="checkout.jsp">
    <input type="submit" value="Pay & Check Out" name ="submit">
</form>

    <%
        //^if submit button pressed, clear cart
    String x = request.getParameter("submit");
    if(x!=null && x.equals("confirm")) {
        try {
            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook", user, password);
            Statement st = con.createStatement();
            int clearCart = st.executeUpdate("DELETE FROM shopping_cart");
            st.close();
            con.close();
            out.println("Checked Out Successfully!");
        } catch (SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    }
    else{
        out.println("Please click to Pay & Check Out!");
    }
%>
<br>
<a href="./homePage.jsp">Home</a>
</body>
</html>