<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<link rel="stylesheet" href="custom/uimaker/easyui.css">
<link href="custom/uimaker/icon.css"  rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="custom/jquery.min.js"></script>
<script type="text/javascript" src="custom/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#dg').datagrid({
	    border:true,  
	    fitColumns:true,  
	    singleSelect: true,
	    url:"Type/index_json",
	    columns:[[
	        {field:'id',title:'编号',align:'center',width:30},  
	        {field:'name',title:'名称',align:'center',width:85} ,
	        {field:'info',title:'类型',align:'center',width:50,formatter: function(value,row,index){
	        	return value.name;
	        }
	       },
	        {field:'operate',title:'操作',align:'center',width:50, 
	        	  formatter:function(val, row, index){ 
	        	    var str = '<a href="javascript:;" onclick="del('+index+');"  class="easyui-linkbutton" >删除</a>|<a href="javascript:;" onclick="editwin('+index+');"  class="easyui-linkbutton" >修改</a>'; 
	        	    return str;
	        	}} 
	    ]]  
	});  
});

</script>
<script type="text/javascript">

function del(index) {
	var row1 = $('#dg').datagrid('getData').rows[index];
	var id=row1["id"];
	$.messager.confirm('Confirm', 'Are you sure to exit this system?', function(r){
		if (r){
			$.getJSON("Type/delete_json",{id:id},function(json){
				if(json.status>0) {
					$('#dg').datagrid('reload');
				}
			});
		}
	});
	
}
function openWin(title,url,width,height,ids){
	if(!ids)ids="win";
	if(!width)width=600;
	if(!height)height=400;
	
	$("body").append($("<div id='"+ids+"' ></div>"));
	$('#'+ids).window({
        width: width,
        height: height,
        modal: true,
        href: url,
        title: title
    });
}

function addwin(){
	openWin("新增","edit.jsp");
}
function editwin(index){
	var row1 = $('#dg').datagrid('getData').rows[index];
	var id=row1["id"];
	openWin("修改","edit.jsp?id="+id);
}
</script>
<script type="text/javascript">
    function qq(value,name){
    	$('#dg').datagrid('load',{
    		txt: value
    	});
    }
</script>
</head>
<body>

<table id="dg"  class="easyui-datagrid" style="width:99%;height:auto;" toolbar="#tb">
</table>
<div id="tb" style="text-align: center;">
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addwin();"style="float: left;">新增</a>
	
	<input id="ss" class="easyui-searchbox" style="width:300px;" data-options="searcher:qq,prompt:'请出入查询内容...',menu:'#mm'"></input>
	<div id="mm" style="width:120px;">
    	<div data-options="name:'txt'">名称</div>
	</div>
</div>

</body>
</html>