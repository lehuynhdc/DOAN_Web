<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Register</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="resources/assets/dist/css/ionicons/png/512/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/assets/dist/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/assets/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/assets/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/assets/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/assets/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/assets/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/assets/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/assets/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/assets/dist/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/assets/dist/css/main.css">
<!--===============================================================================================-->

<style type="text/css">
.dropdown {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.06)) repeat scroll 0 0 #F2F2F2;
    border-color: #FFFFFF #F7F7F7 #F5F5F5;
    border-image: none;
    border-radius: 3px;
    border-style: solid;
    border-width: 1px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.08);
    display: inline-block;
    height: 40px;
    overflow: hidden;
    position: relative;
    width: 150px;
}
.dropdown:before, .dropdown:after {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: #888888 rgba(0, 0, 0, 0);
    border-image: none;
    border-style: dashed;
    border-width: 4px;
    content: "";
    height: 0;
    pointer-events: none;
    position: absolute;
    right: 10px;
    top: 9px;
    width: 0;
    z-index: 2;
}
.dropdown:before {
    border-bottom-style: solid;
    border-top: medium none;
}
.dropdown:after {
    border-bottom: medium none;
    border-top-style: solid;
    margin-top: 7px;
}
.dropdown-select {
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0) !important;
    border: 0 none;
    border-radius: 0;
    color: #62717A;
    font-size: 20px;
    height: 40px;
    line-height: 14px;
    margin: 0;
    padding: 6px 8px 6px 10px;
    position: relative;
    text-shadow: 0 1px #FFFFFF;
    width: 130%;
}
.dropdown-select:focus {
    color: #394349;
    outline: 2px solid #49AFF2;
    outline-offset: -2px;
    width: 100%;
    z-index: 3;
}
.dropdown-select > option {
    background: none repeat scroll 0 0 #F2F2F2;
    border-radius: 3px;
    cursor: pointer;
    margin: 3px;
    padding: 6px 8px;
    text-shadow: none;
</style>

<style type="text/css">
    background: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.4)) repeat scroll 0 0 #444444;
    border-color: #111111 #0A0A0A #000000;
    box-shadow: 0 1px rgba(255, 255, 255, 0.1) inset, 0 1px 1px rgba(0, 0, 0, 0.2);
}
.dropdown-dark:before {
    border-bottom-color: #AAAAAA;
}
.dropdown-dark:after {
    border-top-color: #AAAAAA;
}
.dropdown-dark .dropdown-select {
    background: none repeat scroll 0 0 #444444;
    color: #AAAAAA;
    text-shadow: 0 1px #000000;
}
.dropdown-dark .dropdown-select:focus {
    color: #CCCCCC;
}
.dropdown-dark .dropdown-select > option {
    background: none repeat scroll 0 0 #444444;
    text-shadow: 0 1px rgba(0, 0, 0, 0.4);
}
</style>

</head>
<body style="background-color: #475d62;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="login100-more" style="background-image: url('images/register.jpg');"></div>

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
				<form:form action="register.htm" class="login100-form validate-form" modelAttribute="user" method="post">
					<c:if test="${message != null}">
					  	<div role="alert" style="color: #00FF00 ;">
						  ${message}
						</div>
					</c:if>
					<span class="login100-form-title p-b-59">
						Sign Up
					</span>

					<div class="wrap-input100 validate-input" data-validate="First Name is required">
						<span class="label-input100">First Name</span>
						<input class="input100" type="text" name="ten" placeholder="First Name...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Last Name is required">
						<span class="label-input100">Last Name</span>
						<input class="input100" type="text" name="ho" placeholder="Last Name...">
						<span class="focus-input100"></span>
					</div>
										
					<div class="wrap-input100 validate-input" data-validate="Username is required">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="username" placeholder="Username...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="password" placeholder="*************">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Repeat Password is required">
						<span class="label-input100">Repeat Password</span>
						<input class="input100" type="password" name="repeat-pass" placeholder="*************">
						<span class="focus-input100"></span>
					</div>

					
					<div class="wrap-input100 validate-input dropdown dropdown-dark" data-validate = "Gender is required">
					      <select name="gioitinh" class="dropdown-select">
					        <option value="Nam">Nam</option>
					        <option value="Nữ">Nữ</option>
					      </select>
					</div>
						
					<!-- <div class="flex-m w-full p-b-33">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								<span class="txt1">
									I agree to the Terms of User
								</span>
							</label>
						</div>
					</div> -->

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Sign Up
							</button>
						</div>

						<a href="login.htm" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
							Sign in
							<i class="fa fa-long-arrow-right m-l-5"></i>
						</a>
					</div>
				</</form:form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="resources/assets/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/assets/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/assets/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/assets/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/assets/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/assets/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="resources/assets/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="resources/assets/js/main.js"></script>

</body>
</html>