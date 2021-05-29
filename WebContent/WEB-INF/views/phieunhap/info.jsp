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
				<li>Mã phiếu nhập: ${phieunhap.idpn}</li>
				<li>Ngày nhập: ${phieunhap.ngaynhap}</li>
				<li>Tên Nhân viên: ${phieunhap.nv.ho} ${phieunhap.nv.ten}</li>
		</div>
  		<table class="table table-striped">
			<tr>
				<th>Tên mặt hàng</th>
				<th>Số lượng</th>
				<th>Giá</th>
				<th></th>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="ctphieunhap" items="${nPhieu}">
				<tr>
					<td>${ctphieunhap.mathang.tenmathang}</td>
					<td>${ctphieunhap.soluong}</td>
					<td>${ctphieunhap.gia}</td>
				</tr>
			</c:forEach>
		</table>
		<form action="phieunhap/index.htm" method="get">
			<button class="btn btn-success">Back</button>
		</form>
	</div>
</div>
</div>
</div>
</body>
</html>