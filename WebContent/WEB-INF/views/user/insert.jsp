<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%@include file="/common/taglib.jsp"%>
	<%@include file="home.jsp"%>
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
  		<form:form action="user/insert.htm" modelAttribute="user" method="post" onsubmit="return kt()">
  			<div class="container">
	  			<div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Username</label>
			      <form:input path="username"/>
			    </div>
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Password</label>
			      <form:input path="password" type="password"/>
			    </div>
			    <div class="mb-3">
			    	<!-- <label for="disabledTextInput" class="form-label">Chức vụ</label> -->
           	    	<input name="idphanquyen" type="hidden" value="${user.phanquyen.idpq}"/>
			    </div>
			    <div class="mb-3">
           	    	<input name="idnhanvien" type="hidden" value="${user.nhanvien.idnv}"/>
			    </div>
			    <div>
			    	<button class="btn btn-success">Insert</button>
			    </div> 
		    </div> 
  		</form:form>
	</div>
</div>
</div>
</div>
<script>
	function kt(){
		  var username = document.getElementById("username").value;
		  var password = document.getElementById("password").value;
		  if(username == "" || username == " "){
			  alert("Phải nhập đủ username và password !!!");
			  return false;
		  }
		  if(password == "" || password == " "){
			  alert("Phải nhập đủ username và password !!!");
			  return false;
		  }
		}
</script>
</body>
</html>