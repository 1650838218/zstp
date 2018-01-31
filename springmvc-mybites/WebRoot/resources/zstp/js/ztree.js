var setting = {
	view : {
		fontCss: getFontCss,
		addHoverDom : addHoverDom,
		removeHoverDom : removeHoverDom,
		selectedMulti : false
	},
	edit : {
		enable : true,
		editNameSelectAll : true,
		showRemoveBtn : showRemoveBtn,
		showRenameBtn : showRenameBtn
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		onClick : onClick,
		beforeDrag : beforeDrag,
		beforeDrop : beforeDrop,
		beforeRemove : beforeRemove,
		beforeRename : beforeRename,
		onRemove : null,
		onRename : onRename
	}
};

// 单击事件,查询该文件夹下的文件
function onClick(event, treeId, treeNode, clickFlag) {
//	var href = "oa/zstp/loadFile"
//	var tb = $("#divRightContent .layui-table");
//	tb.lay-data.where = {nodeId:treeNode.id};
//	tb.load(href,"nodeId=" + treeNode.id,function(responseText, textStatus, jqXHR){
//		// responseText 是响应(返回)的原始文本数据
//	    // textStatus 可能是 "success"、 "notmodified"、 "error"、 "timeout"、 "abort"或"parsererror"中的一个
//	    // jqXHR 是经过jQuery封装的XMLHttpRequest对象(保留其本身的所有属性和方法)
//	    if(textStatus == "success" || textStatus == "notmodified"){
//	        alert("加载成功!");
//	    }
//	});
}

// 查询文件夹时高亮显示查询结果
function getFontCss(treeId, treeNode) {
	return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
}

//拖拽前的回调函数
function beforeDrag(treeId, treeNodes) {
	if (treeNodes[0].drag == false) {// 不允许拖拽
		return false;
	} else {
		return true;
	}
}

// 拖拽完成前的回调
function beforeDrop(treeId, treeNodes, targetNode, moveType, isCopy) {
	if (targetNode.id == "01" && moveType == "prev") {
		return false;
	} else {
		return true;
	}
}

//用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
function beforeRemove(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
//	zTree.selectNode(treeNode);
	if(confirm("确认删除文件夹“" + treeNode.name + "”及其子文件夹吗？")) {
		$.ajax({
			url:"/oa/zstp/deleteNode",
			type:"post",
			data:{nodeId:treeNode.id},
			dataType:"json",
			async:false,
			success:function(data){
				var json =  JSON.parse(data);
				if (!json.success) {
					layer.alert("删除失败！",{title:"错误提示",icon:2});
					return false;
				} else {
					return true;
				}
			},
			error:function(){
				layer.alert("删除失败！",{title:"错误提示",icon:2});
				return false;
			}
		});
	} else {
		return false;
	}
}

//用于捕获节点编辑名称结束（Input 失去焦点 或 按下 Enter 键）之后，更新节点名称数据之前的事件回调函数，并且根据返回值确定是否允许更改名称的操作
function beforeRename(treeId, treeNode, newName, isCancel) {
	if (newName.length == 0) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.cancelEditName();
		layer.alert("节点名称不能为空.", {icon:2});
		return false;
	}
	return true;
}

//文件夹名称编辑后的回调
function onRename(event, treeId, treeNode, isCancel) {
	//将新节点添加到数据库中  
    $.ajax({
    	url:"/oa/zstp/saveNode",
    	data:{id:treeNode.id,pId:treeNode.pId,name:treeNode.name},
    	dataType:"json",
    	type:"post",
    	success:function(data) {
    		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        	var json = JSON.parse(data);
            if (!json.success) {
            	layer.alert(json.error, {icon: 2}, function(index){
    				if (json.flag == "add") {
    					// 删除新增加的文件夹
    					zTree.removeNode(treeNode);
    				} else if (json.flag == "update"){
    					// 编辑
    					zTree.editName(treeNode);
    				}
    				layer.close(index);
            	});
            }
    	},
    	error:function() {
    		layer.alert("失败！", {icon:2});
    	}
    });
}

// 是否显示删除按钮
function showRemoveBtn(treeId, treeNode) {
	return !treeNode.level == 0;
}

// 是否显示修改按钮
function showRenameBtn(treeId, treeNode) {
	return !treeNode.level == 0;
}

// 显示 添加 按钮
function addHoverDom(treeId, treeNode) {
	var sObj = $("#" + treeNode.tId + "_span");
	if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0)
		return;
	var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
			+ "' title='add node' onfocus='this.blur();'></span>";
	sObj.after(addStr);
	var btn = $("#addBtn_" + treeNode.tId);
	if (btn)
		btn.bind("click", function() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			var id = "";
            if (treeNode.isParent) {
            	id = treeNode.children.length + 1;
            	if (id <= 9) {
            		id = '0' + id;
            	}
            } else {
            	id = '01';
            }
            var newNode = zTree.addNodes(treeNode, {id:treeNode.id + id, pId:treeNode.id, name:"NewNode"}); //页面上添加节点  
            if (newNode) {
            	zTree.editName(newNode[0]);
            }
		});
};

// 移除 按钮
function removeHoverDom(treeId, treeNode) {
	$("#addBtn_" + treeNode.tId).unbind().remove();
};


//function selectAll() {
//	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
//	zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
//}

$(document).ready(function() {
	// 异步加载数据
	$.ajax({
		url:"/oa/zstp/initNodes",
		type:"get",
		dataType:"json",
		success:function(data){
			var json = JSON.parse(data);
			if (json.success) {
				$.fn.zTree.init($("#treeDemo"), setting, JSON.parse(json.zNodes));
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				var nodes = zTree.getNodes();
				zTree.selectNode(nodes[0]);
			} else {
				layer.alert("文件夹加载失败！", {icon:2});
			}
		},
		error:function(){
			layer.alert("文件夹加载失败！", {icon:2});
		}
	});
});//@ sourceURL=ztree.js