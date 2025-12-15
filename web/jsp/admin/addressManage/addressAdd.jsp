<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>收货地址增加</title>
	<link rel="stylesheet" type="text/css" href="bs/css/bootstrap.css">
	<script type="text/javascript" src="bs/js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="bs/validform/style.css">
	<script type="text/javascript" src="bs/validform/Validform_v5.3.2_min.js"></script>
	<style type="text/css">
		body{
			margin:0;
			padding:0;
			background:#eee;
		}
	</style>
</head>
<body>
	<div class="container">
		<c:if test="${!empty addressMessage}">
			<h3 class="text-center">${addressMessage}</h3>
		</c:if>
		<h2 class="text-center">收货地址增加</h2>
		<form id="addressAddForm" class="form-horizontal" action="jsp/admin/AddressManageServlet?action=add" method="post" >
						<div class="form-group">
				<label for="phone" class="col-sm-2 col-sm-offset-2 control-label">收件人电话</label>
				<div class="col-sm-4 ">
					<input type="text" name="phone" id="phone" class="form-control" required/>
				</div>
				<div class="col-sm-4 Validform_checktip"></div>
			</div>
					<div class="form-group">
				<label for="address" class="col-sm-2 col-sm-offset-2 control-label">收件人地址</label>
				<div class="col-sm-4 ">
					<input type="text" name="address" id="address" class="form-control" required/>
				</div>
				<div class="col-sm-4 Validform_checktip"></div>
			</div>
					<div class="form-group">
				<label for="name" class="col-sm-2 col-sm-offset-2 control-label">收件人姓名</label>
				<div class="col-sm-4 ">
					<input type="text" name="name" id="name" class="form-control" required/>
				</div>
				<div class="col-sm-4 Validform_checktip"></div>
			</div>
					<div class="form-group">
				<label for="userId" class="col-sm-2 col-sm-offset-2 control-label">用户id</label>
				<div class="col-sm-4 ">
					<input type="text" name="userId" id="userId" class="form-control" required/>
				</div>
				<div class="col-sm-4 Validform_checktip"></div>
			</div>

			<div class="form-group">
					<label class="col-sm-2 col-sm-offset-2 control-label">
						<input class="btn btn-success btn-block" type="submit" value="提交">
					</label>
					<label class="col-sm-2 control-label">
						<input class="btn btn-warning btn-block" type="reset" value="重置">
					</label>

				</div>

		</form>

	</div>

</body>
</html>
