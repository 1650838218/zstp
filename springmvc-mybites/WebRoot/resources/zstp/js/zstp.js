var nodeIndex,noteIndex;

// 添加文件夹或文件
function addNode() {
	var zTree = $.fn.zTree.getZTreeObj("tree");
	var selectNode = zTree.getSelectedNodes();
	if (selectNode.length != 1) {
		layui.use('layer',function(){
			layui.layer.alert("请选中一个文件夹！",{icon:0,title:"提示信息"});
		});
	} else {
		// 弹出起草页面
		var nodeId = selectNode[0].id;
		layui.use('layer',function(){
			nodeIndex = layui.layer.open({
				type: 2,
				title:"新建文件夹",
				area:['900px','300px'],
				content: '/oa/zstp/addNode?nodeId=' + nodeId
			});
		});
	}
}

// 添加笔记
function addNote() {
	var zTree = $.fn.zTree.getZTreeObj("tree");
	var selectNode = zTree.getSelectedNodes();
	if (selectNode.length != 1) {
		layui.use('layer',function(){
			layui.layer.alert("请选中一个文件夹！",{icon:0,title:"提示信息"});
		});
	} else {
		// 弹出起草页面
		var nodeId = selectNode[0].id;
		layui.use('layer',function(){
			noteIndex = layui.layer.open({
				type: 2,
				title:"新建笔记",
				area:['900px','600px'],
				content: '/oa/zstp/addNote?nodeId=' + nodeId
			});
		});
	}
}

// 保存
function save(formData) {
	$.ajax({
		url:"/oa/zstp/save",
		type:"post",
		dataType:"json",
		data:formData,
		success:function(data){
			var json = JSON.parse(data);
			if (json.success) {
				layui.use('layer',function(){
					if (formData.type == '0') {
						layui.layer.close(nodeIndex); //关闭 
					} else {
						layui.layer.close(noteIndex); //关闭 
					}
				});
				/* layui.use('layer',function(){
					layui.layer.alert("",{icon:0,title:"提示信息"});
				}); */
				// 列表刷新，树刷新
				// refreshList();
				var zTree = $.fn.zTree.getZTreeObj("tree");
				var node = {id:json.node.id,pId:json.node.pId,name:json.node.name}
				zTree.addNodes(zTree.getNodeByParam("id",json.node.pId),-1,node);
			} else {
				layui.use('layer',function(){
					layui.layer.alert(json.error,{icon:2,title:"错误信息"});
				});
			}
		},
		error:function(){
			layui.use('layer',function(){
				layui.layer.alert("文件夹创建失败！",{icon:2,title:"错误信息"});
			});
		}
	});
}


/*列表刷新
nodeId:文件夹id
page:查询第几页的数据
limit：每页有多少条数据*/
function refreshList(nodeId,page,limit) {
	table.reload('file_table', {
		url:'/oa/zstp/loadNote/',
		where:{nodeId:},
		page:true,
		text:'无信息',
	});
}
