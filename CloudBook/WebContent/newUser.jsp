<!-- create an account page -->

<!DOCTYPE html>
<html>
<head>
	<title>CloudBook Registration</title>
	<style>
		.button {
			color: white;
			background: #2581DC;
			border: 3px solid #2581DC;
			border-radius: 5px 5px 5px 5px;
			outline: none;
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp" /><br>
	<div align="center">
		<h1>Create Account</h1>
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
					<td><input type="text" name="password" /></td>
				</tr>
				<tr>
					<td>Address</td>
					<td><input type="text" name="address" /></td>
				</tr>
			</table>
			<input type="submit" value="Submit" class="button" />
		</form>
	</div>
</body>
</html>