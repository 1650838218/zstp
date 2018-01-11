<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>知识图谱</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script type="text/javascript" src="/resources/plugin/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src=""></script>
  </head>
  
  <body>
	<div id="divDocument" style="height: 500px;">
	<div id="divSplitter" style="height: 800px; width: 9px;"></div>
	<div id="divLeft">
		<div id="divFolderFrame" style="height: 502px;">	
			<div id="leftTopMenu">
				<div style="float:left; margin-left:6px; height:30px; padding-top:5px;">
					<span id="gicon" class="icon" style="background-position: -270px -239px; margin-right:2px;"></span><span title="浏览、管理文件夹,增加、删除、转移文件夹" style="cursor:pointer;">文档管理</span>
				</div>
				<div style="float:right; width:114px; height:30px; padding-top:5px;">
					<div onclick="hideFolder();" style="float:left;">
						<span id="gicon" class="icon" style="background-position: -210px -239px;  cursor: pointer;" title="隐藏文件夹"></span>隐藏</div>

					<div id="divfolderPopMenu" onclick="showFolderTip(event);" style="float:left; margin-left:10px; cursor: pointer;" title="显示文件夹菜单">
						<span id="gicon" class="icon" style="background-position: -510px -360px;"></span>菜单</div>
				</div>
			</div>
			<div id="divExplore" style="position: absolute; overflow: auto; margin-left: 4px; margin-top: 4px; color: rgb(0, 0, 0); height: 472px; top: 25px; width: 316px;" onmouseup="showFolderMenu(event);">
				<div id="dOrg"><div class="orMain" id="og_itm_doc_0"><span onclick="orgOnLoadItems(this,&quot;doc&quot;, &quot;0&quot;, 1);"><span id="gicon" class="icon2" style="background-position: -30px -272px;"></span>&nbsp;多可</span></div><div id="og_its_doc_0" class="orItems"><div class="orMainEx" id="og_itm_doc_145"><span id="og_img_doc_145" class="oricon1" onclick="orgOnZoom(&quot;doc&quot;,&quot;145&quot;);"></span><span onclick="orgOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;,1);" title="id:145"><span class="orNodeName2"></span>测试组</span></div><div id="og_its_doc_145" class="orItems" style=""><div id="og_fl_doc_145"><div class="flMain" id="fl_itm_doc_145_0" style="display:none;"></div><div id="fl_its_doc_145_0" class="flItems2"><div id="fl_itm_doc_145_621" class="flMain"><span id="fl_img_doc_145_621" class="flicon" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;621&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;621&quot;);" title="id:621"><span class="flPage"></span>&nbsp;测试文件夹1</span></div><div id="fl_its_doc_145_621" class="flItems" style="display: none;"><div id="fl_dy_doc_145_621"></div></div>
