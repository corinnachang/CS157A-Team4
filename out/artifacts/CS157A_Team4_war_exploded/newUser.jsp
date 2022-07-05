<!-- create an account page -->

<!DOCTYPE html>
<html>
    <head>

        <title>CloudBook Registration</title>
    </head>
    <body>
        <nav>     
            <a href="./homePage.jsp">Home</a>
            <a href="./login.jsp">Login</a>
            <a href="./newUser.jsp">Create Account</a></br>
        </nav>
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
               <td>Email</td>
               <td><input type="text" name="email" /></td>
              </tr>
             </table>
             <input type="submit" value="Submit" />
            </form>
           </div>
    </body>
</html>