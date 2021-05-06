<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%@include file="/common/taglib.jsp"%>
<%@include file="home.jsp"%>
<!-- <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.htm">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="nhanvien/insert.htm">Insert</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
 -->
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
				<th>Mã nhân viên</th>
				<th>Họ</th>
				<th>Tên</th>
				<th>Username</th>
				<th>Giới tính</th>
				<th>Địa chỉ</th>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="nv" items="${staffs}">
				<tr>
					<td>${nv.idnv}</td>
					<td>${nv.ho}</td>
					<td>${nv.ten}</td>
					<td>${nv.user.username}</td>
					<td>${nv.gioitinh}</td>
					<td>${nv.diachi}</td>
					<td><a href="nhanvien/delete/${nv.idnv}.htm">Delete</a></td>
					<td><a href="nhanvien/update/${nv.idnv}.htm">Update</a></td>
					<td><a href="user/insert/${nv.idnv}.htm">Create User</a></td>
				</tr>
			</c:forEach>
		</table>
		<form action="nhanvien/insert.htm" method="get">
			<button class="btn btn-success">Insert</button>
		</form>
	</div>
	</div>
	</div>
</div>
</body>
</html>