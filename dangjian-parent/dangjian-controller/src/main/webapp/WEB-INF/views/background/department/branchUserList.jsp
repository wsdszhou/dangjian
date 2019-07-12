<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>支部人员管理</title>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>
    
    <!-- 查询 -->
    <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
        <div style="overflow:auto;padding:5px;" border="false">
            <form id="searchForm">
                <table class="table-edit" width="80%" align="center">
                    <tr class="title">
                        <td colspan="2">查询条件</td>
                    </tr>
                    <tr>
                        <td width="140px">用户姓名</td>
                        <td><input  class="easyui-textbox" name="yhxxXm" data-options="width:500" /></td>
                    </tr>
                    <tr>
                        <td width="140px">性别</td>
                        <td>
	                        <select class="easyui-combobox" name="yhxxXb" style="width: 200px;">   
	                           <option value="男">男</option>   
	                           <option value="女">女</option>     
	                        </select>
	                     </td>
                    </tr>
                     <tr>
                        <td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a> </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    
</body>
<script>

   
    function doSearch() {
        // 加载部门
    	 $('#namaeSercch').combobox({  
             url:'../department/loadBm',    
             valueField:'bmId',    
             textField:'bmMc' 
         });
        $('#searchWindow').window("open");
    }
    
   function doUndo() {
	   window.location.href = "../toList" 
   }
    
  //工具栏
    var toolbar = [ {
        id : 'button-add',
        text : '返回支部人员维护',
        iconCls : 'icon-undo',
        handler : doUndo
    },{
        id : 'button-search',
        text : '查询',
        iconCls : 'icon-search',
        handler : doSearch
    }];
  
    //定义列
    var columns = [ [ {
        field : 'userId',
        checkbox : true,
    },{
        field:'yhxxXm',
        title:'姓名',
        width : 200
    },{
        field:'yhxxXb',
        title:'性别',
        width : 100
    },{
        field:'bmMc',
        title:'所在部门',
        width : 100
    },{
        field:'zbMc',
        title:'所在支部人员',
        width : 100
    },{
        field:'zblxMc',
        title:'支部人员类型',
        width : 100
    },{
        field:'dnzwMc',
        title:'党内职务',
        width : 200
    },{
        field:'xzzwMc',
        title:'行政职务',
        width : 200
    }] ];
  
    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 支部人员表格
        $('#grid').datagrid({
            iconCls : 'icon-forward',
            fit : true,
            border : true,
            rownumbers : true,
            striped : true,
            pageList : [ 5, 10, 15, 20 ],
            pageSize : 15,
            pagination : true,
            toolbar : toolbar,
            url : "getBranchUserPageList/" + ${branch.zbId} ,
            idField : 'userId',
            columns : columns,
            fitColumns : true
        });
        
        // 查询
        $('#searchWindow').window({
            title : '查询分区',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        
        //定义一个工具方法，用于将指定的form表单中所有的输入项转为json数据{key:value,key:value}
        $.fn.serializeJson = function() {
            var serializeObj = {};
            var array = this.serializeArray();
            $(array).each(
                    function() {
                        if (serializeObj[this.name]) {
                            if ($.isArray(serializeObj[this.name])) {
                                serializeObj[this.name].push(this.value);
                            } else {
                                serializeObj[this.name] = [
                                        serializeObj[this.name], this.value ];
                            }
                        } else {
                            serializeObj[this.name] = this.value;
                        }
                    });
            return serializeObj;
        };

        $("#btn").click(function() {
            //将表单变成json数据
            var p = $("#searchForm").serializeJson();
            //发送一个ajax异步请求
            $("#grid").datagrid("load", p);
            //提交之后自动关闭
            $("#searchWindow").window("close");
        });
    });


</script>
</html>
