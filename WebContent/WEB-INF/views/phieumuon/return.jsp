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
				<form action="phieumuon/returns.htm" method="post" onsubmit="return kt()">
			    <div class="mb-3">
			      <label for="disabledTextInput" class="form-label">Tên nhân viên: ${nv.ho} ${nv.ten}</label>
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
			      <!-- <label for="disabledTextInput" class="form-label">Mã Phiếu Mượn</label> -->
			      <input name="idpm" value="${phieumuon.idpm}" type="hidden"/>
			    </div>
			    <table class="table table-striped">
					<tr>
						<th>Tên mặt hàng</th>
						<th>Số lượng mượn</th>
						<th>Số lượng hư</th>
						<th></th>
						<td></td>
					</tr>
					<c:forEach var="ctphieumuon" items="${ctPMs}">
						<tr>
							<td>
								${ctphieumuon.mathang.tenmathang}
								<input name="id" value="${ctphieumuon.id}" type="hidden">								
							</td>
							<td>
								${ctphieumuon.soluong}
							</td>
							<td>
								<input type="number" name="soluonghu" id="hu_${ctphieumuon.id}" value="${soluonghu}">
							</td>
						</tr>
					</c:forEach>
				</table>
			    <div>
			    	<button class="btn btn-success"> Return</button>
			    </div> 
			    </form>
		    </div> 
	</div>
</div>
</div>
</div>
<script src="resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function showModal(id, soluong){
		document.getElementById("id").value=id;
		document.getElementById("soluongmuon").value=soluong;
	}
	function kt(){
	    var idmuon, idhu;
	    <c:forEach var="ct" items="${ctPMs}">
	        idhu = document.getElementById("hu_${ct.id}").value;//Lấy input vd: id=5 thì id="hu_5"
	        idmuon = ${ct.soluong};//lấy số lượng từ database
	        if (idhu > idmuon || idhu < 0){
	            alert("Số lượng hư phải lớn hơn 0 và nhỏ hơn hoặc bằng số lượng đã mượn !!!");
	            return false;
	        }
	    </c:forEach>
	}
</script>
</body>
</html>