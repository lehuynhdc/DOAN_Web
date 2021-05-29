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
  		<form action="phieunhap/insert.htm" method="post">
  			<div class="container">
	  			    
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Tên nhân viên</label>
	    		  <select class="form-select" name="idnv">
			        <c:forEach var="nv" items="${nvs}">
				        <option value="${nv.idnv}" label="${nv.tennv}" ${phieunhap.nv.idnv==nv.idnv?'selected':''}>
			        </c:forEach>
			      </select>
			    </div>
			    
			    <div class="mb-3">
			      <!-- <label for="disabledTextInput" class="form-label">Mã Phiếu Nhập</label> -->
			      <input name="idpn" value="${pn.idpn}" type="hidden"/>
			    </div>
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Tên nhà cung cấp</label>
	    		  <select class="dropdown-select" name="idncc">
			        <c:forEach var="ncc" items="${nccs}">
				        <option value="${ncc.idncc}" label="${ncc.tenncc}" ${phieunhap.ncc.idncc==ncc.idncc?'selected':''}>
			        </c:forEach>
			      </select>
			    </div>
			    <div>
			    	<button class="btn btn-success">Insert</button>
			    </div> 
		    </div> 
  		</form>
	</div>
</div>
</div>
</div>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>