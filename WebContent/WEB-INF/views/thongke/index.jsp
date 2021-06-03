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
		<h2 style="text-align: center;"><span class="badge bg-success">Thống kê mặt hàng hư</span></h2>
  		<table class="table table-striped">
			<tr>
				<th>Mã mặt hàng</th>
				<th>Tên mặt hàng</th>
				<td>Số Lượng hư</td>
				<td></td>
			</tr>
			<c:forEach var="mathang" items="${items}">
				<tr>
					<td>${mathang.idmathang}</td>
					<td>${mathang.tenmathang}</td>
					<td>${mathang.SLHu}</td>
				</tr>
			</c:forEach>
		</table>
		
		<h2 style="text-align: center;"><span class="badge bg-success">Thống kê mặt hàng còn dùng được</span></h2>
  		<table class="table table-striped">
			<tr>
				<th>Mã mặt hàng</th>
				<th>Tên mặt hàng</th>
				<td>Số lượng còn dùng được</td>
				<td></td>
			</tr>
			<c:forEach var="mathang" items="${items}">
				<tr>
					<td>${mathang.idmathang}</td>
					<td>${mathang.tenmathang}</td>
					<td>${mathang.SLConDungDuoc}</td>
				</tr>
			</c:forEach>
		</table>
		
		<form action="home.htm" method="get">
			<button class="btn btn-success">Back</button>
		</form>
	</div>
</div>
</div>
</div>
</body>
</html>