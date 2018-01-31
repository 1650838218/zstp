<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/plugin/layui-v2.2.5/css/layui.css" media="all">
</head>
<body>
	<table class="layui-table" lay-data="{width: 892, height:332, url:'/oa/zstp/loadFile', page:true, id:'idTest'}" lay-filter="fileTd">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox', fixed: 'left'}"></th>
				<th lay-data="{field:'fileName', width:550}">文件名</th>
				<th lay-data="{field:'creTime', width:150}">创建时间</th>
				<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#bar'}"></th>
			</tr>
		</thead>
	</table>

	<script type="text/html" id="bar">
		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>

	<script>
		layui.use('table', function() {
			var table = layui.table;
			//监听表格复选框选择
			table.on('checkbox(fileTd)', function(obj) {
				console.log(obj)
			});
			//监听工具条
			table.on('tool(fileTd)', function(obj) {
				var data = obj.data;
				if (obj.event === 'detail') {
					layer.msg('ID：' + data.id + ' 的查看操作');
				} else if (obj.event === 'del') {
					layer.confirm('真的删除行么', function(index) {
						obj.del();
						layer.close(index);
					});
				} else if (obj.event === 'edit') {
					layer.alert('编辑行：<br>' + JSON.stringify(data))
				}
			});
		});
	</script>

</body>
</html>