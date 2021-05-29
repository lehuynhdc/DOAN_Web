<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/common/taglib.jsp"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <title>Send email</title>
	<base href="${pageContext.servletContext.contextPath}/">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">

    

    <!-- Bootstrap core CSS -->
<%-- <link href="<c:url value="resource/assets/dist/css/bootstrap.min.css"/>" rel="stylesheet"> --%>
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <%-- <link href="<c:url value="resources/assets/dist/css/navbar-top.css"/>" rel="stylesheet"> --%>
    <link href="resources/assets/dist/css/navbar-top.css" rel="stylesheet">
  </head>
  <body>
    
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Top navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<main class="container">
	<div class="bg-light p-5 rounded">
  		${message}
		<form action="mail/send.htm" method="post">
			<p><input class="form-control" name="username" placeholder="Username"></p>
			<p><input class="form-control" name="to" placeholder="To"></p>
			<button type="submit" class="btn btn-primary">Send</button>		
		</form>
	</div>
</main>



<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send email</title>
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
	${message}
	<form action="mailer/send.htm" method="post">
		<p><input name="from" placeholder="From"></p>
		<p><input name="to" placeholder="To"></p>
		<p><input name="subject" placeholder="Subject"></p>
		<p><textarea name="body" placeholder="Body" rows="3" cols="30"></textarea></p>
		<button>Send</button>		
	</form>
</body>
</html> --%>