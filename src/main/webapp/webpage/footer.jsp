
<div class="fly-footer">
    <p>2017 &copy; AWBlog</p>
    <%--<p><a href="http://fly.layui.com/" target="_blank">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/" target="_blank">layui.com 出品</a></p>--%>
    <%--<p>
        <a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a>
        <a href="http://www.layui.com/template/fly/" target="_blank">获取Fly社区模版</a>
        <a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
    </p>--%>
</div>

<script src="${request.contextPath}/static/layui/layui/layui.js" ></script>
<script src="${request.contextPath}/static/js/jquery-3.2.1.min.js" ></script>

<script>
    layui.cache.page = '';
    layui.cache.user = {
        username: '${LOGINUSER.nickName}'
        ,uid: ${LOGINUSER.id}
        ,avatar: '${request.contextPath}/static/images/${LOGINUSER.headImg}'
        ,sex: '${LOGINUSER.sex}'
    };
    layui.config({
        version: "3.0.0"
        ,base: '${request.contextPath}/static/layui/mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
</script>
