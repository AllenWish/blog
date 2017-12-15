<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="博客,论坛,AW">
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

<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <!--<div class="fly-none">没有权限</div>-->
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">发表新帖<!-- 编辑帖子 --></li>
                </ul>
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <form action="" method="post">
                            <div class="layui-row layui-col-space15 layui-form-item">
                                <div class="layui-col-md3">
                                    <label class="layui-form-label">博文类型</label>
                                    <div class="layui-input-block">
                                        <select name="typeid" lay-filter="column" lay-search>
                                            <option value=5></option>
                                            <c:forEach varStatus="status" var="blogtype" items="${blogtypes}">
                                                <option value=${blogtype.id}>${blogtype.typename}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-col-md9">
                                    <label for="title" class="layui-form-label">标题</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="title" name="title" lay-verify="required" autocomplete="off" class="layui-input">
                                        <!-- <input type="hidden" name="id" value="{{d.edit.id}}"> -->
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block">
                                    <textarea id="content" name="content" lay-verify="required" placeholder="详细描述" class="layui-textarea fly-editor" style="height: 260px;"></textarea>
                                </div>

                            </div>
                            <div class="layui-col-md3">
                                <label for="keyword" class="layui-form-label">关键字</label>
                                <div class="layui-input-block">
                                    <input type="text" id="keyword" name="keyword" lay-verify="required" autocomplete="off" class="layui-input">
                                    <input type="hidden" id="summary" name="summary">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn" lay-filter="publishBlog" lay-submit>立即发布</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
<SCRIPT type="text/javascript">
    layui.use(['util','flow','laydate','layedit','form','fly'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,$ = layui.$
            ,flow = layui.flow
            ,util = layui.util
        ;
        var fly = layui.fly;
        form.on('submit(publishBlog)', function(data){

            var content = data.field.content;

            var contentText = /^\{html\}/.test(content)
                ? content.replace(/^\{html\}/, '')
                : fly.content(content);
            if(content.trim().length==0){
                layer.msg("老板，写点东西上去哇")
                return false;
            }
            data.field.content = '<p>'+contentText+'</p>';
            if(content.length>100){
                data.field.summary = fly.content(content.substring(0,100)+"……")
            }else{
                data.field.summary = fly.content(content)
            }

            $.post(
                "",
                data.field,
                function(data){
                    data = data.data
                    if(data.flag){
                        location.href=data.reurl
                    }else{
                        if(data.msg=='unlogin'){
                            //弹出一个登陆页面
                            layer.open({
                                type:2,
                                title:'登页',
                                shade: 0.8,
                                area: ['380px', '90%'],
                                offset: 'rb', //右下角弹出
                                anim: 2,
                                content:'/login/childlogin'
                            });
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                },
                'json'
            );
            return false;
        });
    });
</SCRIPT>
</body>
</html>
