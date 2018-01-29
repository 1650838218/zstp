<%@ page language="java" pageEncoding="UTF-8"%>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/zstp/css/zstp.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/zstp/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/zstp/css/ztree.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/plugin/ztree-v3.5/css/zTreeStyle/zTreeStyle.css"/>
 	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/ztree-v3.5/js/jquery.ztree.core.js"></script>
 	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/ztree-v3.5/js/jquery.ztree.excheck.js"></script>
 	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/ztree-v3.5/js/jquery.ztree.exedit.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/zstp/js/ztree.js"></script> 
 	<div id="rngFrameXe" style="background-color:#ededed; padding:6px 10px 6px 10px; min-width:1000px; width:expression((document.body.clientWidth < 1000) ? '1000px':'100%')">
		<div id="divDocument" style="height: 500px;">
			<div id="divLeft" style="">
				<div id="divFolderFrame" style="height: 502px; display: block;">
					<div id="leftTopMenu">
						<div style="float:left; margin-left:6px; height:30px; padding-top:5px;">
							<span id="gicon" class="icon" style="background-position: -270px -239px; margin-right:2px;"></span><span title="浏览、管理文件夹,增加、删除、转移文件夹" style="cursor:pointer;">文档管理</span>
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
			<div id="divRight" onmouseup="showFileMenu(event);" style="width: 992px;">
				<div class="divFileBt">
					<div id="filetopmenu" style="height:26px; overflow: hidden;">
						<div class="spFileBt" style="padding-left:6px; padding-top:2px;"><span id="gicon" style="width: 12px; height: 24px; background-position: -420px -238px;"></span></div>
						<div class="spFileBt2" onclick="showFileTip(event);" title="添加"><span id="gicon" class="icon" style="background-position: -0px -120px; cursor: pointer;"></span>添加</div>
						<div class="spFileBt2" id="divViewStyleExt" onclick="showViewModeMenu(event);" title="移动"><span id="gicon" class="icon" style="background-position : -120px -90px;"></span>移动</div>
						<div class="spFileBt3" id="divViewStyleExt" onclick="folderNew(event);" title="搜索"><span id="gicon" class="icon" style="background-position :-0px -60px;"></span>搜索</div>
					</div>
				</div>
			</div>
		</div>
	</div> 
	
	<script type="text/javascript">
		/* $(document).ready(function(){
			$(".nav_3").attr("id","topnav_current");
			
		}); */
		/* layer.alert("你好",{icon:2}); */
	</script>
