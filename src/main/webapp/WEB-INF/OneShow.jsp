<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit My Task</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div class="row justify-content-between align-items-center">
			<h1><c:out value="${show.title}"></c:out></h1>
			<a href="/shows">Back to Dashboard</a>
		</div>
		<div class="row">
			<table class="row table">
				<tr>
					<th>Posted By:</th>
					<td class="font-weight-bold"><c:out value="${show.user.name}"></c:out></td>
				</tr>
				<tr>
					<th>Network:</th>
					<td><c:out value="${show.network}"></c:out></td>
				</tr>
				<tr>
					<th>Description:</th>
					<td><c:out value="${show.description}"></c:out></td>
				</tr>
			</table>
			<a class="btn btn-light" href="/shows/${show.id}/edit" role="button">Edit</a>
		</div>
	</div>
	
</body>
</html>