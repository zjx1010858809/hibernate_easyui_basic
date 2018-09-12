<%@ page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="easyui/themes/default/easyui.css"  rel="stylesheet" type="text/css"/>
<link href="easyui/themes/icon.css"  rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>



	<!-- <div style="padding:3px 2px;border-bottom:1px solid #ccc">Ajax Form</div> -->
	
	<form id="ff"  method="post">
	
	<c:if test="${param.id!=null}">
	<input type="hidden" name="id" value="${param.id}">
	</c:if>
			
				<label for="name">名称:</label>
				<input id="aa" class="easyui-validatebox" type="text" name="name" data-options="required:true"></input>
			
				<label for="parentid">类型:</label>
				<input id="cc" class="easyui-combobox" name="parentid" editable="false"
    data-options="required:true,valueField:'id',textField:'name',url:'Type_info/index_json'">
				
				<input type="button" value="保存" onclick="save();"></input></td>
			
	</form>
	<script type="text/javascript">
	function save(){
		var url="Type/insert_json";
		var size=$("[name=id]").length;
		if(size==1) url="Type/update_json";
		$('#ff').form({
		    url:url,
		    onSubmit: function(){
		    	if($("#aa").val().length==0){
		    		$.messager.alert('提示','名称不能为空');
		    		return false;
		    	}else if($("#cc").val().length==0||$("#cc").val()==null){
		    		$.messager.alert('提示','类型不能为空');
		    		return false;
		    	}else{
		    		return true;
		    	}
		    },
		    success:function(data){
		    		$('#win').window('close');
			    	$('#dg').datagrid('reload');
		    }
		});
		$('#ff').submit();
	}
	
	
	function init(id){
		$('#ff').form('load','Type/edit_json?id='+id);
	}
	
	
	$(function(){
		var size=$("[name=id]").length;
		if(size==1)init($("[name=id]").val());
		
	});
	
	</script>
</body>
</html>