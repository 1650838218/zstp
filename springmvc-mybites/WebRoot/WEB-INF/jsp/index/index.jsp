<%@ page language="java" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>花非花的个人博客</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugin/layui-v2.2.5/css/layui.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugin/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/layui-v2.2.5/layui.js" charset="utf-8"></script>
</head>
 
<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
	    	<div class="layui-logo">layui 后台布局</div>
			<ul class="layui-nav layui-layout-left" lay-filter="nav">
				<li class="layui-nav-item layui-this">
					<a href="javascript:void(0)" title="首页" class="nav_first" >首页</a>
				</li>
				<li class="layui-nav-item">
					<a class="nav_1" href="javascript:void(0)" title="心情随笔">心情随笔</a>
				</li>
				<li class="layui-nav-item">
					<a class="nav_2" href="javascript:void(0)" title="韶华追忆">韶华追忆</a>
				</li>
				<li class="layui-nav-item">
					<a class="nav_3" href="/oa/zstp/zstpView" title="知识图谱">知识图谱</a>
				</li>
				<li class="layui-nav-item">
					<a class="nav_4" href="javascript:void(0)" title="对我说">对我说</a>
				</li>
				<li class="layui-nav-item">
					<a class="nav_5" href="javascript:void(0)" title="关于我">关于我</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="content" class="" style="width: 100%; padding: 0px;">
		
	</div>
	<script type="text/javascript">
		layui.use('element', function() {
			var element = layui.element;
			/*element.on('nav(nav)', function(elem){
				console.log(elem[0].firstElementChild.getAttribute("hreflink")); //得到当前点击的DOM对象
				var href = elem[0].firstElementChild.getAttribute("hreflink");
				$("#content").load(href);
			});*/
		});
	</script>
</body>
</html>
