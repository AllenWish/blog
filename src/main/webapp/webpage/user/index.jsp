<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>AW博客论坛-个人主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="博客,论坛,AW">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="${request.contextPath}/static/layui/layui/css/layui.css">
    <link rel="stylesheet" href="${request.contextPath}/static/layui/css/global.css">
</head>
<body>
<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="${request.contextPath}/">
            <img src="${request.contextPath}/static/layui/images/avatar/11.jpg" width="45" alt="home">
        </a>
        <ul class="layui-nav fly-nav-user">
            <c:if test="${empty LOGINUSER}">
                <% response.sendRedirect("login/login"); %>
            </c:if>
            <c:if test="${!empty LOGINUSER}">
                <!-- 登入的状态 -->
                <li class="layui-nav-item">
                    <a class="fly-nav-avatar" href="javascript:;">
                        <cite class="layui-hide-xs">${LOGINUSER.nickName}</cite>
                        <c:if test="${!empty LOGINUSER.bloggerId}">
                            <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：博主"></i>
                        </c:if>
                        <i class="layui-badge fly-badge-vip layui-hide-xs">${LOGINUSER.integral}</i>
                        <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="user/set"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
                        <dd><a href="user/message"><i class="iconfont icon-tongzhi" style="top: 4px;"></i>我的消息</a></dd>
                        <dd><a href="user/${LOGINUSER.nickName}"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
                        <hr style="margin: 5px 0;">
                        <dd><a href="/login/logout/" style="text-align: center;">退出</a></dd>
                    </dl>
                </li>
            </c:if>
        </ul>
    </div>
</div>

<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear">
            <li class="layui-hide-xs layui-this"><a href="/">首页</a></li>
            <li><a href="">提问</a></li>
            <li><a href="">分享<span class="layui-badge-dot"></span></a></li>
            <li><a href="">讨论</a></li>
            <li><a href="">建议</a></li>
            <li><a href="">公告</a></li>
            <li><a href="">动态</a></li>
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>

            <!-- 用户登入后显示 -->
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="">我发表的贴</a></li>
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="">我收藏的贴</a></li>
        </ul>

        <div class="fly-column-right layui-hide-xs">
            <span class="fly-search"><i class="layui-icon"></i></span>
        </div>
        <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;">
            <a href="/blog/add" class="layui-btn">发表新帖</a>
        </div>
    </div>
</div>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="fly-panel">
                1
            </div>

            <div class="fly-panel" style="margin-bottom: 0;">
 2
            </div>
        </div>
        <div class="layui-col-md4">

            <div class="fly-panel fly-signin">
                <div class="fly-panel-title">
                    积分
                </div>
                <div class="fly-panel-main fly-signin-main">

                    <span>当前拥有<cite>${user.integral}</cite>积分</span>

                    <!-- 已签到状态 -->
                    <!--
                    <button class="layui-btn layui-btn-disabled">今日已签到</button>
                    <span>获得了<cite>20</cite>飞吻</span>
                    -->
                </div>
            </div>

            <div class="fly-panel fly-link">
                <h3 class="fly-panel-title">友情链接</h3>
                <dl class="fly-panel-main">
                    <%--<dd><a href="http://www.layui.com/" target="_blank">layui</a><dd>
                    <dd><a href="http://layim.layui.com/" target="_blank">WebIM</a><dd>
                    <dd><a href="http://layer.layui.com/" target="_blank">layer</a><dd>
                    <dd><a href="http://www.layui.com/laydate/" target="_blank">layDate</a><dd>--%>
                    <dd><a href="mailto:cuigenyou@163.com?subject=%E7%94%B3%E8%AF%B7AW%E7%A4%BE%E5%8C%BA%E5%8F%8B%E9%93%BE" class="fly-link">申请友链</a><dd>
                </dl>
            </div>

        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>