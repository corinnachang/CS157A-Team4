<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete User</title>
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
	        
	        .returnButton {
	            color: white;
	            background: #2581DC;
	            border: 3px solid #2581DC;
	            border-radius: 5px 5px 5px 5px;
	            outline: none;            
			}
    	</style>
    </head>
    <body>
    	<jsp:include page="header.jsp"/><br>
    	<div align = "center">
        	
			<%
		        String user = "root";
		        String password = "root";
		        try {
		        	
		        	int adminID = (int) session.getAttribute("adminID");
		        	int customerID = Integer.parseInt(request.getParameter("customerID"));
		
		            
		        	java.sql.Connection con;
		            Class.forName("com.mysql.jdbc.Driver");
		            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudbook?autoReconnect=true&useSSL=false", user, password);
		
		
		            Statement stmt = con.createStatement();
		            stmt.execute("DELETE FROM customer WHERE customer_id=" + customerID);
			        
		            String sqlStr = "SELECT * FROM customer WHERE customer_id = " + customerID;
		            ResultSet rs = stmt.executeQuery(sqlStr);
			
				    if (rs.next()) {
				    	%><h1>User not deleted!</h1><%
				    } else {
				    	%><h1>User successfully deleted!</h1><%
				    }
			            
		            rs.close();
		            stmt.close();
		            con.close();
		        } catch(SQLException e) {
		            out.println("SQLException caught: " + e.getMessage());
		        }
		    %>
			</table>
			<br>
			<form action="./adminAccount.jsp" method="post">
	            <button type="submit" class="returnButton">Return to Admin Account</button>
            </form>
    	</div>
    </body>
</html>