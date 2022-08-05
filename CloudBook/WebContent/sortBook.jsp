<%@ page import="java.sql.*"%>
<html>
<head>
	<Web>Available Books</Web>

</head>
<body1>
	<jsp:include page="header.jsp" /><br>
	<div align="center">
		<h1>Available Books</h1>

		<table border="10" , align="center">
			<tr>
				<th>Title</th>
                <th>Genre</th>
                <th>Author First Name</th>
                <th>Author Last Name</th>
                <th>Publisher</th>
                <th>Year Published</th>
                <th>Price</th>
			</tr>

			<div class="column">
                        <div class="col-md-4">
                            <c:forEach var="book" items="${book}">
                                <div style="text-align: left;">
                                  <div>
                                     Name: ${book.name}
                                  </div>
                                  <div>
                                    Price: ${item.price}
                                  </div>
                               </div>
                             --------------------------
                            </c:forEach>
                        </div>
            </div>

<%
String user = "root";
 String password = "Venatorclass";
try {
    String connectionURL = "jdbc:mysql://localhost:3308/HamzaKhan";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;

    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(connectionURL,"root","");
    if(!connection.isClosed())
    %>

    <font size="+3" color="blue">

    <%
    out.println("Successfully connected to " + "Database");
    statement = connection.createStatement();
    rs = statement.executeQuery("SELECT * from book");
    %>

    <script type="text/javascript" src="gs_sortable.1.7.js"></script>
    <script type="text/javascript">
    <!--
    var TSort_Data = new Array ('inventory', 'book','customer','s');

    //tsRegister()
    // -->
    </script>

    <TABLE id="my_table" cellpadding="15" border="1" style="background-color: #ffffcc;" >
    <thead>
    <%--<a href="#" OnClick=" return <%rs = statement.executeQuery("SELECT * from details order by id, name, address desc;");%>"</a>--%>
    <th style="cursor: pointer;"><a href="" onclick="tsDraw(0,'my_table'); return false">ID</a></th>
    <%--<%String string = response.encodeURL("");%>--%>

