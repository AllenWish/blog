<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>AW博客论坛</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="博客,论坛,AW">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="${request.contextPath}/static/layui/layui/css/layui.css">
    <link rel="stylesheet" href="${request.contextPath}/static/layui/css/global.css">
</head>
<body>
<jsp:include page="top.jsp"/>
<c:if test="${!empty LOGINUSER}">
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
    <c:if test="${!empty LOGINUSER.bloggerId}">
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="">我的博文</a></li>
    </c:if>
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="">我的收藏</a></li>

        </ul>


    <c:if test="${!empty LOGINUSER.bloggerId}">
        <div class="fly-column-right layui-hide-xs">
            <%--<span class="fly-search"><i class="layui-icon"></i></span>先隐藏搜索 --%>
            <a href="/blog/add" class="layui-btn">发表新帖</a>
        </div>
    </c:if>
    </div>
</div>
</c:if>
<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8" >
            <div class="fly-panel" style="margin-bottom: 0;">
                <div class="fly-panel-title fly-filter  layui-hide">
                    <a href="" class="layui-this">综合</a>
                    <span class="fly-mid"></span>
                    <%--<a href="">未结</a>
                    <span class="fly-mid"></span>
                    <a href="">已结</a>
                    <span class="fly-mid"></span
                    <a href="">精华</a>>--%>
                    <span class="fly-filter-right layui-hide-xs">
                    <a href="" class="layui-this">按最新</a>
                    <span class="fly-mid"></span>
                    <a href="">按热议</a>
                  </span>
                </div>

                <ul class="fly-list flow-default" id="layflow">
                    <%--<li>
                        <a href="user/home.html" class="fly-avatar">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="贤心">
                        </a>
                        <h2>
                            <a class="layui-badge">分享</a>
                            <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                        </h2>
                        <div class="fly-list-info">
                            <a href="user/home.html" link>
                                <cite>贤心</cite>
                                <!--
                                <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
                                <i class="layui-badge fly-badge-vip">VIP3</i>
                                -->
                            </a>
                            <span>刚刚</span>

                            <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
                            <!--<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>-->
                            <span class="fly-list-nums">
                            <i class="iconfont icon-pinglun1" title="回答"></i> 66
                          </span>
                        </div>
                        <div class="fly-list-badge">
                            <!--<span class="layui-badge layui-bg-red">精帖</span>-->
                        </div>
                    </li>--%>

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
            <%--<div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
                <h3 class="fly-panel-title">回贴周榜</h3>
                <dl>
                    <!--<i class="layui-icon fly-loading">&#xe63d;</i>-->
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                </dl>
            </div>--%>

            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">热议博文</dt>
                <%--<dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>--%>
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

            <div class="fly-panel fly-link">
                <h3 class="fly-panel-title">友情链接</h3>

                <dl class="fly-panel-main">
                    <%--<dd><a href="http://www.layui.com/" target="_blank">layui</a><dd>--%>
                    <c:forEach var="link" items="${links}" varStatus="status">
                        <dd><a href="${link.linkurl}" target="_blank">${link.linkname}</a><dd>
                    </c:forEach>
                    <dd><a href="mailto:cuigenyou@163.com?subject=%E7%94%B3%E8%AF%B7AW%E7%A4%BE%E5%8C%BA%E5%8F%8B%E9%93%BE" class="fly-link">申请友链</a><dd>
                </dl>
            </div>

        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<SCRIPT type="text/javascript">
    //layflow
    layui.use(['util','flow','laydate'], function(){
        var $ = layui.jquery;
        var flow = layui.flow;
        var util = layui.util;
        var laydate = layui.laydate;

        flow.load({
            elem:'#layflow'
            ,done: function (page,next) {
                var lis = [];
                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                $.get('/blog/all?page='+page, function(res){
                    //res = eval("("+res+")")
                    layui.each(res.data.data, function(index, item){
                        lis.push(
                            '<li><a class="fly-avatar">'
                            +'<img src="${request.contextPath}/static/images/'+item.imageName+'" alt="头像"></a>'
                            +'<h2> <a class="layui-badge">'+item.typeName+'</a> <a href="blog/detail/'+item.id+'">'+item.title+'</a> </h2>'
                            +'<div class="fly-list-info">'
                            +'<a link><cite>'+item.nickName+'</cite></a>'
                            +'<span>'
                            + util.toDateString(item.releaseDate, 'yyyy-MM-dd HH:mm:ss')
                            +'</span><span class="fly-list-nums"><i class="iconfont" title="评论">&#xe60c;</i>'
                            +item.replyHit
                            +'<i class="iconfont" title="阅读">&#xe60b;</i> '
                            +item.clickHit
                            +'</span></div><div class="fly-list-badge">'
                            +'</div></li>'
                        );

                    });

                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < res.data.pages);
                }, "json");
            }
        });
    });
</SCRIPT>
</body>
</html>
