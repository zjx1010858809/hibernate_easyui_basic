<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>供应商列表</title> 

<link href="css/base.css" rel="stylesheet">
<link rel="stylesheet" href="custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="custom/uimaker/icon.css">
<link rel="stylesheet" href="css/providers1.css">
<script type="text/javascript" src="custom/jquery.min.js"></script>
<script type="text/javascript" src="custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="custom/easyui-lang-zh_CN.js"></script>
</head> 
<body>
    <div class="container">
       <table id="dg" style="width:100%;height:450px" data-options="
                rownumbers:true,
                singleSelect:false,
                autoRowHeight:false,
                pagination:true,
                fitColumns:true,
                striped:true,
                checkOnSelect:false,
                selectOnCheck:false,
                collapsible:true,
                toolbar:'#tb',
                pageSize:10">
        </table>
      <div id="tb" style="padding:0 30px;">
        <div class="conditions" style="text-align: center;">
        <a href="javascript:;" class="easyui-linkbutton" onclick="addwin();" data-options="selected:true" style="float: left;">新增</a>
            <span class="con-span">名称: </span><input class="easyui-textbox" type="text" id="seachinfo" style="width:166px;height:35px;line-height:35px;"data-options="searcher:qq"></input>
            <a href="javascript:sch();" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
        </div>
      </div>
    </div>

  
  
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
        title: title,
        collapsible:false,
        minimizable:false,
        maximizable:false
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

function sch(){
	var txt=$("#seachinfo").val();
	$('#dg').datagrid('load',{
		txt: txt
	});
}
</script>
    
    <script type="text/javascript">
    (function($){
        function pagerFilter(data){
            if ($.isArray(data)){   // is array
                data = {
                    total: data.length,
                    rows: data
                }
            }
            var target = this;
            var dg = $(target);
            var state = dg.data('datagrid');
            var opts = dg.datagrid('options');
            if (!state.allRows){
                state.allRows = (data.rows);
            }
            if (!opts.remoteSort && opts.sortName){
                var names = opts.sortName.split(',');
                var orders = opts.sortOrder.split(',');
                state.allRows.sort(function(r1,r2){
                    var r = 0;
                    for(var i=0; i<names.length; i++){
                        var sn = names[i];
                        var so = orders[i];
                        var col = $(target).datagrid('getColumnOption', sn);
                        var sortFunc = col.sorter || function(a,b){
                            return a==b ? 0 : (a>b?1:-1);
                        };
                        r = sortFunc(r1[sn], r2[sn]) * (so=='asc'?1:-1);
                        if (r != 0){
                            return r;
                        }
                    }
                    return r;
                });
            }
            var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
            var end = start + parseInt(opts.pageSize);
            data.rows = state.allRows.slice(start, end);
            return data;
        }

        var loadDataMethod = $.fn.datagrid.methods.loadData;
        var deleteRowMethod = $.fn.datagrid.methods.deleteRow;
        $.extend($.fn.datagrid.methods, {
            clientPaging: function(jq){
                return jq.each(function(){
                    var dg = $(this);
                    var state = dg.data('datagrid');
                    var opts = state.options;
                    opts.loadFilter = pagerFilter;
                    var onBeforeLoad = opts.onBeforeLoad;
                    opts.onBeforeLoad = function(param){
                        state.allRows = null;
                        return onBeforeLoad.call(this, param);
                    }
                    var pager = dg.datagrid('getPager');
                    pager.pagination({
                        onSelectPage:function(pageNum, pageSize){
                            opts.pageNumber = pageNum;
                            opts.pageSize = pageSize;
                            pager.pagination('refresh',{
                                pageNumber:pageNum,
                                pageSize:pageSize
                            });
                            dg.datagrid('loadData',state.allRows);
                        }
                    });
                    $(this).datagrid('loadData', state.data);
                    if (opts.url){
                        $(this).datagrid('reload');
                    }
                });
            },
            loadData: function(jq, data){
                jq.each(function(){
                    $(this).data('datagrid').allRows = null;
                });
                return loadDataMethod.call($.fn.datagrid.methods, jq, data);
            },
            deleteRow: function(jq, index){
                return jq.each(function(){
                    var row = $(this).datagrid('getRows')[index];
                    deleteRowMethod.call($.fn.datagrid.methods, $(this), index);
                    var state = $(this).data('datagrid');
                    if (state.options.loadFilter == pagerFilter){
                        for(var i=0; i<state.allRows.length; i++){
                            if (state.allRows[i] == row){
                                state.allRows.splice(i,1);
                                break;
                            }
                        }
                        $(this).datagrid('loadData', state.allRows);
                    }
                });
            },
            getAllRows: function(jq){
                return jq.data('datagrid').allRows;
            }
        })
    })(jQuery);
    
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
    	}).datagrid('clientPaging');  
    });
    </script>
</body> 
</html>
