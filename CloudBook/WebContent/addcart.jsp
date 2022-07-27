<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String book_ident=request.getParameter("book_ident");
String customer_ident=request.getParameter("customer_ident");

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into shopping_cart(customer_id,book_id)values('"+customer_ident+"','"+book_ident+"')");
        out.println("Data is successfully inserted!");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>