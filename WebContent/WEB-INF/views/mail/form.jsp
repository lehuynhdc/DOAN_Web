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
				<form action="mail/send.htm" method="post">
					<p><input class="form-control" name="username" placeholder="Username"></p>
					<p><input class="form-control" name="to" placeholder="To"></p>
					<button type="submit" class="btn btn-success">Send</button>		
				</form>
			</div>
		</div>
	</div>
</div>