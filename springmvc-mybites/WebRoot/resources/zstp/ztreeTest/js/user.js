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
            removeHoverDom: removeHoverDom, //离开节点时的操作
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
            onRename:null,           
        },
         usericon:{
            // 增加节点图标
            ADDNODE: "fa-plus-square",
        }
    };
    // 增加节点事件
    function addHoverDom(treeId, treeNode) {  
        var sObj = $("#" + treeNode.tId + "_span"); //获取节点信息  
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;  
      
        var addStr = "<span class='button add fa "+ setting.usericon.ADDNODE + "' id='addBtn_" + treeNode.tId + "' title='add node' onfocus='this.blur();' style='position: relative;font-size:15px;padding-left: 8px;color: #9ec508;top: 2px;'></span>"; //定义添加按钮  
        sObj.after(addStr); //加载添加按钮  
        var btn = $("#addBtn_"+treeNode.tId);     
        //绑定添加事件，并定义添加操作  
        if (btn) btn.bind("click", function(){  
            var zTree = $.fn.zTree.getZTreeObj("tree");  
            //将新节点添加到数据库中  
            var name='NewNode';  
            $.post('url'+treeNode.id+'&name='+name,function (data) {  
                var newID = data; //获取新添加的节点Id  
                zTree.addNodes(treeNode, {id:newID, pId:treeNode.id, name:name}); //页面上添加节点  
                var node = zTree.getNodeByParam("id", newID, null); //根据新的id找到新添加的节点  
                zTree.selectNode(node); //让新添加的节点处于选中状态  
            });  
        });  
    };
    // 移除增加节点按钮  
    function removeHoverDom(treeId, treeNode) {  
        $("#addBtn_"+treeNode.tId).unbind().remove();  
    };

    var data = {
        teacher:[
            {id:0,name:"数学系",sex:"小班"},
            {id:1,name:"语文系",sex:"中班"},
            {id:2,name:"小说",sex:"大班"}
        ],
        student:[
            {id:0,name:"几何",sex:"小班",tId:0},
            {id:1,name:"微积分",sex:"小班",tId:0},
            {id:2,name:"文言文",sex:"中班",tId:1},
            {id:3,name:"唐诗",sex:"中班",tId:1},
            {id:4,name:"燃烧的男孩",sex:"大班",tId:2},
            {id:5,name:"直到最后一句",sex:"大班",tId:2}
        ]
    }
    function initTree(){
        var teacherList = data.teacher;
        var studentList = data.student;
        var treeData = [
        ];
        treeData.push({id:"root",name:"书架",pId:null});
        for(var i=0,il=teacherList.length;i<il;i++){
            teacherList[i].pId = "root";
            treeData.push(teacherList[i]);
        }
        for(var i=0,il=studentList.length;i<il;i++){
    　　　　studentList[i].id = "s"+studentList[i].id;
            studentList[i].pId = studentList[i].tId;
            treeData.push(studentList[i]);
        }
        
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
