<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>

<link href="easyui/themes/default/easyui.css"  rel="stylesheet" type="text/css"/>
<link href="easyui/themes/icon.css"  rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#dg').datagrid({  
	    border:false,  
	    fitColumns:true,  
	    singleSelect: true,  
	    url:"Type/index_json",  
	    columns:[[  
	        {field:'id',title:'编号',width:30},  
	        {field:'name',title:'名称',width:85} ,
	        {field:'info',title:'类型',width:50,formatter: function(value,row,index){
	        	return value.name;
	        }
	       },
	        {field:'operate',title:'操作',align:'center',width:$(this).width()*0.1, 
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

</head>
<body>

        
<table id="dg"  class="easyui-datagrid" style="width:600px;height:500px" toolbar="#tb">
</table>
<div id="tb">
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addwin();">Add</a>
	</div>

</body>
</html>