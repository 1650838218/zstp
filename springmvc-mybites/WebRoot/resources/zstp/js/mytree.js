$(function(){
    var setting = {
        data:{//表示tree的数据格式
            simpleData:{
                enable:true,//表示使用简单数据模式
                idKey:"id",//设置之后id为在简单数据模式中的父子节点关联的桥梁
                pidKey:"pId",//设置之后pid为在简单数据模式中的父子节点关联的桥梁和id互相对应
                rootId:"null"//pid为null的表示根节点
            }
        },
        view:{//表示tree的显示状态
            selectMulti:false,//表示禁止多选
            addHoverDom: addHoverDom, //当鼠标移动到节点上时，显示用户自定义控件  
            removeHoverDom: removeHoverDom //离开节点时的操作
        },
        check:{//表示tree的节点在点击时的相关设置
            enable:true,//是否显示radio/checkbox
            chkStyle:"checkbox",//值为checkbox或者radio表示
            checkboxType:{ "Y": "p", "N": "s" },//表示父子节点的联动效果
            radioType:"level"//设置tree的分组
        },
        edit:{
            enable: true, //单独设置为true时，可加载修改、删除图标  
            editNameSelectAll: false,  
            showRemoveBtn: true,  
            showRenameBtn: true 
        },
        callback:{//表示tree的一些事件处理函数
            beforeDrag:null,
            beforeDragOpen:null,
            beforeDrop:null,
            beforeEditName:null,
            beforeRename:null,
            onDrag:null,
            onDragMove:null,
            onDrop:null,
            onRename:onRename          
        },
         usericon:{
            // 增加节点图标
            ADDNODE: "fa-plus-square",
        }
    };
    
    // 固定根节点
    function dblClickExpand(treeId, treeNode) {
    	return treeNode.level > 0;
    }
    
    // 增加节点事件
    function addHoverDom(treeId, treeNode) {  
        var sObj = $("#" + treeNode.tId + "_span"); //获取节点信息  
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;  
      
        var addStr = "<span class='button add fa "+ setting.usericon.ADDNODE + "' id='addBtn_" + treeNode.tId + "' title='add node' onfocus='this.blur();' style='position: relative;font-size:15px;padding-left: 8px;color: #9ec508;top: 2px;'></span>"; //定义添加按钮  
        sObj.after(addStr); //加载添加按钮  
        var btn = $("#addBtn_"+treeNode.tId);     
        //绑定添加事件，并定义添加操作  
        if (btn) {
        	btn.bind("click", function(){  
	            var zTree = $.fn.zTree.getZTreeObj("tree");
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
        }
    };
    
    // 移除增加节点按钮  
    function removeHoverDom(treeId, treeNode) {  
        $("#addBtn_"+treeNode.tId).unbind().remove();  
    };

    // 修改节点名称的回调函数
    function beforeRename(treeId, treeNode, newName, isCancel) {
		className = (className === "dark" ? "":"dark");
		showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
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
    
    // 文件夹名称编辑后的回调
    function onRename(event, treeId, treeNode, isCancel) {
    	//将新节点添加到数据库中  
    	var url = "zstp/saveNode"
        var name=treeNode.name; 
        var id = treeNode.id;
        var pId = treeNode.pId;
        $.post(url,{id:id,pId:pId,name:name},function (data) { 
        	var zTree = $.fn.zTree.getZTreeObj("tree");
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
        },"json");
    }//@ sourceURL=mytree.js
    var data = {
        teacher:[
            {id:"01",name:"数学系",sex:"小班"},
            {id:"02",name:"语文系",sex:"中班"},
            {id:"03",name:"小说",sex:"大班"}
        ],
        student:[
            {id:"0101",name:"几何",sex:"小班",tId:"01"},
            {id:"0102",name:"微积分",sex:"小班",tId:"01"},
            {id:"0201",name:"文言文",sex:"中班",tId:"02"},
            {id:"0202",name:"唐诗",sex:"中班",tId:"02"},
            {id:"0301",name:"燃烧的男孩",sex:"大班",tId:"03"},
            {id:"0302",name:"直到最后一句",sex:"大班",tId:"03"}
        ]
    }
    
    function initTree(){
        var teacherList = data.teacher;
        var studentList = data.student;
        var treeData = [];
        treeData.push({id:"root",name:"书架",pId:null});
        for(var i=0,il=teacherList.length;i<il;i++){
            teacherList[i].pId = "root";
            treeData.push(teacherList[i]);
        }
        for(var i=0,il=studentList.length;i<il;i++){
            studentList[i].pId = studentList[i].tId;
            treeData.push(studentList[i]);
        }
        console.log(treeData);
        $.fn.zTree.init($("#tree"),setting,treeData);
    }
    
    initTree();
    $("#tree").on('mouseenter','#tree li .chk',function(e){
        $(this).parent("li").addClass("activeLiMouse");
    });
    $("#tree").on('mouseenter','#tree li a',function(e){
        $(this).parent("li").addClass("activeLiMouse");
    });
    $("#tree").on('mouseleave','#tree li .chk',function(e){
        $(this).parent("li").removeClass("activeLiMouse");
    });
    $("#tree").on('mouseleave','#tree li a',function(e){
        $(this).parent("li").removeClass("activeLiMouse");
    });
})
