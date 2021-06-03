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
  		
  			<div class="container">
	  			<c:if test="${message != null}">
					<div class="alert alert-success" role="alert">
						${message}
					</div>
				</c:if>
				<form action="phieunhap/update.htm" method="post">
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Tên nhân viên: ${nv.tennv}</label>
			      <input name="idnv" value="${nv.idnv}" type="hidden"/>
	    		  <%-- <select class="form-select" name="idnv">
			        <c:forEach var="nv" items="${nvs}">
				        <option value="${nv.idnv}" label="${nv.tennv}" ${phieunhap.nv.idnv==nv.idnv?'selected':''}>
			        </c:forEach>
			      </select> --%>
			    </div>
			    
			    <div class="mb-3">
			      <!-- <label for="disabledTextInput" class="form-label">Mã Phiếu Nhập</label> -->
			      <input name="idpn" value="${phieunhap.idpn}" type="hidden"/>
			    </div>
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Tên nhà cung cấp</label>
	    		  <select class="dropdown-select" name="idncc">
			        <c:forEach var="ncc" items="${nccs}">
				        <option value="${ncc.idncc}" label="${ncc.tenncc}" ${phieunhap.ncc.idncc==ncc.idncc?'selected':''}>
			        </c:forEach>
			      </select>
			    </div>
			    <button class="btn btn-success"> Update</button>
			    </form>
			    <table class="table table-striped">
					<tr>
						<th>Tên mặt hàng</th>
						<th>Số lượng</th>
						<th>Giá</th>
						<th></th>
						<td></td>
						<td></td>
					</tr>
					<c:forEach var="ctphieunhap" items="${ctPNs}">
						<tr>
							<td>${ctphieunhap.mathang.tenmathang}</td>
							<td>${ctphieunhap.soluong}</td>
							<td>${ctphieunhap.gia}</td>
							<td>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-success" 
								data-bs-toggle="modal" data-bs-target="#editModal" id="edit" onclick="showModal(${ctphieunhap.id}, ${ctphieunhap.soluong}, ${ctphieunhap.gia})">
								  Edit
								</button>
							</td>
							<td>
								<a href="phieunhap/deleteCT/${phieunhap.idpn}/${ctphieunhap.id}.htm" class="btn btn-success">-</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			    <div>
			    	<button type="button" class="btn btn-success" 
								data-bs-toggle="modal" data-bs-target="#addModal" id="add">
					+</button>
			    </div> 
		    </div> 
	</div>
</div>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit số lượng và giá</h5>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
      </div>
      <div class="modal-body">
      	<form action="phieunhap/updates.htm" method="post" >
      		<input name="id" id="id" type="hidden"/>	
      		<input name="idpn" value="${phieunhap.idpn}" type="hidden"/>
      		<div class="mb-3">
								<label for="disabledTextInput" class="form-label">Số lượng</label>
	      		<input name="soluong" id="soluong" type="number" required/>
      		</div>
      		<div class="mb-3">
								<label for="disabledTextInput" class="form-label">Giá</label>
	      		<input name="gia" id="gia" required/>
      		</div>
      		<div class="modal-footer">
		        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
		        <button class="btn btn-success">Save changes</button>
	        </div>
      	</form>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit số lượng và giá</h5>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
      </div>
      <div class="modal-body">
      	<form action="phieunhap/add.htm" method="post" >	
      		<input name="idpn" value="${phieunhap.idpn}" type="hidden"/>
      		<div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Tên mặt hàng</label>
	    		  <select class="dropdown-select" name="idmh">
			        <c:forEach var="mh" items="${mhs}">
				        <option value="${mh.idmathang}" label="${mh.tenmathang}">
			        </c:forEach>
			      </select>
			    </div>
      		<div class="mb-3">
				<label for="disabledTextInput" class="form-label">Số lượng</label>
	      		<input name="soluong" id="soluong2" type="number" required/>
      		</div>
      		<div class="mb-3">
								<label for="disabledTextInput" class="form-label">Giá</label>
	      		<input name="gia" id="gia2" required/>
      		</div>
      		<div class="modal-footer">
		        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
		        <button class="btn btn-success">Save changes</button>
	        </div>
      	</form>
      </div>
    </div>
  </div>
</div>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function showModal(id, soluong, gia){
		document.getElementById("id").value=id;
		document.getElementById("soluong").value=soluong;
		document.getElementById("gia").value=gia;
	}
</script>
</body>
</html>