<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>cart</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/proList.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
</head>
<body>
    <div class="head ding">
        <%@include file="header.jsp"%>
    </div>
    <div class="cart mt">
        <div class="site">
            <p class=" wrapper clearfix">
            <span class="fl">购物车</span>
            <img class="top" src="${pageContext.request.contextPath}/img/cartTop01.png">
            </p>
        </div>
        <div class="table wrapper">
            <div class="tr">
                <div>商品</div>
                <div>单价</div>
                <div>数量</div>
                <div>小计</div>
                <div>操作</div>
            </div>
            <c:forEach items="${cart}" var="cart">
            <div class="th">
                <div class="pro clearfix">
                    <label class="fl"><input type="checkbox" name="ck" value="${cart.id}"/><span></span></label>
                    <a class="fl" href="${pageContext.request.contextPath}/jsp/IndexServlet?action=productdetails&product_id=${cart.productId}">
                    <dl class="clearfix">
                        <dt class="fl"><img src="/photo/${cart.product.productImage}" style="width: 100px;height: 100px;"></dt>
                        <dt class="fl" style="width: 220px;font-size: 15px"><p>${cart.product.productName}</p></dt>
                    </dl>
                    </a>
                </div>
                <div class="price">￥${cart.product.productPrice}0</div>
                <div class="number">
                    <p class="num clearfix">
                        <img class="fl sub" src="${pageContext.request.contextPath}/img/sub.jpg">
                        <span cartid="${cart.id}" class="fl">${cart.cartNum}</span>
                        <img class="fl add" src="${pageContext.request.contextPath}/img/add.jpg">
                    </p>
                </div>
                <div class="price sAll">￥${cart.product.productPrice * cart.cartNum}</div>
                <div class="price"><a class="del" href="#2" cartid="${cart.id}">删除</a></div>
            </div>
            </c:forEach>
            <div class="goOn">空空如也~<a href="${pageContext.request.contextPath}/jsp/IndexServlet?action=base">去逛逛</a></div>
            <div class="tr clearfix">
                <label class="fl">
                    <input class="checkAll" type="checkbox"/><span></span>
                </label>
                <p class="fl"><a href="">全选</a><a href="#" class="del">删除</a></p>
                <p class="fr">
                    <span>共<small id="sl">0</small>件商品</span>
                    <span>合计:&nbsp;<small id="all">0.00</small></span>
                    <a onclick="toorder()" class="count">结算</a>
                </p>
            </div>
        </div>
    </div>
    <div class="mask"></div>
    <div class="tipDel">
        <p>确定要删除该商品吗？</p>
        <p class="clearfix"><a class="fl cer" href="#">确定</a><a class="fr cancel" href="#">取消</a></p>
    </div>
    <div class="gotop">
        <a href="${pageContext.request.contextPath}/jsp/IndexServlet?action=mydata">
            <dl>
                <dt><img src="${pageContext.request.contextPath}/img/gt3.png"/></dt>
                <dd>个人<br/>中心</dd>
            </dl>
        </a>
        <a href="#" class="toptop" style="display: none;">
            <dl>
                <dt><img src="${pageContext.request.contextPath}/img/gt4.png"/></dt>
                <dd>返回<br/>顶部</dd>
            </dl>
        </a>
    </div>
    <div class="footer">
        <div class="top">
            <div class="wrapper">
                <div class="clearfix"><a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot1.png"/></a><span class="fl">7天无理由退货</span>
                </div>
                <div class="clearfix"><a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot2.png"/></a><span class="fl">15天免费换货</span>
                </div>
                <div class="clearfix"><a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot3.png"/></a><span class="fl">满599包邮</span>
                </div>
                <div class="clearfix"><a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot4.png"/></a><span class="fl">手机特色服务</span>
                </div>
            </div>
        </div>
    </div>
    <div class="mask"></div>
    <div class="pleaseC"><p>请选择宝贝</p><img class="off" src="${pageContext.request.contextPath}/img/off.jpg"/></div>
<script>
    function toorder(){
        var str = "";
        $("input[name='ck']:checked").each(function (index,item) {
            if ($("input[name='ck']:checked").length-1==index){
                str+= $(this).val();
            }else {
                str+=$(this).val()+",";
            }
            location.href="${pageContext.request.contextPath}/jsp/IndexServlet?action=order&str="+str;
        });
    }

</script>
<script src="${pageContext.request.contextPath}/js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/cart.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
