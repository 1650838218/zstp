<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>知识图谱</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/plugin/ztreev3.5/css/zTreeStyle/zTreeStyle.css"/>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/ztreev3.5/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/ztreev3.5/js/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugin/ztreev3.5/js/jquery.ztree.exedit.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/zstp/js/ztree.js"></script>
</head>

<body>
<c:import url="/WEB-INF/jsp/header/header.jsp"></c:import>
	<ul id="folderTree" class="ztree"></ul>
</body>
</html>
