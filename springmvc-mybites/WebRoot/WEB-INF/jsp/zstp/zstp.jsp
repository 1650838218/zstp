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
						<div style="float:left; margin-left:6px; height:30px; padding-top:5px;">
							<span id="gicon" class="icon" style="background-position: -270px -239px; margin-right:2px;"></span>
							<span title="浏览、管理文件夹,增加、删除、转移文件夹" style="cursor:pointer;">文档管理</span>
						</div>
						<div style="float:right; width:114px; height:30px; padding-top:5px;">
							<div onclick="hideFolder();" style="float:left;">
								<span id="gicon" class="icon" style="background-position: -210px -239px;  cursor: pointer;" title="隐藏文件夹"></span>
								隐藏
							</div>
		
							<div id="divfolderPopMenu" onclick="showFolderTip(event);" style="float:left; margin-left:10px; cursor: pointer;" title="显示文件夹菜单">
								<span id="gicon" class="icon" style="background-position: -510px -360px;"></span>
								菜单
							</div>
						</div>
					</div>
					<div id="divExplore" style="position: absolute; overflow: auto; margin-left: 4px; margin-top: 4px; color: rgb(0, 0, 0); height: 472px; top: 25px; width: 316px;" onmouseup="showFolderMenu(event);"></div>
				</div>
				<div id="divFF2" style="display: display: none;">
					<img src="/img/rightattr.png" onclick="showFolder();" style="cursor:pointer; margin-bottom:6px">
					<br><font style="font-size:14px;"><span title="点击显示文件夹">显示文件夹</span></font>
				</div>
			</div>
			<div id="divCenter" style="display: block;"></div>
			<div id="divRight" onmouseup="showFileMenu(event);" style="width: 992px;"></div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(".nav_3").attr("id","topnav_current");
		});
	</script>
</body>
</html>