<div id="fl_itm_doc_145_798" class="flMain"><span id="fl_img_doc_145_798" class="flicon" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;798&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;798&quot;);" title="id:798"><span class="flPage"></span>&nbsp;客户需求</span></div><div id="fl_its_doc_145_798" class="flItems" style="display: none;"><div id="fl_dy_doc_145_798"></div></div>
<div id="fl_itm_doc_145_590" class="flMain"><span id="fl_img_doc_145_590" class="flicon" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;590&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;590&quot;);" title="id:590"><span class="flPage"></span>&nbsp;系统支持的各类文件</span></div><div id="fl_its_doc_145_590" class="flItems" style="display: none;"><div id="fl_dy_doc_145_590"></div></div>
<div id="fl_itm_doc_145_623" class="flMain"><span id="fl_img_doc_145_623" class="flicon" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;623&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;623&quot;);" title="id:623"><span class="flPage"></span>&nbsp;项目</span></div><div id="fl_its_doc_145_623" class="flItems" style="display: none;"><div id="fl_dy_doc_145_623"></div></div>
<div id="fl_itm_doc_145_1722" class="flMain"><span id="fl_img_doc_145_1722" class="flicon" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;1722&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;1722&quot;);" title="id:1722"><span class="flPage"></span>&nbsp;研发</span></div><div id="fl_its_doc_145_1722" class="flItems" style="display: none;"><div id="fl_dy_doc_145_1722"></div></div>
<div id="fl_itm_doc_145_1329" class="flMain"><span id="fl_img_doc_145_1329" class="flicon2" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;1329&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;1329&quot;);" title="id:1329"><span class="flPage"></span>&nbsp;新品部</span></div><div id="fl_its_doc_145_1329" class="flItems" style="display: none;"></div>
<div id="fl_itm_doc_145_2147" class="flMain"><span id="fl_img_doc_145_2147" class="flicon2" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;2147&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;2147&quot;);" title="id:2147"><span class="flPage"></span>&nbsp;AV</span></div><div id="fl_its_doc_145_2147" class="flItems" style="display: none;"></div>
<div id="fl_itm_doc_145_1994" class="flMain"><span id="fl_img_doc_145_1994" class="flicon" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;1994&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;1994&quot;);" title="id:1994"><span class="flPage"></span>&nbsp;ISO体系文件--HS</span></div><div id="fl_its_doc_145_1994" class="flItems" style="display: none;"><div id="fl_dy_doc_145_1994"></div></div>
<div id="fl_itm_doc_145_2138" class="flMain"><span id="fl_img_doc_145_2138" class="flicon2" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;2138&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;2138&quot;);" title="id:2138"><span class="flPage"></span>&nbsp;test</span></div><div id="fl_its_doc_145_2138" class="flItems" style="display: none;"></div>
<div id="fl_itm_doc_145_2142" class="flMain"><span id="fl_img_doc_145_2142" class="flicon2" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;2142&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;2142&quot;);" title="id:2142"><span class="flPage"></span>&nbsp;ZXzXzXzXzXzXzXZ</span></div><div id="fl_its_doc_145_2142" class="flItems" style="display: none;"></div>
<div id="fl_itm_doc_145_2141" class="flMain"><span id="fl_img_doc_145_2141" class="flicon2" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;2141&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;2141&quot;);" title="id:2141"><span class="flPage"></span>&nbsp;阿萨</span></div><div id="fl_its_doc_145_2141" class="flItems" style="display: none;"></div>
<div id="fl_itm_doc_145_2143" class="flMain"><span id="fl_img_doc_145_2143" class="flicon2" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;2143&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;2143&quot;);" title="id:2143"><span class="flPage"></span>&nbsp;呃呃呃</span></div><div id="fl_its_doc_145_2143" class="flItems" style="display: none;"></div>
<div id="fl_itm_doc_145_1794" class="flMain"><span id="fl_img_doc_145_1794" class="flicon" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;1794&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;1794&quot;);" title="id:1794"><span class="flPage"></span>&nbsp;教学工具包</span></div><div id="fl_its_doc_145_1794" class="flItems" style="display: none;"><div id="fl_dy_doc_145_1794"></div></div>
<div id="fl_itm_doc_145_1990" class="flMain"><span id="fl_img_doc_145_1990" class="flicon" onclick="flOnZoom(&quot;doc&quot;,&quot;145&quot;,&quot;1990&quot;);"></span><span onclick="flOnLoadItems(this,&quot;doc&quot;, &quot;145&quot;, &quot;1990&quot;);" title="id:1990"><span class="flPage"></span>&nbsp;模具图纸</span></div><div id="fl_its_doc_145_1990" class="flItems" style="display: none;"><div id="fl_dy_doc_145_1990"></div></div>
</div></div></div>
<div class="orMain" id="og_itm_doc_101"><span id="og_img_doc_101" class="oricon" onclick="orgOnZoom(&quot;doc&quot;,&quot;101&quot;);"></span><span onclick="orgOnLoadItems(this,&quot;doc&quot;, &quot;101&quot;,1);" title="id:101"><span class="orNodeName2"></span>演示组</span></div><div id="og_its_doc_101" class="orItems" style="display: none;"><div id="og_fl_doc_101"></div></div>
<div class="orMain" id="og_itm_doc_1"><span id="og_img_doc_1" class="oricon" onclick="orgOnZoom(&quot;doc&quot;,&quot;1&quot;);"></span><span onclick="orgOnLoadItems(this,&quot;doc&quot;, &quot;1&quot;,1);" title="id:1"><span class="orNodeName2"></span>知识管理</span></div><div id="og_its_doc_1" class="orItems" style="display: none;"><div id="og_fl_doc_1"></div></div>
</div></div>

				<div id="dUser" style="cursor: pointer; margin-top: 8px !important;" title="管理我的私人文档"><span class="oricon" onclick="showUserDoc();"></span><span class="orGpN2"></span><span onclick="showUserDoc();">&nbsp;我的文档</span></div>

				<div id="dShare" style="cursor: pointer; margin-top: 8px !important;" title="同事共享给我的文件"><span class="oricon" onclick="showShareDoc();"></span><span class="orGpN4"></span><span id="shareNode" onclick="showShareDoc();" style="line-height: 24px;">&nbsp;共享文档</span>	
				</div>
				<div id="shareDoc" style="padding-left:16px; margin-bottom:10px; display: none;"></div>
				
				<div id="dFavorite" style="cursor: pointer; margin-top: 8px !important;"><span class="oricon" onclick="showMyFavorite();"></span><span class="orGpN3"></span><span id="favoriteNode" onclick="showMyFavorite();">&nbsp;我的关注</span>
				</div>

				<div id="dTagFiles" style="cursor: pointer; margin-top: 8px !important;"><span class="oricon" onclick="listMyTags();"></span><span class="orGpN5"></span><span id="tagFilesNode" onclick="listMyTags();">&nbsp;我的专题</span>
				</div>
				<div id="tagsListDiv" style="padding-left:28px !important;  padding-left:32px; margin-top: 2px; margin-bottom:10px; display: none;"></div>				
			</div>
			
		</div>
		<div id="divFF2">
			<img src="/img/rightattr.png" onclick="showFolder();" style="cursor:pointer; margin-bottom:6px">
			<br><font style="font-size:14px;"><span title="点击显示文件夹">显示文件夹</span></font>
		</div>
	</div>
	<div id="divCenter"></div>
	<div id="divRight" onmouseup="showFileMenu(event);" style="width: 992px;">
		<div class="divFileBt">			
			
			<div id="extShortcutMenu2" style="display: none; padding-left:12px;">
	<span id="gicon" style="width: 12px; height: 24px; background-position: -420px -238px;"></span> 
	<span id="extMenuTitleSp2" style=" height: 24px; line-height: 24px;"></span>
