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
		<div class="justify-content-between">
			<h1><c:out value="${show.title}"></c:out></h1>
		</div>
		<div>
			<form:form action="/shows/update/${show.id}" method="post" modelAttribute="show">
				<input type="hidden" name="_method" value="put"/>
				<div>
					<form:errors path="title"/>
					<form:label path="title">Title</form:label>
					<form:input path="title" input="text"/>
				</div>
				<div>
					<form:errors path="network"/>
					<form:label path="network">Network</form:label>
					<form:input path="network" input="text"/>
				</div>
				<div>
					<form:errors path="description"/>
					<form:label path="description">Description</form:label>
					<form:textarea path="description" input="text"/>
				</div>
				<div>
					<form:errors path="user"/>
					<form:input type="hidden" path="user" value="${user.id}"/>
				</div>
				<a class="btn btn-light" href="/shows" role="button">Cancel</a>
				<input class="btn btn-light" type="submit" values="Submit">

			</form:form>
			<form:form action="/shows/destroy/${show.id}" method="delete">
				<button class="btn btn-danger">Delete</button>
			</form:form>
		</div>
	</div>
</body>
</html>