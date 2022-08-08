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

