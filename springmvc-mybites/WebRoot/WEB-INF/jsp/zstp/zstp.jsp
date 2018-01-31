<%@ page language="java" pageEncoding="UTF-8"%>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/zstp/css/zstp.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/zstp/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/zstp/css/ztree.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/plugin/ztree-v3.5/css/zTreeStyle/zTreeStyle.css"/>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/plugin/layui-v2.2.5/css/layui.css" media="all">
 	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/ztree-v3.5/js/jquery.ztree.core.js"></script>
 	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/ztree-v3.5/js/jquery.ztree.excheck.js"></script>
 	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/ztree-v3.5/js/jquery.ztree.exedit.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/zstp/js/ztree.js"></script> 
 	<div id="rngFrameXe" style="background-color:#ededed; padding:6px 10px 6px 10px; min-width:1000px; width:expression((document.body.clientWidth < 1000) ? '1000px':'100%')">
		<div id="divDocument" style="height: 500px;">
			<div id="divLeft" style="">
				<div id="divFolderFrame" style="height: 502px; display: block;">
					<div id="leftTopMenu">
						<div class="searchArea">
							<input type="text" name="searchArea" placeholder=" 输入搜索关键字">
							<i class="fa fa-search"></i>
						</div>
						<div style="float:right; width:60px; height:30px; padding-top:5px;">
							<div onclick="hideFolder();" style="float:left;">
								<span id="gicon" class="icon" style="background-position: -210px -239px;  cursor: pointer;" title="隐藏文件夹"></span>隐藏
							</div>
						</div>
					</div>
					
					<div id="divExplore" style="position: absolute; overflow: auto; margin-left: 4px; margin-top: 4px; color: rgb(0, 0, 0); height: 472px; top: 25px; width: 316px;">
						<ul id="treeDemo" class="ztree"></ul>
					</div>
				</div>
				<div id="divFF2" style="display: none;">
					<img src="<%=request.getContextPath() %>/resources/zstp/img/rightattr.png" onclick="showFolder();" style="cursor:pointer; margin-bottom:6px">
					<br><font style="font-size:14px;"><span title="点击显示文件夹">显示文件夹</span></font>
				</div>
			</div>
			<div id="divCenter" style="display: block;"></div>
			<div id="divRight" style="width: 992px;">
				<div class="divFileBt">
					<div id="filetopmenu" style="height:26px; overflow: hidden;">
						<div class="spFileBt" style="padding-left:6px; padding-top:2px;"><span id="gicon" style="width: 12px; height: 24px; background-position: -420px -238px;"></span></div>
						<div class="spFileBt2" onclick="" title="添加"><span id="gicon" class="icon" style="background-position: -0px -120px; cursor: pointer;"></span>添加</div>
						<div class="spFileBt2" id="divViewStyleExt" onclick="" title="移动"><span id="gicon" class="icon" style="background-position : -120px -90px;"></span>移动</div>
						<div class="spFileBt3" id="divViewStyleExt" onclick="" title="搜索"><span id="gicon" class="icon" style="background-position :-0px -60px;"></span>搜索</div>
					</div>
				</div>
				<div id="divRightContent" style="height: 472px;">
					<table class="layui-table" lay-data="{width: 892, height:332, url:'/oa/zstp/loadFile', where:{nodeId:'01'}, page:true, id:'idTest'}" lay-filter="fileTd">
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
				</div>
			</div>
		</div>
	</div> 
	
	<script type="text/javascript">
		$(function(){
			$(".searchArea input").bind("focus", focusKey)
			.bind("blur", blurKey)
			.bind("propertychange", searchNode)
			.bind("input", searchNode);
			$(".searchArea i").bind("click",searchNode);
		});
		
		// layui 表格
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
