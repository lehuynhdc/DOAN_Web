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
  		<form action="phieumuon/insert.htm" method="post">
  			<div class="container">
	  			    
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Tên nhân viên</label>
	    		  <select class="form-select" name="idnv">
			        <c:forEach var="nv" items="${nvs}">
				        <option value="${nv.idnv}" label="${nv.tennv}">
			        </c:forEach>
			      </select>
			    </div>
			    
			    <div class="mb-3">
			      <!-- <label for="disabledTextInput" class="form-label">Mã Phiếu Mượn</label> -->
			      <input name="idpm" value="${pm.idpm}" type="hidden"/>
			    </div>
			    <div class="mb-3">
			      <!-- <label for="disabledTextInput" class="form-label">Phiếu Đã Trả</label> -->
	    		  <input name="datra" value="${datra}" type="hidden"/>
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