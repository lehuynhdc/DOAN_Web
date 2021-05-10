<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%@include file="/common/taglib.jsp"%>
	<%@include file="home.jsp"%>
	<base href="${pageContext.servletContext.contextPath}/">
<!-- <!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <title>Quản lí nhân viên</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">

    

    Bootstrap core CSS
<link href="resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
    

    
    Custom styles for this template
    <link href="resources/assets/dist/css/navbar-top.css" rel="stylesheet">
  </head>
  <body>
    
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.htm">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="nhanvien/insert.htm">Insert</a>
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
</nav> -->

<style>
		.container {
		  width: 50%;
		  clear: both;
		}
		
		.container input {
		  width: 100%;
		  clear: both;
		}
    </style>
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

<div class="main-panel">
<div class="content">
<div class="container-fluid">
	<div class="bg-light p-5 rounded">
  		<form:form action="mathang/update.htm" modelAttribute="mh" method="post">
  			<div class="container">
	  			<div class="mb-3">
			      <!-- <label for="disabledTextInput" class="form-label">Mã nhân viên</label> -->
			      <form:input path="idmathang" type="hidden"/>
			    </div>
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Tên mặt hàng</label>
			      <form:input path="tenmathang"/>
			    </div>
			    <div>
			    	<button class="btn btn-success">Update</button>
			    </div> 
		    </div> 
  		</form:form>
	</div>
</div>
</div>
</div>
</body>
</html>