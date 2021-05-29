<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%@include file="/common/taglib.jsp"%>
	<%@include file="home.jsp"%>
<div class="main-panel">
<div class="content">
<div class="container-fluid">
	<div class="bg-light p-5 rounded">
		<c:if test="${message != null}">
			<div class="alert alert-success" role="alert">
				${message}
			</div>
		</c:if>
		<div class="alert alert-success" style="text-align: center;" role="alert">
				<li>Mã phiếu mượn: ${phieumuon.idpm}</li>
				<li>Ngày mượn: ${phieumuon.ngaymuon}</li>
				<li>Tên Nhân viên: ${phieumuon.nhanvien.ho} ${phieumuon.nhanvien.ten}</li>
		</div>
  		<table class="table table-striped">
			<tr>
				<th>Tên mặt hàng</th>
				<th>Số lượng</th>
				<th></th>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="ctphieumuon" items="${nPhieu}">
				<tr>
					<td>${ctphieumuon.mathang.tenmathang}</td>
					<td>${ctphieumuon.soluong}</td>
				</tr>
			</c:forEach>
		</table>
		<form action="phieumuon/index.htm" method="get">
			<button class="btn btn-success">Back</button>
		</form>
	</div>
</div>
</div>
</div>
</body>
</html>