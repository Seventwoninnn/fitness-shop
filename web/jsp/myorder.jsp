<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>订单信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mygrxx.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <style>
        .order {
            width: 100%;
        }

        .ordertable {
            width: 100%;
        }

        th {
            height: 50px;
        }

        td {
            height: 50px;
        }

        .box-tools {
            width: 100%;
        }

        .box-tools li {
            float: left;
            margin-left: 10px;
            font-size: 18px;
        }
    </style>
</head>
<body>
<div class="head ding">
    <%@include file="header.jsp" %>
</div>
<div class="address mt" id="add">
    <div class="wrapper clearfix"><a href="IndexServlet?action=base" class="fl">首页</a><span>/</span><a
            href="javascript:void(0);" class="on">个人中心</a>
    </div>
</div>
<div class="Bott">
    <div class="wrapper clearfix">
        <%@include file="dataAside.jsp" %>
        <div class="you fl"><h2>个人订单</h2>
            <div class="gxin">
                <div class="ordertable">
                    <table class="order">
                        <tr style="background-color: #e9e9e9">
                            <th style="width: 65px">订单号</th>
                            <th style="width: 250px">商品</th>
                            <th style="width: 40px">单价</th>
                            <th style="width: 40px">数量</th>
                            <th style="width: 40px">小计</th>
                            <th>下单时间</th>
                            <th style="width: 100px">订单状态</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach var="orders" items="${ordersList}">
                            <tr>
                                <td>${orders.orderNo}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/jsp/IndexServlet?action=productdetails&product_id=${orders.productId}">
                                        <img src="/photo/${orders.product.productImage}" width="100px" height="100px"
                                             style="float: left"/>
                                        <div style="float: left;width: 150px;height: 100px;">
                                                ${orders.product.productName}
                                        </div>
                                    </a>
                                </td>
                                <td>${orders.product.productPrice}</td>
                                <td>${orders.num}</td>
                                <td>${orders.product.productPrice*orders.num}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${orders.createTime}"/></td>
                                <c:if test="${orders.status==1}">
                                    <td>已退货</td>
                                </c:if>
                                <c:if test="${orders.status==0}">
                                    <td>已付款</td>
                                </c:if>
                                <c:if test="${orders.status==2}">
                                    <td>已发货</td>
                                </c:if>
                                <c:if test="${orders.status==3}">
                                    <td>已确认收货</td>
                                </c:if>
                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick="javascript:if(confirm('确定要退货吗?')&& ${orders.status}==0 ) {location.href='${pageContext.request.contextPath}/jsp/IndexServlet?action=updatestatus&order_id=${orders.id}&order_num=${orders.num}&product_id=${orders.productId}'}else{alert('订单状态有误')}">
                                        退货
                                    </button>
                                    <button type="button" class="btn bg-olive btn-xs"
                                            onclick="javascript:if(confirm('确认要收货吗?')&& ${orders.status}==2 ) {location.href='${pageContext.request.contextPath}/jsp/IndexServlet?action=comfim&order_id=${orders.id}'}else{alert('订单状态有误')}">
                                        确认收货
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="box-footer">
                <div class="box-tools">
                    <ul class="pagination">
                        <li>
                            <a href="${pageContext.request.contextPath}/jsp/IndexServlet?action=myorder&page=1&size=${pageInfo.maxSize}"
                               aria-label="Previous">首页</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/jsp/IndexServlet?action=myorder&page=${pageInfo.curPage-1}">上一页</a>
                        </li>
                        <c:forEach begin="1" end="${pageInfo.pageCount}" var="curPage">
                            <li>
                                <a href="${pageContext.request.contextPath}/jsp/IndexServlet?action=myorder&page=${curPage}&size=${pageInfo.maxSize}">${curPage}</a>
                            </li>
                        </c:forEach>

                        <li>
                            <a href="${pageContext.request.contextPath}/jsp/IndexServlet?action=myorder&page=${pageInfo.curPage+1}&size=${pageInfo.maxSize}">下一页</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/jsp/IndexServlet?action=myorder&page=${pageInfo.pageCount}&size=${pageInfo.maxSize}"
                               aria-label="Next">尾页</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>

</div>
</body>
<script>
    function changePageSize() {
        var pagesize = $("#changePageSize").val();
        location.href = "${pageContext.request.contextPath}/order/findAllOrder?page=1&size=" + pagesize;
    }
</script>
</html>
