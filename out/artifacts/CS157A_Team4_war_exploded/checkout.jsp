<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>CloudBook Check Out</title>
</head>
<body>
	<jsp:include page="header.jsp" /><br>
	<div align = center>
	<h1>CloudBook Check Out</h1>


	<%
	String firstName = (String)session.getAttribute("firstName"); 		
	String lastName = (String)session.getAttribute("lastName"); 
	String address = (String)session.getAttribute("address"); 
	Double total = (Double) session.getAttribute("total");
	
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook", "root", "root");
        
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT customer_id FROM customer "
        		+ "WHERE first_name='" + firstName + "' AND last_name='" + lastName + "' ");
        
        int customer_id = 0;
        if (rs.next()) {
            customer_id = rs.getInt("customer_id");
        }
        
        stmt.execute("INSERT INTO checkout (customer_id, amount) VALUES (" + customer_id + ", " + total + ") ");
        
        //remove from inventory, clear shopping cart
        
        
        
        
        rs.close();
        stmt.close();
        con.close();
        
        out.println("Hi, " + firstName + " " + lastName + ".<br>");
        out.println("Your item(s) will be delivered to " + address + "<br>");
        out.println("Your total is $" + total + "0<br>");
        out.println("Thank you for shopping with us!<br>");
        //get all books' prices from book table
        //sum them up add into amount of checkout table
        //print amount
        //check out button
        //print if successful
<<<<<<< Updated upstream
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
    if(x!= null && x.equals("confirm")) {
        try {
            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook", user, password);
            Statement st = con.createStatement();
            st.executeUpdate("DELETE FROM shopping_cart");
            st.close();
            con.close();
        }catch (SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    }
    else{
        out.println("Please click to Pay & Check Out!");
    }
%>
<br>
<a href="./homePage.jsp">Home</a>
=======
	    }catch(SQLException e) {
	        out.println("SQLException caught: " + e.getMessage());
	    }
	%>
	</div>
>>>>>>> Stashed changes
</body>
</html>