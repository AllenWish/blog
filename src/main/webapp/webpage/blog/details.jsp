<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${blog.title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="博客,论坛,AW">
    <link rel="stylesheet" href="${request.contextPath}/static/layui/layui/css/layui.css">
    <link rel="stylesheet" href="${request.contextPath}/static/layui/css/global.css">
</head>
<body>
<jsp:include page="../top.jsp"/>

<div class="layui-hide-xs">
    <div class="fly-panel fly-column">
        <div class="layui-container">
            <ul class="layui-clear">
                <%--<li class="layui-hide-xs layui-this"><a href="/">首页</a></li>
                <li><a href="">提问</a></li>
                <li><a href="">分享<span class="layui-badge-dot"></span></a></li>
                <li><a href="">讨论</a></li>
                <li><a href="">建议</a></li>
                <li><a href="">公告</a></li>
                <li><a href="">动态</a></li>
                <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>
                --%>
                <c:if test="${!empty LOGINUSER}">
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="">我的博文</a></li>
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="">我的收藏</a></li>
                </c:if>
            </ul>

            <div class="fly-column-right layui-hide-xs">
                <%--<span class="fly-search"><i class="layui-icon"></i></span>先隐藏搜索 --%>
                <c:if test="${!empty LOGINUSER}">
                    <a href="" class="layui-btn">发表新帖</a>
                </c:if>
            </div>
        </div>
    </div>
</div>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8 content detail">
            <div class="fly-panel detail-box">
                <h1>${blog.title}</h1>
                <div class="fly-detail-info">
                    <%--<span class="layui-badge layui-bg-red">精帖</span>--%>
                    <div class="fly-admin-box" data-id="123">
                        <%--<span class="layui-btn layui-btn-xs jie-admin" type="del">删除</span>--%>

                        <span class="layui-btn layui-btn-xs jie-admin" type="set" field="stick" rank="1">${blog.keyword}</span>
                    </div>
                    <span class="fly-list-nums">
                        <a href="#comment"><i class="iconfont" title="评论">&#xe60c;</i> ${blog.replyhit}</a>
                        <i class="iconfont" title="阅读">&#xe60b;</i> ${blog.clickhit}
                    </span>
                </div>
                <div class="detail-about">
                    <a class="fly-avatar" >
                        <img src="${request.contextPath}/static/images/${blogger.imagename}" alt="${blogger.nickname}">
                    </a>
                    <div class="fly-detail-user">
                        <a class="fly-link">
                            <cite>${blogger.nickname}</cite>
                            <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：博主"></i>
                            <i class="layui-badge fly-badge-vip">${user.integral}</i>
                        </a>
                        <span>
                            <fmt:formatDate value="${blog.releasedate}" pattern="yyyy年MM月dd日 HH点mm分ss秒"/>
                        </span>
                    </div>
                </div>
                <div class="detail-body photos">
                    ${blog.content}
                </div>
            </div>

            <div class="fly-panel detail-box" id="flyReply">
                <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                    <legend>评论</legend>
                </fieldset>

                <ul class="jieda flow-default" id="jieda">

                </ul>

            </div>
        </div>
        <div class="layui-col-md4">
            <c:if test="${!empty LOGINUSER}">
                <div class="fly-panel fly-signin">
                    <div class="fly-panel-title">
                        积分
                    </div>
                    <div class="fly-panel-main fly-signin-main">
                        <span>当前拥有<cite>${LOGINUSER.integral}</cite>积分</span>
                    </div>
                </div>
            </c:if>
            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">热议博文</dt>
                <c:forEach var="blog" items="${hotBlog}">
                    <dd>
                        <a href="blog/detail/${blog.id}">${blog.title}</a>
                        <span><i class="iconfont icon-pinglun1"></i> ${blog.replyHit}</span>
                    </dd>
                </c:forEach>
                <!-- 无数据时 -->
                <c:if test="${empty hotBlog}">
                    <div class="fly-none">没有相关数据</div>
                </c:if>

            </dl>
            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">博主热议</dt>
                <c:forEach var="blog" items="${bloggerHotBlogs}">
                    <dd>
                        <a href="blog/detail/${blog.id}">${blog.title}</a>
                        <span><i class="iconfont icon-pinglun1"></i> ${blog.replyHit}</span>
                    </dd>
                </c:forEach>
                <!-- 无数据时 -->
                <c:if test="${empty bloggerHotBlogs}">
                    <div class="fly-none">没有相关数据</div>
                </c:if>

            </dl>

            <div class="fly-panel fly-link">
                <h3 class="fly-panel-title">友情链接</h3>
                <dl class="fly-panel-main">
                    <c:forEach var="link" items="${links}" varStatus="status">
                        <dd><a href="${link.linkurl}" target="_blank">${link.linkname}</a><dd>
                    </c:forEach>
                    <dd><a href="mailto:cuigenyou@163.com?subject=%E7%94%B3%E8%AF%B7AW%E5%8D%9A%E5%AE%A2%E5%8F%8B%E6%83%85%E9%93%BE%E6%8E%A5" class="fly-link">申请友链</a><dd>
                </dl>
            </div>
            <div class="fly-panel">
                <h3 class="fly-panel-title">天气预报</h3>
                <iframe id="fancybox-frame" name="fancybox-frame1513142934680" frameborder="0" scrolling="no" hspace="0"  src="http://i.tianqi.com/index.php?c=code&a=getcode&id=7&h=90&w=225"></iframe>
            </div>
            <div class="layui-form layui-form-pane fly-panel">
                <c:if test="${!empty LOGINUSER}">
                <form method="post">
                    <div class="layui-form-item layui-form-text">
                        <a name="comment"></a>
                        <div class="layui-input-block">
                            <textarea id="content" name="content" placeholder="请输入内容"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <input type="hidden" name="blogid" value=${blog.id}>
                        <button class="layui-btn" lay-filter="subcomment" lay-submit>立即怼博主</button>
                    </div>
                </form>
                </c:if>
                <c:if test="${empty LOGINUSER}">
                    <h3 class="fly-panel-title">登陆之后就可以怼博主啦</h3>
                </c:if>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<SCRIPT type="text/javascript">
    layui.use(['util','flow','laydate','layedit','form'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,$ = layui.$
            ,flow = layui.flow
            ,util = layui.util
        ;
        //自定义工具栏
        /*var index = layedit.build('content', {
            tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right']
            ,height: 100
        })*/
        var url = '/comment/all?blogid='+${blog.id};

        flow.load({
            elem: '#jieda' //流加载容器
            ,isAuto: false
            ,isLazyimg: true
            ,done: function(page, next){ //加载下一页

                var lis = [];
                $.get(url+'&page='+page, function(res){
                    res = res.data;
                    layui.each(res.data, function(index, item){
                        lis.push(
                            '<li data-id="'+index+'" class="jieda-daan">'
                            +'<div class="detail-about detail-about-reply">'
                            +'<a class="fly-avatar" href="">'
                            +'<img src="${request.contextPath}/static/images/allen_avatar.jpg" alt="">'
                            +'</a>'
                            +'<div class="fly-detail-user">'
                            +'<cite>'+item.userip+'</cite>:'
                            +'</div><div class="detail-body jieda-body photos"> '
                            +item.content
                            +'</div><div class="detail-hits"><span>'
                            +   util.toDateString(item.commentdate, 'yyyy-MM-dd HH:mm:ss')
                            +'</span></div></div>'
                            +'</li>'
                        );

                    });
                    next(lis.join(''), page < res.pages); //假设总页数为 6
                },'json');

            }
        });
        function HTMLEncode(text) {
            return text.replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/'/g, "&apos;");
        }
    });


</SCRIPT>
</body>
</html>