</div>
			<div id="filetopmenu" style="height:26px; overflow: hidden;">
				
<div class="spFileBt" style="padding-left:6px; padding-top:2px;"><span id="gicon" style="width: 12px; height: 24px; background-position: -420px -238px;"></span></div>
<div id="divfilePopMenu" class="spFileBt2" onclick="showFileTip(event);" title="显示文件菜单">
	<span id="gicon" class="icon" style="background-position: -30px -60px; cursor: pointer;"></span>菜单
</div>

<div class="spFileSplit1"><img src="/img/btspt.png"></div>
<div class="spFileBt2" id="divViewStyleExt" onclick="showViewModeMenu(event);" title="查看"><span id="gicon" class="icon" style="background-position :-0px -60px;"></span>查看</div>
 
<div class="spFileSplit1"><img src="/img/btspt.png"></div>
<div class="spFileBt2" id="divViewStyleExt" onclick="folderNew(event);" title="新建文件夹"><span id="gicon" class="icon" style="background-position :-0px -330px;"></span>新建文件夹</div>
 
<div class="spFileSplit1"><img src="/img/btspt.png"></div>
<div class="spFileBt4" onclick="fileUpload();"><span id="gicon" class="icon" style="background-position: -0px -90px"></span>上传</div>
<div class="spFileBt4" onclick="showShortcutMenuExt(event);" style="padding-left:4px;"><span id="gicon" class="icon" style="background-position: -91px -236px" title="更多上传"></span></div>
<!--<div class="spFileBt2" onClick="clipbordFile();" title="资源管理器中拷贝文件，粘贴上传文件"><span id="gicon" class="icon" style="background-position: -150px -360px"></span>粘贴上传</div>-->
<div class="spFileBt2" onclick="fileDownload();"><span id="gicon" class="icon" style="background-position: -30px -90px"></span>下载</div>
<div class="spFileBt2" onclick="previewOpen();"><span id="gicon" class="icon" style="background-position: -60px -90px"></span>预览</div>
<div class="spFileBt2" onclick="fileEdit();"><span id="gicon" class="icon" style="background-position: -90px -90px"></span>修改</div>
<div class="spFileBt2" onclick="fileDel();"><span id="gicon" class="icon" style="background-position: -150px -90px"></span>删除</div>


