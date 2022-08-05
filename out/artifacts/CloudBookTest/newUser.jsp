<!-- create an account page -->

<!DOCTYPE html>
<html>
    <head>

        <title>CloudBook Registration</title>

        <!-- use jquery to include same header for every page -->
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script >
			$(function(){
				$("#header").load("header.html");
			});
		</script>
    </head>
    <body>
    	<div id="header"></div>
        <div align="center">
            <h1>Create account</h1>
  			<form action="<%= request.getContextPath() %>/register" method="post">
             <table>
              <tr>
               <td>First Name</td>
               <td><input type="text" name="firstName" /></td>
              </tr>
              <tr>
               <td>Last Name</td>
               <td><input type="text" name="lastName" /></td>
              </tr>
              <tr>
               <td>Username</td>
               <td><input type="text" name="username" /></td>
              </tr>
              <tr>
               <td>Password</td>
               <td><input type="password" name="password" /></td>
              </tr>
              <tr>
               <td>Address</td>
               <td><input type="text" name="address" /></td>
              </tr>
             </table>
             <input type="submit" value="Submit" />
            </form>
           </div>
    </body>
</html>