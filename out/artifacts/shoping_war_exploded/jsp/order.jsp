<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>order</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/proList.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
</head>
<body>
<div class="head ding">
    <%@include file="header.jsp" %>
</div>
<div class="cart mt">
    <div class="site">
        <p class=" wrapper clearfix">
            <span class="fl">订单确认</span>
            <img class="top" src="${pageContext.request.contextPath}/img/cartTop02.png">
        </p>
    </div>
    <div class="table wrapper">
        <div class="tr">
            <div style="width: 20%">商品</div>
            <div style="width: 20%">单价</div>
            <div style="width: 20%">数量</div>
            <div style="width: 20%">小计</div>

        </div>
        <c:forEach items="${order}" var="order">
            <div class="th">
                <input type="hidden" name="id" value="${order.id}">
                <div class="pro clearfix" style="width: 400px;">
                    <a class="fl"
                       href="${pageContext.request.contextPath}/jsp/IndexServlet?action=productdetails&product_id=${order.productId}">
                        <dl class="clearfix">
                            <dt class="fl"><img src="/photo/${order.product.productImage}"
                                                style="width: 100px;height: 100px;"></dt>
                            <dt class="fl" style="width: 220px;font-size: 15px"><p>${order.product.productName}</p></dt>
                        </dl>
                    </a>
                </div>
                <div class="price" style="width: 200px;text-align: center;padding-left: 20px;">￥${order.product.productPrice}0</div>
                <div class="number" style="width: 200px;text-align: center">
                    <p class="num clearfix">
                        <span class="fl">${order.cartNum}</span>
                    </p>
                </div>
                <div class="price sAll" style="width: 20%;text-align: center;padding-left: 20px;">￥${order.product.productPrice * order.cartNum}</div>


            </div>

        </c:forEach>
        <br>
        <br>
        <br>
        <br>

        <div>

            <span>地址:</span>
            <input type="text" id="address" value="${address.address}"
                   style="margin-left:35px;width: 500px;height: 45px;border:1px solid #dbdbdb;outline:none;font-size:20px;text-indent:10px;"><br>
            <span>电话:</span>
            <input type="text" id="phone" value="${address.phone}"
                   style="margin-left:35px;width: 500px;height: 45px;border:1px solid #dbdbdb;outline:none;font-size:20px;text-indent:10px;"><br>
            <span>真实姓名:</span>
            <input type="text" id="realname" value="${address.name}"
                   style="margin-left: 12px; width: 500px;height: 45px;	border:1px solid #dbdbdb;outline:none;font-size:20px;text-indent:10px;">
        </div>
        <br>
        <br>
        <div class="tr clearfix">
            <p class="fr">
                <span>共<small id="sl">${count}</small>件商品</span>
                <span>合计:&nbsp;<small id="all">￥${totalprice}</small></span>
                <button style="width: 150px;height: 40px;color:white;background-color: red;margin-left: 30px"
                        onclick="pay()">立即支付
                </button>
            </p>
        </div>

    </div>


</div>
<div class="footer">
    <div class="top">
        <div class="wrapper">
            <div class="clearfix"><a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot1.png"/></a><span
                    class="fl">7天无理由退货</span>
            </div>
            <div class="clearfix"><a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot2.png"/></a><span
                    class="fl">15天免费换货</span>
            </div>
            <div class="clearfix"><a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot3.png"/></a><span
                    class="fl">满599包邮</span>
            </div>
            <div class="clearfix"><a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot4.png"/></a><span
                    class="fl">手机特色服务</span>
            </div>
        </div>
    </div>
</div>
<script>


    var address;
    var phone;
    var realname;

    function pay() {
        var str = "";
        $("input[name='id']").each(function (index, item) {
            if ($("input[name='id']").length - 1 == index) {
                str += $(this).val();
            } else {
                str += $(this).val() + ",";
            }


            address = document.getElementById("address").value;
            phone = document.getElementById("phone").value;
            realname = document.getElementById("realname").value;
        });
        if (address == "") {
            alert("地址不能为空！！！！！");
            return false;
        } else if (phone == "") {
            alert("电话号码不能为空");
            return false;
        } else if (realname == "") {
            alert("请输入真实姓名");
            return false;
        } else {
            location.href = "${pageContext.request.contextPath}/jsp/IndexServlet?action=addorder&str=" + str + "&address=" + address + "&phone=" + phone + "&realname=" + realname;
            alert("支付成功")
        }

    }
</script>
<script src="${pageContext.request.contextPath}/js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/cart.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
