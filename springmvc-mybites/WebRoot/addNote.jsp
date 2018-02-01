<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<title>新建笔记</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/plugin/layui-v2.2.5/css/layui.css" media="all">
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/layui-v2.2.5/layui.js" charset="utf-8"></script>
</head>
<body>
	<form class="layui-form" action="">
		<div class="layui-form-item">
		    <div class="layui-input-block">
				<input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
		    </div>
		</div>
		<div class="layui-form-item layui-form-text">
		    <div class="layui-input-block">
				<textarea id="content" name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
		    </div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="save">保存</button>
			</div>
		</div>
	</form>

	<script>
		layui.use('form', function() {
			var form = layui.form;

			//监听提交
			form.on('submit(save)', function(data) {
				layer.msg(JSON.stringify(data.field));
				return false;
			});
		});
	</script>

</body>
</html>