<div class="spFileSplit1"><img src="/img/btspt.png"></div>
<div class="spFileBt3" onclick="fileRename();"><span id="gicon" class="icon" style="background-position: -30px -120px"></span>重命名</div>
<div class="spFileBt2" onclick="fileDesc();" title="文件详细管理"><span id="gicon" class="icon" style="background-position: -60px -120px"></span>详细</div> 
<div class="spFileBt2" onclick="fileMove();"><span id="gicon" class="icon" style="background-position: -120px -90px"></span>移动</div>

<div class="spFileSplit1"><img src="/img/btspt.png"></div>
<div class="spFileBt2" onclick="fileSearch();" title="在本文件夹下搜索文件"><span id="gicon" class="icon" style="background-position:-60px -120px;"></span>搜索</div>

<div class="spFileSplit1"><img src="/img/btspt.png"></div>
<div class="spFileBt2" onclick="showVerMenu(event);" title="版本控制"><span id="gicon" class="icon" style="background-position: -120px -150px"></span>版本</div>
 
	
			</div>
			
			<div id="recyclemenu" style="display: none; padding-left:12px;">
				<div class="spFileBt2" onclick="fileDelComp();"><span id="gicon" class="icon" style="background-position: -150px -90px"></span>删除</div>
				<div class="spFileBt2" onclick="restore();"><span id="gicon" class="icon" style="background-position: -60px -150px"></span>还原</div>
				<div class="spFileBt2" onclick="clearRecycle();"><span id="gicon" class="icon" style="background-position: -270px -90px"></span>清空</div>
			</div>
		</div>
		<div id="tb_files_load" style="padding-top: 4px; padding-left: 6px; display: none;">
			<img src="/img/ic_load.gif" border="0">
		</div>
		<script language="javascript" src="/helper/popcalendar.js"></script>
		<div id="sp_files" style="height: 472px;">
<div id="divRightContent" style="width:100% - 8; height: 100%; margin-left: 10px; margin-right:10px;">
	<div id="divFolderOrGroupDesc" style="padding-top:3px !important; padding-top:6px; padding-bottom:3px !important;  padding-bottom:1px; ">
	<div class="singletextline" style="margin-left:4px;">
		<div style="float:left;"><b><b><span id="doc_path" title="组ID:145,本目录ID:0" ondblclick="folderDesc(this);">测试组/</span></b><span style="margin-left:20px;"></span></b><span id="gicon" class="icon" style="background-position: -630px -270px" onclick="selectFolder(_selectedOwnerId, _selectedFolderId, _selectedName);" title="刷新文件中的文件信息"></span></div>
		<div style="float:right; padding-right:4px;">
			<span><a href="javascript: statFolder();" style="margin-right:4px;"><b>统计</b></a></span>
			<span style="margin-right:4px;" id="sp_statfolder"></span>
			<span><a href="javascript: exportFiles();" style="margin-right:4px;"><b>导出列表</b></a></span>
		</div>
	</div>
	 
