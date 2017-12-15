<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>AW博客论坛-用户注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="博客,论坛,AW">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="${request.contextPath}/static/layui/layui/css/layui.css">
    <link rel="stylesheet" href="${request.contextPath}/static/layui/css/global.css">
    <script src="${request.contextPath}/static/js/jquery-3.2.1.min.js" ></script>
</head>
<body>

<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="#">
            <img src="${request.contextPath}/static/layui/images/avatar/11.jpg" width="45" alt="home">
        </a>
        <%--<ul class="layui-nav fly-nav layui-hide-xs">
            <li class="layui-nav-item layui-this">
                <a href="/"><i class="iconfont icon-jiaoliu"></i>交流</a>
            </li>
            <li class="layui-nav-item">
                <a href="../case/case.html"><i class="iconfont icon-iconmingxinganli"></i>案例</a>
            </li>
            <li class="layui-nav-item">
                <a href="http://www.layui.com/" target="_blank"><i class="iconfont icon-ui"></i>框架</a>
            </li>
        </ul>--%>

        <ul class="layui-nav fly-nav-user">
            <!-- 未登入的状态 -->
            <li class="layui-nav-item">
                <a class="iconfont icon-touxiang layui-hide-xs" href="user/login.html"></a>
            </li>
            <li class="layui-nav-item">
                <a href="/login">登入</a>
            </li>
            <%--<li class="layui-nav-item">
                <a href="user/reg.html">注册</a>
            </li>
            <li class="layui-nav-item layui-hide-xs">
                <a href="/app/qq/" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" title="QQ登入" class="iconfont icon-qq"></a>
            </li>
            <li class="layui-nav-item layui-hide-xs">
                <a href="/app/weibo/" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" title="微博登入" class="iconfont icon-weibo"></a>
            </li>--%>
        </ul>
    </div>
</div>

<div class="layui-container fly-marginTop">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
                <li><a href="/login">登入</a></li>
                <li class="layui-this">注册</li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <form method="post" action="/reg/register">
                            <div class="layui-form-item">
                                <label for="nickName" class="layui-form-label">昵称</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="nickName" name="nickName"  lay-verify="nickName" onblur="checkName()"
                                           autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid layui-word-aux layui-hide" id="usernameTips">
                                    <i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe605;</i>
                                    将会成为您唯一的登入名
                                </div>
                                <div class="layui-form-mid layui-word-aux layui-hide" id="errorusername">
                                    <i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#x1006;</i>
                                    已存在，请重新填写
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="password" class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="password" name="password"  lay-verify="password" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                            </div>
                            <div class="layui-form-item">
                                <label for="repass" class="layui-form-label">确认密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="repass" name="repass"  lay-verify="password" autocomplete="off"
                                           onblur="checkPass()" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="username" class="layui-form-label">姓名</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="username" name="username"  lay-verify="username" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-inline">
                                    <input type="radio" name="sex" value="1" title="男" checked>
                                    <input type="radio" name="sex" value="0" title="女" >
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="email" class="layui-form-label">邮箱</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="email" name="email"  lay-verify="email" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="phone" class="layui-form-label">手机号</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="phone" name="phone"  lay-verify="phone" autocomplete="off" class="layui-input" onblur="getCheckCode()">
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
                                <button class="layui-btn" lay-filter="regform" lay-submit >立即注册</button>
                            </div>
                            <%--<div class="layui-form-item fly-form-app">
                                <span>或者直接使用社交账号快捷注册</span>
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

        //自定义验证规则
        form.verify({
            nickName:[/^\S{2,6}$/,'昵称请填写2-6位']
            ,password:[/^[a-zA-Z0-9]{6,16}$/,'密码6-16位']
            ,username:[/^\S{2,7}$/,'名称请填写2-7位']
            ,phone: [/^1[3|4|5|7|8|9]\d{9}$/, '手机必须11位，只能是数字！']
            ,email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']
        });
        //regform
        form.on('submit(regform)', function(data){
            //layer.msg(JSON.stringify(data.field));
            var password = $('#password').val();
            var repass = $('#repass').val();
            if(repass!=password){
                layer.msg("密码不一致！！");
                return false;
            }
            $.ajax({
                url:"/reg/register",
                data:data.field,
                dataType:'json',
                success:function(data){
                    data = data.data;
                    if(data.flag){
                        window.location.href ='${request.contextPath}/login?nickName='+$("#nickName").val()
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
    function getCheckCode(){
        var phone = $('#phone').val();
        if(phone==null||phone.length!=11){
            layui.layer.msg("请填写手机号");
            return;
        }
       $.post("/reg/getCheckCode",{phone:phone},function(data){
           data = data.data;
            if(data.flag){
                $('#checkCode').val(data.checkCode);
                $('#checktips').addClass('layui-hide');
            }else{
                $('#checktips').addClass('layui-hide');
                layui.layer.msg(data.msg);
            }
        },"json");

        $('#checktips').removeClass('layui-hide');
    }

    function checkName(){
        var nickName = $('#nickName').val();
        $.post("/reg/checkName",{nickName:nickName},function(data){
            data = data.data;
            if(data.flag){
                $('#usernameTips').removeClass('layui-hide');
                $('#errorusername').addClass('layui-hide');
            }else{
                $('#usernameTips').addClass('layui-hide');
                $('#errorusername').removeClass('layui-hide');
                $('#nickName').val("");
                layui.layer.msg(nickName+"用户名已存在，请重新填写");
            }
        },"json");
    }
    function checkPass(){
        var password = $('#password').val();
        var repass = $('#repass').val();
        if(repass!=password){
            layui.layer.msg("密码不一致！！");
            return false;
        }
    }
</script>
</body>
</html>
