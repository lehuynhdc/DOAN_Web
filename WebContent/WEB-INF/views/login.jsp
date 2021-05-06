<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp" %>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/assets/dist/css/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="resources/assets/dist/css/login.css" rel="stylesheet">
	<style>
	body {
	  background:#475d62 url(images/login1.jpg);
	  background-size:cover;
	  background-attachment:fixed;
	  position:relative;
	}
	</style>
	<style type="text/css">
	*[id$=errors]{
		color:red;
		font-style: italic;
	}
	</style>

</head>

<body>
    <div class="login-dark">
        <form:form action="${pageContext.servletContext.contextPath}/login.htm" modelAttribute="user" method="post">
            <h2 class="sr-only">Login Form</h2>
            <c:if test="${message != null}">
			  	<div role="alert" style="color: red;">
				  ${message}
				</div>
			  </c:if>
            <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
            <div class="form-group">
            	<form:input class="form-control" type="text" path="username" placeholder="Username"/>
            	<form:errors path="username"/>
            </div>
            <div class="form-group">
            	<form:input class="form-control" type="password" path="password" placeholder="Password"/>
            	<form:errors path="password"/>
            </div>
            <div class="form-group">
            	<button class="btn btn-primary btn-block" type="submit">Login</button>
	          	<a href="#" class="forgot">Forgot your username or password?</a>
            </div>
    	</form:form>
    	 <!-- <form action="register.htm">
          	<button class="btn btn-primary btn-block" type="submit">Register</button>
          	<a href="#" class="forgot">Forgot your username or password?</a>
         </form> -->
            
    </div>
    <script src="resources/assets/dist/js/jquery.min.js"></script>
    <script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>