<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String book_ident=request.getParameter("book_ident");
String customer_ident=request.getParameter("customer_ident");

try
{
         java.sql.Connection con;
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudBook?autoReconnect=true&useSSL=false","root", "Venatorclass");
         Statement st=con.createStatement();
         int i=st.executeUpdate("INSERT INTO shopping_cart(customer_id,book_id)values('"+customer_ident+"','"+book_ident+"')");
        out.println("Book Added to Cart!");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>