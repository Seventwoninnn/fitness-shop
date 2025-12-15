<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单修改</title>
    <link rel="stylesheet" type="text/css" href="bs/css/bootstrap.css">
    <script type="text/javascript" src="bs/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="bs/validform/style.css">
    <script type="text/javascript" src="bs/validform/Validform_v5.3.2_min.js"></script>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background: #eee;
        }

        #ordersEditForm {
            margin-top: 20px;
        }

        .row {
            margin-top: 10px;

        }
    </style>
</head>
<body>
<div class="container">
    <c:if test="${!empty ordersMessage}">
        <h3 class="text-center">${ordersMessage}</h3>
    </c:if>
    <h2 class="text-center">订单修改</h2>


    <form id="ordersEditForm" class="form-horizontal" action="jsp/admin/OrdersManageServlet?action=update"
          method="post">
        <input type="hidden" name="id" value="${ordersInfo.id}">
        <input type="hidden" name="productId" value="${ordersInfo.productId}">
        <input type="hidden" name="userId" value="${ordersInfo.userId}">
        <div class="form-group">
            <label for="orderNo" class="col-sm-2 col-sm-offset-2 control-label">订单编号</label>
            <div class="col-sm-4">
                <input type="text" name="orderNo" id="orderNo" class="form-control" value="${ordersInfo.orderNo}">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>
        <div class="form-group">
            <label for="productId" class="col-sm-2 col-sm-offset-2 control-label">商品名称</label>
            <div class="col-sm-4">
                <input type="text" id="productId" class="form-control" value="${ordersInfo.product.productName}">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-sm-offset-2 control-label">客户名称</label>
            <div class="col-sm-4">
                <input type="text" readonly="readonly" class="form-control" value="${userInfo.nickname}">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>
        <div class="form-group">
            <label for="num" class="col-sm-2 col-sm-offset-2 control-label">产品数量</label>
            <div class="col-sm-4">
                <input type="text" name="num" id="num" class="form-control" value="${ordersInfo.num}">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>
        <div class="form-group">
            <label for="price" class="col-sm-2 col-sm-offset-2 control-label">产品总价</label>
            <div class="col-sm-4">
                <input type="text" name="price" id="price" class="form-control" value="${ordersInfo.price}">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>
        <div class="form-group">
            <label for="createTime" class="col-sm-2 col-sm-offset-2 control-label">订单创建时间</label>
            <div class="col-sm-4">
                <input type="text" name="createTime" id="createTime" class="form-control"
                       value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ordersInfo.createTime}"/>">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>
        <div class="form-group">
            <label for="status" class="col-sm-2 col-sm-offset-2 control-label">订单状态</label>
            <div class="col-sm-4">
                <select name="status" id="status" class="form-control" required>

                    <option value="0" <c:if test="${ ordersInfo.status eq '0'}">selected</c:if>>已付款</option>
                    <option value="2" <c:if test="${ ordersInfo.status eq '2'}">selected</c:if>>已发货</option>
                    <option value="3" <c:if test="${ ordersInfo.status eq '3'}">selected</c:if>>已确认收货</option>
                    <option value="1" <c:if test="${ ordersInfo.status eq '1'}">selected</c:if>>已退货</option>
                </select>
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 col-sm-offset-2 control-label">收货地址</label>
            <div class="col-sm-4">
                <input type="text" name="address" id="address" class="form-control" value="${ordersInfo.address}">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-sm-2 col-sm-offset-2 control-label">收件人电话</label>
            <div class="col-sm-4">
                <input type="text" name="phone" id="phone" class="form-control" value="${ordersInfo.phone}">
            </div>
            <div class="col-sm-4 Validform_checktip"></div>
        </div>
        <div class="form-group">
            <label for="realname" class="col-sm-2 col-sm-offset-2 control-label">收件人姓名</label>
            <div class="col-sm-4">
                <input type="text" name="realname" id="realname" class="form-control" value="${ordersInfo.realname}">
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
<script type="text/javascript">


</script>

</body>
</html>
