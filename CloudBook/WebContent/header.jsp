<!DOCTYPE html>
<html>
	<head>
		<style>
			body {
				margin: 0;
				background: #f2f2f2;
			}
			
			.navigation {
				background-color: #2581DC;
				font-family: Arial;
				overflow: hidden;
			}
			
			.navigation a {
				float: left;
				text-align: center;
				text-decoration: none;
				color: white;
				padding: 16px;
				font-size: 30px;
			}
			
			.nav-bar {
				float: right;
			}
			
			.nav-bar a {
				font-size: 20px;
			}
			
			.nav-bar a:hover, .dropdown:hover, .dropdown a:hover {
				background-color: #3498DB;
				color: black;
			}
						
			.dropdown {
				border: none;
				color: white;
				background-color: #2581DC;
				font-family: Arial;
				padding: 16px;
				font-size: 20px;
				cursor: pointer;
			}
			
			.content {
				background-color: lightgrey;
				position: absolute;
				display: none;
			}
			
			.content a {
				color: black;
				text-decoration: none;
			}
			
			.show {
				display: block;
			}
		</style>
	</head>
	
	<body>
		<div class="navigation">
			<a href="./homePage.jsp">CloudBook</a>
			<div class="nav-bar">
				<a href="./homePage.jsp">Search</a>
				<a href="./AvailableBooks.jsp">Listing</a>
				<button onclick="show()" class="dropdown">Account</button>
				<div id="dropdownMenu" class="content">
					<a href="./login.jsp">User Login</a>
					<a href="./newUser.jsp">Create New Account</a>
					<a href="./userAccount.jsp">Go to Account</a>
					<a href="./--------">Admin Login</a>
				</div>
			</div>
		</div>
	
		<script>
			/* When the user clicks on the button, 
			toggle between hiding and showing the dropdown content */
			function show() {
			  document.getElementById("dropdownMenu").classList.toggle("show");
			}
			
			// Close the dropdown if the user clicks outside of it
			window.onclick = function(event) {
			  if (!event.target.matches('.dropdown')) {
			    var dropdowns = document.getElementsByClassName("content");
			    var i;
			    for (i = 0; i < dropdowns.length; i++) {
			      var openDropdown = dropdowns[i];
			      if (openDropdown.classList.contains('show')) {
			        openDropdown.classList.remove('show');
			      }
			    }
			  }
			}
		</script>
	</body>
</html>