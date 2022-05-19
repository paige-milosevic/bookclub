<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Create a Task</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div class="row justify-content-between align-items-center">
			<h1>Create a New TV Show</h1>
		</div>
		<div class="row">
			<form:form action="/shows/create" method="post" modelAttribute="show">
				<div>
					<div class="text-danger">
						<form:errors path="title"/>
					</div>
					<form:label path="title">Title</form:label>
					<form:input path="title" input="text"/>
				</div>
				<div>
					<div class="text-danger">
						<form:errors path="network"/>
					</div>
					<form:label path="network">Network</form:label>
					<form:input path="network" input="text"/>
				</div>
				<div>
					<div class="text-danger">
						<form:errors path="description"/>
					</div>
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
		</div>
	</div>
</body>
</html>