</div>

	<div id="fileListTableTitle" style="border: 1px dashed #C1C4C4; border-bottom: none;">
		<table id="tabFileNav" style="border-collapse: collapse; width: 954px;">
			<tbody><tr style="height:28px;">
				<td style="padding:4px; border-right:dashed 1px #C1C4C4;">&nbsp;<a href="javascript: setSortCond('na');">文件名</a> &nbsp;&nbsp;<font style="font-size:12px">(点击排序)</font></td>
				<td style="padding: 4px; border-right: 1px dashed rgb(193, 196, 196); display: none; width: 0px;" id="td_checkOutUser">$ver_or_owner$</td>
				<td style="padding: 4px; border-right: 1px dashed rgb(193, 196, 196); width: 60px;"><a href="javascript: setSortCond('si');">大小</a></td>
				<td style="padding: 4px; border-right: 1px dashed rgb(193, 196, 196); width: 65px;"><a href="javascript: setSortCond('kd');">类型</a></td>
				<td style="padding: 4px; width: 131px;"><a href="javascript: setSortCond('dt');">修改日期</a></td>
			</tr>
		</tbody></table>
	</div>

	<div id="divFileContainer" style="margin: 0px auto; height: 372px; overflow-x: visible; overflow-y: auto;">
		<table id="file_container" class="tabframeX3" style="width:100%;">
			<tbody><tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_1722" value="1722"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","1722"); ' title="研发">研发</a></td><td width="130px">17-07-12 07:56:17</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_623" value="623"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","623"); ' title="项目">项目</a></td><td width="130px">12-12-20 18:14:00</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_590" value="590"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","590"); ' title="系统支持的各类文件">系统支持的各类文件</a></td><td width="130px">12-12-20 18:06:53</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_798" value="798"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","798"); ' title="客户需求">客户需求</a></td><td width="130px">13-07-08 11:37:16</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_621" value="621"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","621"); ' title="测试文件夹1">测试文件夹1</a></td><td width="130px">12-12-20 18:10:47</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_1329" value="1329"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","1329"); ' title="新品部">新品部</a></td><td width="130px">16-05-25 13:47:57</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_1990" value="1990"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","1990"); ' title="模具图纸">模具图纸</a></td><td width="130px">17-09-23 10:21:47</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_1794" value="1794"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","1794"); ' title="教学工具包">教学工具包</a></td><td width="130px">17-09-08 09:31:09</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_2143" value="2143"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","2143"); ' title="呃呃呃">呃呃呃</a></td><td width="130px">18-01-07 22:26:06</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_2141" value="2141"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","2141"); ' title="阿萨">阿萨</a></td><td width="130px">18-01-07 16:50:21</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_2142" value="2142"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","2142"); ' title="ZXzXzXzXzXzXzXZ">ZXzXzXzXzXzXzXZ</a></td><td width="130px">18-01-07 16:50:27</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_2138" value="2138"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","2138"); ' title="test">test</a></td><td width="130px">18-01-02 11:18:57</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_1994" value="1994"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","1994"); ' title="ISO体系文件--HS">ISO体系文件--HS</a></td><td width="130px">17-09-28 15:35:38</td></tr>
<tr><td colspan="3"><input type="checkbox" name="multiFolderId" id="bch_fl_2147" value="2147"><span id="gicon" class="icon" style="background-position: -60px -270px"></span><a href='javascript:flOnLoadItems2("doc", "145","2147"); ' title="AV">AV</a></td><td width="130px">18-01-10 19:57:20</td></tr>
 
		</tbody></table>
	</div>

	<div id="filePaginationDiv" class="pagination">
		<div style="float: left;">
			<span>
				<a href="javascript: selectAllFiles();">全选</a>&nbsp;
				<a href="javascript: InvertFiles()">反选</a>&nbsp;
				<a href="javascript: cancelSelectedFiles();">取消</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</span> 
			<span>
				文档总数：0<span style="padding-left:10px;">子文件夹总数：14</span>&nbsp;&nbsp;
			</span>
		</div>
		<div style="text-align: right; padding-right: 20px;"> 
			<a href="javascript: addToDownList();">将选中文件加入下载车</a>，<a href="javascript: viewDownList();">查看下载车</a>
			<input type="hidden" id="first_file" value=""> 
		</div>
	</div>
</div>
</div>
	</div>
</div>
  </body>
</html>
