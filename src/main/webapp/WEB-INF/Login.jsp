<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Project Manager</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div>
			<h1>Book Club</h1>
			<p>A place for friends to share thoughts on books.</p>
		</div>
		<div class="row">
			<div class="col">
			<h2>Register</h2>
			<form:form action="/user/register" method="post" modelAttribute="newUser" class="form">
				<div class="form-row">
					<form:errors path="name"/>
					<form:label path="name">Name</form:label>
					<form:input path="name" type="text"/>
				</div>
				<div class="form-row">
					<form:errors path="email"/>
					<form:label path="email">Email</form:label>
					<form:input path="email" type="email"/>
				</div>
				<div class="form-row">
					<form:errors path="password"/>
					<form:label path="password">Password</form:label>
					<form:input path="password" type="password"/>
				</div>
				<div class="form-row">
					<form:errors path="confirm"/>
					<form:label path="confirm">Confirm Password</form:label>
					<form:input path="confirm" type="password"/>
				</div>
				<button type="submit">Submit</button>
			</form:form>
		</div>
		
		<div class="col">
			<h2>Login</h2>
			<form:form action="/user/login" method="post" modelAttribute="newLogin" class="form">
				<div class="form-row">
					<p><form:errors path="email"/></p>
					<form:label path="email">Email</form:label>
					<form:input path="email" type="email"/>
				</div>
				<div>
					<form:errors path="password"/>
					<form:label path="password">Password</form:label>
					<form:input path="password" type="password"/>
				</div>
				<button type="submit">Login</button>
			</form:form>
		</div>
		
		</div>

	</div>

</body>
</html>