function addNote() {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNode = zTree.getSelectedNodes();
	if (selectNode.size <= 0) {
		layer.alert("请先选中某一个文件夹！",{icon:3,title:"提示信息"});
	} else if (selectNode.size > 1) {
		layer.alert("只能选中一个文件夹！",{icon:3,title:"提示信息"});
	} else {
		// 弹出起草页面
		var nodeId = selectNode[0].id;
		var index = layer.open({
			type: 2,
			title:"新建笔记",
			area:['900px','600px'],
			content: '/oa/zstp/addNote?nodeId=' + nodeId
		});
//		layer.full(index);
	}
}