
<!DOCTYPE html>
<html>
    <head>
        <title>User Login</title>
    </head>
    <body>
        <nav>     
            <a href="./homePage.jsp">Home</a>
            <a href="./login.jsp">Login</a>
            <a href="./newUser.jsp">Create Account</a></br>
        </nav>
        <div align="center">
            <h1>User Login</h1>
            <form action="<%=request.getContextPath()%>/login" method="post">
            <table>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td>
                </tr>
            </table>
            <input type="submit" value="Submit" />
            </form>
        </div>
    </body>
</html>