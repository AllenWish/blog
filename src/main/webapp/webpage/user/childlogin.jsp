<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>AW博客论坛-用户登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="博客,论坛,AW">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="${request.contextPath}/static/layui/layui/css/layui.css">
    <link rel="stylesheet" href="${request.contextPath}/static/layui/css/global.css">
    <script src="${request.contextPath}/static/js/jquery-3.2.1.min.js" ></script>
</head>
<body>

<div class="layui-container fly-marginTop">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
                <li class="layui-this">登入</li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <form method="post">
                            <div class="layui-form-item">
                                <label for="nickName" class="layui-form-label">昵称</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="nickName" name="nickName" lay-verify="required" autocomplete="off" class="layui-input" value="${user.nickName}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="password" class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="password" name="password" lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="checkCode" class="layui-form-label">验证码</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="checkCode" name="checkCode"  lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid layui-hide" id="checktips">
                                    正在获取验证码……<i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop" style="font-size: 30px; color: #1E9FFF;">&#xe63d;</i>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn" lay-filter="onlogin" lay-submit>立即登录</button>
                                <span style="padding-left:20px;">
                                  <a href="#">忘记密码？</a>
                                </span>
                            </div>
                            <%--<div class="layui-form-item fly-form-app">
                                <span>或者使用社交账号登入</span>
                                <a href="" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a>
                                <a href="" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a>
                            </div>--%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,$ = layui.$;

        form.on('submit(onlogin)', function(data){

            $.ajax({
                url:"/login/login",
                data:data.field,
                dataType:'json',
                success:function(data){
                    data = data.data
                    if(data.flag){
                        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                        parent.location.reload();
                        parent.layer.close(index);
                    }else{
                        layer.msg(data.msg);
                    }
                },
                error:function(e){
                    layer.msg(e)
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
