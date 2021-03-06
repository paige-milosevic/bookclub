<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Project Manager Dashboard</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div class="row justify-content-between align-items-center">
			<h1>Welcome, <c:out value="${user.name}"></c:out></h1>
			<a href="/logout">Logout</a>
		</div>
		<div>
			<p>TV Shows</p>
		</div>
		<div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Show</th>
						<th>Network</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${shows}" var="show">
					<tr>
						<td><a href="/shows/${show.id}"><c:out value="${show.title}"></c:out></a></td>
						<td><c:out value="${show.network}"></c:out></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<a class="btn btn-light" href="/shows/new" role="button">Add a Show</a>
		</div>
	</div>
</body>
</html>