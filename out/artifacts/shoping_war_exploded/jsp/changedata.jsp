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
            href="IndexServlet?action=changedata" class="on">个人中心</a>
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
                    <div>账户：${user.username}</div>
                    <div>昵称：${user.nickname}</div>
                    <div>联系电话：${user.phone}</div>
                    <div>性别：${user.sex}</div>
                    <div>邮箱：${user.email}</div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="mask"></div>
<div class="bj">
    <div class="clearfix"><a href="#" class="fr gb"><img src="${pageContext.request.contextPath}/img/icon4.png"/></a>
    </div>
    <h3>编辑基础资料</h3>
    <form action="${pageContext.request.contextPath}/UserServlet?action=userselfchange" method="post">
        <input type="hidden" name="id" value="${user.id}">
        <p><label>账 户：</label><input type="text" name="username" value="${user.username}"/></p>
        <p><label>昵 称：</label><input type="text" name="nickname" value="${user.nickname}"/></p>
        <p><label>电 话：</label><input type="text" name="user_Mobile" value="${user.phone}"/></p>
        <label>性 别：</label>
        <span>
                <input type="radio" value="男" name="user_Sex" ${user.sex=='男'?"checked":""}>男
                <input type="radio" value="女" name="user_Sex" ${user.sex=='女'?"checked":""}>女
             </span>
        <p><label>邮 箱：</label><input type="text" name="user_Email" value="${user.email}"/></p>
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
