<%@ page language="java"  pageEncoding="utf-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>轮播图展示页面</title>
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
			
			
		</script>
	</head>
	<body>
		<table id="chapterlTable">
			<thead>
				<tr>
					<th  data-options="field:'title',width:'1'">名字</th>
					<th data-options="field:'status',editor:'text',width:'1'">状态</th>
					<th data-options="field:'imgPath',width:'1'">路径</th>
					<th data-options="field:'date',width:'1'">时间</th>
				</tr>
			</thead>
		</table>
	
	<div id="chapterlTableToolbar">
		<a id="chapterAdd" class="easyui-linkbutton" data-options="iconCls:'icon-add',title:'添加',plain:true"></a>
		<a id="chapterPencil" class="easyui-linkbutton" data-options="iconCls:'icon-pencil',title:'修改',plain:true"></a>
		<a id="chapterNo" class="easyui-linkbutton" data-options="iconCls:'icon-no',title:'删除',plain:true"></a>
		<a id="chapterSave" class="easyui-linkbutton" data-options="iconCls:'icon-save',title:'保存',plain:true"></a>
	</div>
	
	<div id="chapterAddDialog">
		<form id="chapterAddForm" enctype="multipart/form-data" method="post">  
	        title:<input class="easyui-validatebox" type="text" name="title" data-options="required:true" /> <br></br>    
	        imgPath:<input class="easyui-validatebox" type="text" name="imgPath" data-options="required:true" /> <br></br> 
	        description:<input class="easyui-validatebox" type="text" name="description" data-options="required:true" /> <br></br> 
		  	uploadFile:<input class="easyui-filebox"  name="file" data-options="required:true" /> 
		</form>
	</div>
	
	<div id="chapterPencilDialog">
		
	</div>
	
	<div id="chapterNoDialog">
		
	</div>
	
	<div id="chapterSaveDialog">
		
	</div>

	<div id="chapterAddDialogButtons">
		<a id="chapterAddDialogButtonsOk" class="easyui-linkbutton" data-options="iconCls:'icon-ok',title:'ok',plain:true"></a>
		<a id="chapterAddDialogButtonsCancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',title:'cancel',plain:true"></a>
	</div>
	</body>
</html>