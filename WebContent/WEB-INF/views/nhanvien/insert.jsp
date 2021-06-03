<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%@include file="/common/taglib.jsp"%>
	<%@include file="home.jsp"%>
	<base href="${pageContext.servletContext.contextPath}/">
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
  		<form:form action="nhanvien/insert.htm" modelAttribute="nv" method="post" onsubmit="return kt()">
  			<div class="container">
	  			<div class="mb-3">
			      <!-- <label for="disabledTextInput" class="form-label">Mã nhân viên</label> -->
			      <form:input path="idnv" type="hidden"/>
			    </div>
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Họ</label>
			      <form:input path="ho"/>
			    </div>
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Tên</label>
			      <form:input path="ten"/>
			    </div>
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Giới Tính</label>
	    		  <form:select path="gioitinh" class="dropdown-select">
			        <form:option value="Nam">Nam</form:option>
			        <form:option value="Nữ">Nữ</form:option>
			      </form:select>
			    </div>
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Địa chỉ</label>
			      <form:input path="diachi"/>
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
		  var ho = document.getElementById("ho").value;
		  var ten = document.getElementById("ten").value;
		  if(ho == "" || ho == " "){
			  alert("Phải nhập đủ họ và tên !!!");
			  return false;
		  }
		  if(ten == "" || ten == " "){
			  alert("Phải nhập đủ họ và tên !!!");
			  return false;
		  }
		}
</script>
</body>
</html>