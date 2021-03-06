<%@ page language="java"  pageEncoding="utf-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>吉祥妙音展示页面</title>
		<link rel="stylesheet" type="text/css" href="../cmfz/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css" href="../cmfz/themes/IconExtension.css"/>   
		<link rel="stylesheet" type="text/css" href="../cmfz/themes/icon.css"/>
		<script type="text/javascript" src="../cmfz/js/jquery.min.js"></script>   
		<script type="text/javascript" src="../cmfz/js/jquery.easyui.min.js"></script> 
		<script type="text/javascript" src="../cmfz/js/datagrid-detailview.js"></script> 
		<script type="text/javascript" src="../cmfz/js/jquery.edatagrid.js"></script> 
		<script type="text/javascript" src="../cmfz/js/common.js"></script>  
		<script type="text/javascript" src="../cmfz/js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#albumlTable").treegrid({
					title:"吉祥妙音",
					fitColumns:true,
					toolbar:"#albumlTableToolbar",
					url:"${pageContext.request.contextPath}/treegrid/treedatagrid.json",
					idField:"id",    
    				treeField:"title"
				});
				
				/* 专辑加对话框 */
				$("#albumAddDialog").dialog({
					buttons:"#albumAddDialogButtons",
					width:300,
					height:300,
					closed:true,
					cache:false,
					modal:true
				});
			});
			
		</script>
	</head>
	<body>
		<table id="albumlTable">
			<thead>
				<tr>
					<th  data-options="field:'title',width:'1'">名字</th>
					<th data-options="field:'url',width:'1'">下载路径</th>
					<th data-options="field:'size',width:'1'">章节大小</th>
					<th data-options="field:'time',width:'1'">章节时长</th>
				</tr>
			</thead>
		</table>
	
	<div id="albumlTableToolbar">
		<a id="albumAdd" class="easyui-linkbutton" data-options="iconCls:'icon-add',title:'添加',plain:true"></a>
		<a id="albumPencil" class="easyui-linkbutton" data-options="iconCls:'icon-pencil',title:'修改',plain:true"></a>
		<a id="albumNo" class="easyui-linkbutton" data-options="iconCls:'icon-no',title:'删除',plain:true"></a>
		<a id="albumSave" class="easyui-linkbutton" data-options="iconCls:'icon-save',title:'保存',plain:true"></a>
	</div>
	
	<div id="albumAddDialog">
		<form id="albumAddForm" enctype="multipart/form-data" method="post">  
	        title:<input class="easyui-validatebox" type="text" name="title" data-options="required:true" /> <br></br>    
	        imgPath:<input class="easyui-validatebox" type="text" name="imgPath" data-options="required:true" /> <br></br> 
	        description:<input class="easyui-validatebox" type="text" name="description" data-options="required:true" /> <br></br> 
		  	uploadFile:<input class="easyui-filebox"  name="file" data-options="required:true" /> 
		</form>
	</div>
	
	<div id="albumPencilDialog">
		
	</div>
	
	<div id="albumNoDialog">
		
	</div>
	
	<div id="albumSaveDialog">
		
	</div>

	<div id="albumAddDialogButtons">
		<a id="albumAddDialogButtonsOk" class="easyui-linkbutton" data-options="iconCls:'icon-ok',title:'ok',plain:true"></a>
		<a id="albumAddDialogButtonsCancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',title:'cancel',plain:true"></a>
	</div>
	</body>
</html>