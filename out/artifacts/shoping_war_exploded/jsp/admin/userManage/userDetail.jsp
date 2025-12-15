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
	<meta charset="UTF-8">
	<title>用户详情页</title>
	<link rel="stylesheet" href="bs/css/bootstrap.css">
	<style type="text/css">
		body{
			margin:0;
			padding:0;
			background:#eee;
		}

		.container .row{
			line-height: 30px;
			htight:30px;
		}

	</style>
</head>
<body>
	<h2 class="text-center">用户详情</h2>
	<div class="container">
		<div class="row">
			<div class="col-md-2 text-right">用户编号</div>
			<div class="col-md-10">${userInfo.id}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">用户名</div>
			<div class="col-md-10">${userInfo.username}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">用户密码</div>
			<div class="col-md-10">${userInfo.password}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">姓名</div>
			<div class="col-md-10">${userInfo.nickname}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">性别</div>
			<div class="col-md-10">${userInfo.sex}</div>
		</div>

		<div class="row">
			<div class="col-md-2 text-right">电话</div>
			<div class="col-md-10">${userInfo.phone}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">邮箱</div>
			<div class="col-md-10">${userInfo.email}</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">余额</div>
			<div class="col-md-10">${userInfo.balance}</div>
		</div>

	</div>
</body>
</html>
