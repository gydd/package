<%@ page language="java"  pageEncoding="utf-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>专辑详情展示页面</title>
		<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css" href="../themes/IconExtension.css"/>   
		<link rel="stylesheet" type="text/css" href="../themes/icon.css"/>
		<script type="text/javascript" src="../js/jquery.min.js"></script>   
		<script type="text/javascript" src="../js/jquery.easyui.min.js"></script> 
		<script type="text/javascript" src="../js/datagrid-detailview.js"></script> 
		<script type="text/javascript" src="../js/jquery.edatagrid.js"></script> 
		<script type="text/javascript" src="../js/common.js"></script>  
		<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#album_detailsTable").datagrid({
					title:"专辑详情展示",
					fitColumns:true,
					url:"${pageContext.request.contextPath}/Album/queryAlbum?id="
				});
				
				
			});
			
		</script>
	</head>
	<body>
		<table id="album_detailsTable">
			<thead>
				<tr>
					<th data-options="field:'title',width:'1'">名字</th>
					<th data-options="field:'status',width:'1'">状态</th>
					<th data-options="field:'imgPath',width:'1'">路径</th>
					<th data-options="field:'date',width:'1'">时间</th>
				</tr>
			</thead>
		</table>
	</body>
</html>