<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mygrxx.css"/>
</head>
<body>
<div class="head ding">
    <%@include file="header.jsp" %>
</div>
<div class="address mt" id="add">
    <div class="wrapper clearfix"><a href="IndexServlet?action=base" class="fl">首页</a><span>/</span><a
            href="IndexServlet?action=address" class="on">收货地址</a>
    </div>
</div>
<div class="Bott">
    <div class="wrapper clearfix">
        <%@include file="dataAside.jsp" %>
        <div class="you fl"><h2>个人信息</h2>
            <div class="gxin">
                <div class="tx"><a href="#"><img src="${pageContext.request.contextPath}/img/tx.png"/>
                </a></div>
                <div class="xx"><h3 class="clearfix"><strong class="fl">基础资料</strong><a href="#" class="fr" id="edit1">编辑</a>
                </h3>
                    <div>收件人：${address.name}</div>
                    <div>收件人电话：${address.phone}</div>
                    <div>收件地址：${address.address}</div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="mask"></div>
<div class="bj">
    <div class="clearfix"><a href="#" class="fr gb"><img src="${pageContext.request.contextPath}/img/icon4.png"/></a>
    </div>
    <h3>编辑地址</h3>
    <form action="${pageContext.request.contextPath}/jsp/IndexServlet?action=addresschange" method="post">
        <input type="hidden" name="id" value="${address.id}">
        <p><label>收件人：</label><input type="text" name="name" value="${address.name}"/></p>
        <p><label>收件人电话：</label><input style="width: 200px" type="text" name="phone" value="${address.phone}"/></p>
        <p><label>收件地址：</label><input type="text" name="address" value="${address.address}"/></p>

        <div class="bc"><input type="submit" value="保存"/><input type="button" value="取消"/></div>
    </form>
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
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/user.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
