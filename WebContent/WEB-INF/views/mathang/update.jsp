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
  		<form:form action="mathang/update.htm" modelAttribute="mh" method="post" onsubmit="return kt()">
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
<script>
	function kt(){
		  var tenmathang = document.getElementById("tenmathang").value;
		  if(tenmathang == "" || tenmathang == " "){
			  alert("Phải nhập tenmathang !!!");
			  return false;
		  }
		}
</script>
</body>
</html>