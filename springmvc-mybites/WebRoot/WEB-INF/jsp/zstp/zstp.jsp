<%@ page language="java" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>知识图谱</title>
		<meta charset="UTF-8" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugin/layui-v2.2.5/css/layui.css" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugin/font-awesome-4.7.0/css/font-awesome.min.css"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/plugin/ztree-v3.5/css/zTreeStyle/zTreeStyle.css"/>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/jquery/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/ztree-v3.5/js/jquery.ztree.core.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/zstp/js/ztree.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/layui-v2.2.5/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/zstp/js/zstp.js"></script>
	</head>

	<body>
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
		    	<div class="layui-logo">layui 后台布局</div>
				<ul class="layui-nav layui-layout-left" lay-filter="nav">
					<li class="layui-nav-item">
						<a href="javascript:void(0)" title="首页" class="nav_first" >首页</a>
					</li>
					<li class="layui-nav-item">
						<a class="nav_1" href="javascript:void(0)" title="心情随笔">心情随笔</a>
					</li>
					<li class="layui-nav-item">
						<a class="nav_2" href="javascript:void(0)" title="韶华追忆">韶华追忆</a>
					</li>
					<li class="layui-nav-item layui-this">
						<a class="nav_3" href="javascript:void(0)"  title="知识图谱">知识图谱</a>
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
		
		<div id="zstp" class="" style="width: 900px; width: 100%; min-height: 570px;">
			<div class="" style="display:flex; justify-content: space-between; align-items:center; width: 100%; height: 50px; ">
				<!--按钮-->
				<div style="margin-left: 20px;">
					<button class="layui-btn layui-btn-sm layui-btn-normal">
						<i class="layui-icon">&#xe603;</i>后退
					</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal">
						<i class="layui-icon">&#xe602;</i>前进
					</button>
				</div>
				<div style="display: table; width: 47%; height: 30px; border: 1px solid #DBDBDB;">
					<span class="layui-breadcrumb" style="padding-left: 15px;display: table-cell;vertical-align: middle;">
						<a href="">首页</a>
						<a href="">国际新闻</a>
						<a href="">亚太地区</a>
						<a><cite>正文</cite></a>
					</span>
				</div>
				
				<div style="width: 20%; height: 30px; border: 1px solid #DBDBDB;">
					<div style="display: table; height: 100%; width: 100%;">
						<input style="height: 30px; width: 100%; border: hidden;" type="text" name="title" required  lay-verify="required" placeholder="当前目录查找" autocomplete="off" class="layui-input" />
						<i class="fa fa-search fa-lg" style="text-align: right;display: table-cell;vertical-align: middle;"></i>
					</div>
				</div>
				<div style="margin-right: 20px;">
					<button class="layui-btn layui-btn-sm layui-btn-normal" onclick="addNode();">
						<i class="layui-icon">&#xe654;</i>文件夹
					</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal" onclick="addNote();">
						<i class="layui-icon">&#xe654;</i>笔记
					</button>
					<button class="layui-btn layui-btn-sm layui-btn-normal">
						<i class="fa fa-cut"></i>&nbsp;移动
					</button>
				</div>
			</div>
			<div class="" style="float: left; width: 20%; height: 510px; margin-top: 10px; margin-left: 20px; border: 1px solid #DBDBDB;">
				<ul id="tree" class="ztree"></ul>
			</div>
			<div class="" style="float: left; width: 76%; height: 510px; margin-left: 10px; border: 0px solid #DBDBDB;">
				<table id="file_table" class="layui-table" lay-skin="nob" lay-data="{ url:'/oa/zstp/loadNote/', where:{'nodeId':'1'},page:true, id:'file_table',text:'无信息'}" lay-filter="file_table">
					<thead>
						<tr>
							<th lay-data="{type:'checkbox', fixed: 'left'}"></th>
							<th lay-data="{field:'name', width:500, sort: true}">名称</th>
							<th lay-data="{field:'updateTime', width:300, sort: true}">修改日期</th>
							<th lay-data="{width:150, align:'center', toolbar: '#barFile'}">操作</th>
						</tr>
					</thead>
				</table>
				<script type="text/html" id="barFile">
					<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
					<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
					<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
				</script>
			</div>
		</div>
		<script type="text/javascript">
			layui.use('element', function() {
				var element = layui.element;
			});
			layui.use('table', function() {
				var table = layui.table;
				//监听表格复选框选择
				table.on('checkbox(file_table)', function(obj) {
					console.log(obj);
				});
				//监听工具条
				table.on('tool(file_table)', function(obj){
					var data = obj.data;
		    		if(obj.event === 'detail'){
		    			layer.msg('ID：'+ data.id + ' 的查看操作');
		    		} else if(obj.event === 'del'){
		    			layer.confirm('真的删除行么', function(index){
		        			obj.del();
		        			layer.close(index);
		    			});
		    		} else if(obj.event === 'edit'){
		    			layer.alert('编辑行：<br>'+ JSON.stringify(data))
		    		}
		  		});
		  	});
		</script>
	</body>

</html>