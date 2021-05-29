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
				<th>Mã Phiếu Mượn</th>
				<th>Ngày Mượn</th>
				<th>Tên Nhân Viên</th>
				<th>Phiếu Đã Trả</th>
				<th></th>
				<th></th>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="phieumuon" items="${nPhieu}">
				<tr>
					<td>${phieumuon.idpm}</td>
					<td>${phieumuon.ngaymuon}</td>
					<td>${phieumuon.nhanvien.ten}</td>
					<c:if test="${phieumuon.datra == true}">
						<td>Đã trả</td>
					</c:if>
					<c:if test="${phieumuon.datra != true}">
						<td>Chưa trả</td>
					</c:if>
					<td>
						<a href="phieumuon/info/${phieumuon.idpm}.htm">
							<button class="btn btn-success">
								<img alt="" src="resources/assets/img/delete.png"> 
								InFo
							</button>
						</a>
					</td>
					<td>
						<a href="phieumuon/delete/${phieumuon.idpm}.htm">
							<button class="btn btn-success">
								<img alt="" src="resources/assets/img/delete.png"> 
								Delete
							</button>
						</a>
					</td>
					<td>
						<a href="phieumuon/update/${phieumuon.idpm}.htm">
							<button class="btn btn-success">
								<img alt="" src="resources/assets/img/update.png"> 
								Update
							</button>
						</a>
					</td>
					<td>
						<a href='phieumuon/return/${phieumuon.idpm}.htm?datra=${phieumuon.datra?"1":"0"}'>
							<button class="btn btn-success">
								<img alt="" src="resources/assets/img/update.png"> 
								Return
							</button>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<form action="phieumuon/insert.htm" method="get">
			<button class="btn btn-success">Insert</button>
		</form>
	</div>
</div>
</div>
</div>
</body>
</html>