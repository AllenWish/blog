<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="${request.contextPath}/">
            <img src="${request.contextPath}/static/layui/images/avatar/11.jpg" width="45" alt="home">
        </a>
        <%--<ul class="layui-nav fly-nav layui-hide-xs">
            <li class="layui-nav-item layui-this">
                <a href="/"><i class="iconfont icon-jiaoliu"></i>交流</a>
            </li>
            <li class="layui-nav-item">
                <a href="case/case.html"><i class="iconfont icon-iconmingxinganli"></i>案例</a>
            </li>
            <li class="layui-nav-item">
                <a href="http://www.layui.com/" target="_blank"><i class="iconfont icon-ui"></i>框架</a>
            </li>
        </ul>--%>

        <ul class="layui-nav fly-nav-user">
            <c:if test="${empty LOGINUSER}">
                <!-- 未登入的状态 -->
                <li class="layui-nav-item">
                    <a class="iconfont icon-touxiang layui-hide-xs" href="login"></a>
                </li>
                <li class="layui-nav-item">
                    <a href="/login">登入</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/reg/">注册</a>
                </li>
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
                        <img src="${request.contextPath}/static/images/${LOGINUSER.headImg}">
                    </a>
                    <dl class="layui-nav-child">
                            <%--<dd><a href="user/set"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
                            <dd><a href="user/message"><i class="iconfont icon-tongzhi" style="top: 4px;"></i>我的消息</a></dd>--%>
                        <dd><a href="user/${LOGINUSER.nickName}"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
                        <hr style="margin: 5px 0;">
                        <dd><a href="/login/logout/" style="text-align: center;">退出</a></dd>
                    </dl>
                </li>
            </c:if>
        </ul>
    </div>
</div>
