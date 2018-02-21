var setting = {
	data: {
		simpleData: {
			enable: true
		}
	},
	view: {
		selectedMulti: false
	}
};

var zNodes =[
		{ id:1, pId:0, name:"父节点1 - 展开", open:true},
		{ id:11, pId:1, name:"父节点11 - 折叠"},
		{ id:111, pId:11, name:"叶子节点111"},
		{ id:112, pId:11, name:"叶子节点112"},
		{ id:113, pId:11, name:"叶子节点113"},
		{ id:114, pId:11, name:"叶子节点114"},
		{ id:12, pId:1, name:"父节点12 - 折叠"},
		{ id:121, pId:12, name:"叶子节点121"},
		{ id:122, pId:12, name:"叶子节点122"},
		{ id:123, pId:12, name:"叶子节点123"},
		{ id:124, pId:12, name:"叶子节点124"},
		{ id:13, pId:1, name:"父节点13 - 没有子节点", isParent:true}
	];

$(document).ready(function() {
	$.ajax({
		url:"/oa/zstp/initNodes",
		type:"get",
		dataType:"json",
		success:function(data){
			var json = JSON.parse(data);
			if (json.success) {
				$.fn.zTree.init($("#tree"), setting, JSON.parse(json.zNodes));
				var zTree = $.fn.zTree.getZTreeObj("tree");
				var nodes = zTree.getNodes();
				if (nodes.length > 0) {
					zTree.selectNode(nodes[0]);
				}
			} else {
				layer.alert("文件夹加载失败！", {icon:2});
			}
		},
		error:function(){
			layer.alert("文件夹加载失败！", {icon:2});
		}
	});
});