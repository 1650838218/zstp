var setting = {
	view : {
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
		beforeDrag : beforeDrag,
		beforeEditName : beforeEditName,
		beforeRemove : beforeRemove,
		beforeRename : beforeRename,
		onRemove : onRemove,
		onRename : onRename
	}
};

var zNodes =[{"id":"root","pId":"","name":"1111"}];

var log, className = "dark";
function beforeDrag(treeId, treeNodes) {
	return false;
}

function beforeEditName(treeId, treeNode) {
	className = (className === "dark" ? "" : "dark");
	showLog("[ " + getTime() + " beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; "
			+ treeNode.name);
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	zTree.selectNode(treeNode);
	setTimeout(function() {
		if (confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？")) {
			setTimeout(function() {
				zTree.editName(treeNode);
			}, 0);
		}
	}, 0);
	return false;
}

function beforeRemove(treeId, treeNode) {
	className = (className === "dark" ? "" : "dark");
	showLog("[ " + getTime() + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; "
			+ treeNode.name);
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	zTree.selectNode(treeNode);
	return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
}

function onRemove(e, treeId, treeNode) {
	showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; "
			+ treeNode.name);
}

function beforeRename(treeId, treeNode, newName, isCancel) {
	className = (className === "dark" ? "" : "dark");
	showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime()
			+ " beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name
			+ (isCancel ? "</span>" : ""));
	if (newName.length == 0) {
		setTimeout(function() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.cancelEditName();
			alert("节点名称不能为空.");
		}, 0);
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

function showRemoveBtn(treeId, treeNode) {
	return !treeNode.isFirstNode;
}

function showRenameBtn(treeId, treeNode) {
	return !treeNode.isLastNode;
}


function showLog(str) {
	if (!log)
		log = $("#log");
	log.append("<li class='" + className + "'>" + str + "</li>");
	if (log.children("li").length > 8) {
		log.get(0).removeChild(log.children("li")[0]);
	}
}


function getTime() {
	var now = new Date(), h = now.getHours(), m = now.getMinutes(), s = now
			.getSeconds(), ms = now.getMilliseconds();
	return (h + ":" + m + ":" + s + " " + ms);
}

var newCount = 1;
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


function removeHoverDom(treeId, treeNode) {
	$("#addBtn_" + treeNode.tId).unbind().remove();
};


function selectAll() {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
}

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
				$("#selectAll").bind("click", selectAll);
			} else {
				layer.alert("文件夹加载失败！", {icon:2});
			}
		},
		error:function(){
			layer.alert("文件夹加载失败！", {icon:2});
		}
	});
});//@ sourceURL=ztree.js