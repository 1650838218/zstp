<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>知识图谱</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/zstp/css/zstp.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/zstp/css/style.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/jquery/jquery-1.8.3.min.js"></script>
</head>

<body>
	<c:import url="/WEB-INF/jsp/header/header.jsp"></c:import>
	<div id="rngFrameXe" style="background-color:#ededed; padding:6px 10px 6px 10px; min-width:1000px; width:expression((document.body.clientWidth < 1000) ? '1000px':'100%')">
		<div id="divDocument" style="height: 500px;">
			<div id="divLeft" style="">
				<div id="divFolderFrame" style="height: 502px; display: block;">
					<div id="leftTopMenu">
						<div class="spFileBt" style="padding-left:6px; padding-top:2px;"><span id="gicon" style="width: 12px; height: 24px; background-position: -420px -238px;"></span></div>
						<div class="spFileBt2" id="divViewStyleExt" onclick="folderNew(event);" title="新建文件夹"><span id="gicon" class="icon" style="background-position :-0px -330px;"></span>新建</div>
						<div class="spFileSplit1"><img src="<%=request.getContextPath() %>/resources/zstp/img/btspt.png"></div>
						<div class="spFileBt2" id="divViewStyleExt" onclick="folderNew(event);" title="新建文件夹"><span id="gicon" class="icon" style="background-position :-0px -330px;"></span>新建</div>
						<div style="float:right; width:60px; height:30px; padding-top:5px;">
							<div onclick="hideFolder();" style="float:left;">
								<span id="gicon" class="icon" style="background-position: -210px -239px;  cursor: pointer;" title="隐藏文件夹"></span>
								隐藏
							</div>
						</div>
					</div>
					<div id="divExplore" style="position: absolute; overflow: auto; margin-left: 4px; margin-top: 4px; color: rgb(0, 0, 0); height: 472px; top: 25px; width: 316px;" onmouseup="showFolderMenu(event);"></div>
				</div>
				<div id="divFF2" style="display: display: none;">
					<img src="<%=request.getContextPath() %>/resources/zstp/img/rightattr.png" onclick="showFolder();" style="cursor:pointer; margin-bottom:6px">
					<br><font style="font-size:14px;"><span title="点击显示文件夹">显示文件夹</span></font>
				</div>
			</div>
			<div id="divCenter" style="display: block;"></div>
			<div id="divRight" onmouseup="showFileMenu(event);" style="width: 992px;">
				<div class="divFileBt">
					<div id="filetopmenu" style="height:26px; overflow: hidden;">
						<div class="spFileBt" style="padding-left:6px; padding-top:2px;"><span id="gicon" style="width: 12px; height: 24px; background-position: -420px -238px;"></span></div>
						<div id="divfilePopMenu" class="spFileBt2" onclick="showFileTip(event);" title="显示文件菜单">
							<span id="gicon" class="icon" style="background-position: -30px -60px; cursor: pointer;"></span>菜单
						</div>
						<div class="spFileSplit1"><img src="<%=request.getContextPath() %>/resources/zstp/img/btspt.png"></div>
						<div class="spFileBt2" id="divViewStyleExt" onclick="showViewModeMenu(event);" title="查看"><span id="gicon" class="icon" style="background-position :-0px -60px;"></span>查看</div>
						<div class="spFileSplit1"><img src="<%=request.getContextPath() %>/resources/zstp/img/btspt.png"></div>
						<div class="spFileBt2" id="divViewStyleExt" onclick="folderNew(event);" title="新建文件夹"><span id="gicon" class="icon" style="background-position :-0px -330px;"></span>新建文件夹</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(".nav_3").attr("id","topnav_current");
		});
	</script>
</body>
</html>
