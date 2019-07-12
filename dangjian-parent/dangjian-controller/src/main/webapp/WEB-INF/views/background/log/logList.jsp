<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日志管理</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body  class="easyui-layout" style="visibility: hidden;">
     <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid" height="100%"></table>
    </div>
    
        <!-- 查询用户窗口 -->
    <s:hasPermission name="log-search">
	    <div class="easyui-window" title="查询用户窗口 " id="searchWindow" data-options="closed:true,modal:true" collapsible="false" minimizable="false" maximizable="false" style="top:50px;left:50px">
	        <div style="overflow:auto;padding:5px;" border="false">
	            <form id="searchForm">
	                <table class="table-edit" width="90%" align="center">
	                    <tr class="title">
	                        <td colspan="2">查询条件</td>
	                    </tr>
	                    <tr>
	                        <td style="width: 100px;">操作类型:</td>
	                        <td >
	                            <select class="easyui-combobox" name="type" data-options="required:false,width:500">
	                                    <option >添加</option>
	                                    <option>修改</option>
	                                    <option>删除</option>
	                                    <option>查询</option>
	                            </select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>起始时间:</td>
	                        <td><input class="easyui-datetimebox"  name="createTime" data-options="required:false,width:500" ></input></td>
	                    </tr>
	                    <tr>
	                        <td>结束时间:</td>
	                        <td><input class="easyui-datetimebox"  name="endTime" data-options="required:false,width:500" ></input></td>
	                    </tr>
	                    <tr>
	                        
	                        <td ><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search',required:false" style="width: 80px;" >查询</a> </td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                    </tr>    
	                </table>
	            </form>
	        </div>
    </div> 
    </s:hasPermission>
    
<script type="text/javascript">
	
	// 解析一个日期字符串
	$.fn.datetimebox.defaults.parser = function(s){
	    var t = Date.parse(s);
	    if (!isNaN(t)){
	        return new Date(t);
	    } else {
	        return new Date();
	    }
	}
   
    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除视频！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的视频吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //保存在我们的数组里面
                        array.push(rows[i].id);
                    }
                    var ids = array.join(",");
                    $.post("deleteBatch/"+ids,function (date) {
                        if (date.error == 0) {
                            $("#grid").datagrid('load');    // 重新载入当前页面数据
                        } else {
                            $.messager.alert("提示信息","删除失败！","warning");
                        }
                    });
                }
            });
        }
    };

    function doSearch() {
        $('#searchWindow').window("open");
    };

    //工具栏
    var toolbar = [ 
    	<s:hasPermission name="log-search">
    	{
            id : 'button-search',
            text : '查询',
            iconCls : 'icon-search',
            handler : doSearch
        }, 
    	</s:hasPermission>
    	<s:hasPermission name="log-delete">
    	{
            id : 'button-delete',
            text : '删除',
            iconCls : 'icon-cancel',
            handler : doDelete
        }
    	</s:hasPermission>	
     ];

    //定义列
    var columns = [ [ {
        field : 'id',
        checkbox : true
    } , {
        field : 'yhxxXm',
        title : '操作者',
        width : 70,
        align : 'center'
    }, {
        field : 'loginIp',
        title : 'IP地址',
        width : 100,
        align : 'center'
    }, {
        field : 'type',
        title : '操作类型',
        width : 50,
        align : 'center',
        formatter: function(value,row,index){
            if (value == 1){
                return "添加";
            } else if (value == 2){
                return "修改";
            } else if (value == 3){
                return "删除";
            } else if (value == 4){
                return "查询";
            }
        }
    }, {
        field : 'operation',
        title : '操作内容',
        width : 250,
        align : 'center'
    } , {
        field : 'remark',
        title : '备注',
        width : 250,
        align : 'center'
    }] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 视频数据表格
        $('#grid').datagrid({
            iconCls : 'icon-forward',
            fit : true,
            border : true,
            rownumbers : true,
            striped : true,
            pageList : [ 5, 10, 15, 20, 30, 40 ],
            pageSize : 20,
            pagination : true,
            toolbar : toolbar,
            url : "getLogPageList",
            idField : 'id',
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
            console.log(p);
            //发送一个ajax异步请求
            $("#grid").datagrid("load", {data:JSON.stringify(p)});
            //提交之后自动关闭
            $("#searchWindow").window("close");
        });
        
        
        
    });
</script>
</body>
</html>