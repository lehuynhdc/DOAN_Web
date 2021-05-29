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
  		<table class="table table-striped">
			<tr>
				<th>Mã Phiếu Nhập</th>
				<th>Ngày Nhập</th>
				<th>Tên Nhân Viên</th>
				<th>Tên Nhà Cung Cấp</th>
				<th></th>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="phieunhap" items="${nPhieu}">
				<tr>
					<td>${phieunhap.idpn}</td>
					<td>${phieunhap.ngaynhap}</td>
					<td>${phieunhap.nv.ten}</td>
					<td>${phieunhap.ncc.tenncc}</td>
					<td>
						<a href="phieunhap/info/${phieunhap.idpn}.htm">
							<button class="btn btn-success">
								<img alt="" src="resources/assets/img/delete.png"> 
								InFo
							</button>
						</a>
					</td>
					<td>
						<a href="phieunhap/delete/${phieunhap.idpn}.htm">
							<button class="btn btn-success">
								<img alt="" src="resources/assets/img/delete.png"> 
								Delete
							</button>
						</a>
					</td>
					<td>
						<a href="phieunhap/update/${phieunhap.idpn}.htm">
							<button class="btn btn-success">
								<img alt="" src="resources/assets/img/update.png"> 
								Update
							</button>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<form action="phieunhap/insert.htm" method="get">
			<button class="btn btn-success">Insert</button>
		</form>
	</div>
</div>
</div>
</div>
</body>
</html>