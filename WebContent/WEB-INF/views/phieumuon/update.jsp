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
				<form action="phieumuon/update.htm" method="post">
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
					<!-- <label for="disabledTextInput" class="form-label">Đã trả</label> -->
					<input name="datra" value="${datra}" type="hidden"/>
		      		<!-- <select name="datra" class="dropdown-select">
				        <option value="1">Đã trả</option>
				        <option value="0">Chưa trả</option>
				      </select> -->
	      		</div>
			    <div class="mb-3">
			      <!-- <label for="disabledTextInput" class="form-label">Mã Phiếu Nhập</label> -->
			      <input name="idpm" value="${phieumuon.idpm}" type="hidden"/>
			    </div>
			    <button class="btn btn-success"> Update</button>
			    </form>
			    <table class="table table-striped">
					<tr>
						<th>Tên mặt hàng</th>
						<th>Số lượng</th>
						<th></th>
						<td></td>
						<td></td>
					</tr>
					<c:forEach var="ctphieumuon" items="${ctPMs}">
						<tr>
							<td>${ctphieumuon.mathang.tenmathang}</td>
							<td>${ctphieumuon.soluong}</td>
							<td>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-success" 
								data-bs-toggle="modal" data-bs-target="#editModal" id="edit" onclick="showModal(${ctphieumuon.id}, ${ctphieumuon.soluong},'${ctphieumuon.mathang.idmathang}')">
								  Edit
								</button>
							</td>
							<td>
								<a href="phieumuon/deleteCT/${phieumuon.idpm}/${ctphieumuon.id}.htm" class="btn btn-success">-</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			    <div>
			    	<button type="button" class="btn btn-success" 
								data-bs-toggle="modal" data-bs-target="#addModal" id="add">
					Thêm Mặt Hàng</button>
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
        <h5 class="modal-title" id="exampleModalLabel">Edit số lượng</h5>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
      </div>
      <div class="modal-body">
      	<form action="phieumuon/updates.htm" method="post" onsubmit="return ktEdit()">
      		<input name="id" id="id" type="hidden"/>
      		
      		<input name="idpm" value="${phieumuon.idpm}" type="hidden"/>
      		<div class="mb-3">
				<label for="disabledTextInput" class="form-label">Số lượng</label>
	      		<input name="soluong" id="soluong" type="number" required/>
	      		<input name="idmh1" id="idmh1" type="hidden"/>	
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
        <h5 class="modal-title" id="exampleModalLabel">Thêm mặt hàng và số lượng</h5>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
      </div>
      <div class="modal-body">
      	<form action="phieumuon/add.htm" method="post"  onsubmit="return ktThem()">	
      		<input name="idpm" value="${phieumuon.idpm}" type="hidden"/>
      		<div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Tên mặt hàng</label>
	    		  <select class="dropdown-select" name="idmh" id="idmh">
			        <c:forEach var="mh" items="${mhs}">
				        <option value="${mh.idmathang}" label="${mh.tenmathang}">
			        </c:forEach>
			      </select>
			    </div>
      		<div class="mb-3">
				<label for="disabledTextInput" class="form-label">Số lượng</label>
	      		<input name="soluong" id="soluong2" type="number" required/>
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
	function showModal(id, soluong, idmh1){
		document.getElementById("id").value=id;
		document.getElementById("soluong").value=soluong;
		document.getElementById("idmh1").value = idmh1;
	}
	function ktThem(){
		  var id = document.getElementById("idmh").value;
		  var sl = document.getElementById("soluong2").value;
		  var dieukien = 0;
		  <c:forEach var="mathang" items="${mhs}">
		    if(id == "${mathang.idmathang}"){
			    dieukien += ${mathang.SLConDungDuocTrongNgay};
			    if(sl > dieukien){
				    alert("Số Lượng Đã Vượt Qua Giới Hạn Cho Phép");
				    return false;
			    }
		   }
		  </c:forEach>
		}
	function ktEdit(){
		  var id = document.getElementById("idmh").value;
		  var sl = document.getElementById("soluong").value;
		  var dieukien = 0;
		  <c:forEach var="mathang" items="${mhs}">
		    if(id == "${mathang.idmathang}"){
			    dieukien += ${mathang.SLConDungDuocTrongNgay};
			    if(sl > dieukien){
				    alert("Số Lượng Mượn Đã Vượt Qua Giới Hạn Cho Phép");
				    return false;
			    }
		   }
		  </c:forEach>
		}
</script>
</body>
</html>