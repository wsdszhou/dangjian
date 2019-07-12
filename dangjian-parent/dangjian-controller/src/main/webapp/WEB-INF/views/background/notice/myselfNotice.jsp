<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自己的通知列表</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>
    
    <s:hasPermission name="selfNotice-notice">
    <!-- 查询 -->
    <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
        <div style="overflow:auto;padding:5px;" border="false">
            <form id="searchForm">
                <table class="table-edit" width="80%" align="center">
                    <tr class="title">
                        <td colspan="2">查询条件</td>
                    </tr>
                    <tr  >
                        <td>通知标题</td>
                        <td>
                            <input class="easyui-textbox" name="tzBt" >
                        </td>
                    </tr>
					<tr  >
                        <td>通知内容</td>
                        <td>
                            <input class="easyui-textbox" name="tzNr" data-options="height:65,multiline:true">
                        </td>
                    </tr>
                    <tr  >
                        <td>通知优先级</td>
                        <td>
					                            普通通知<input type="radio" name="tzYxj"  value="0" >
					                             置顶通知<input type="radio" name="tzYxj" value="1">
                        </td>
                    </tr>
                    <tr  >
                        <td>通知开始时间</td>
                        <td>
                            <input class="easyui-datetimebox" name="tzFbsj" data-options="showSeconds:false">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a> </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    </s:hasPermission>

<script type="text/javascript">

	$.fn.datetimebox.defaults.formatter = function(date){
	    return getLocalTime(date);
	}

    function doSeacher() {
		$('#searchWindow').window("open");
    }

    //工具栏
    var toolbar = [
    <s:hasPermission name="selfNotice-notice">
    {
        id : 'button-delete',
        text : '查询',
        iconCls : 'icon-search',
        handler : doSeacher
    }
    </s:hasPermission>
    ];

    //定义列
    var columns = [ [ {
        field : 'tzId',
        checkbox : true,
    }, {
        field : 'tzBt',
        title : '通知标题',
        width : 120,
        align : 'center'
    }, {
        field : 'tzNr',
        title : '通知内容',
        width : 120,
        align : 'center'
    }, {
        field : 'tzFbrmc',
        title : '发布人名称',
        width : 80,
        align : 'center'
    },  {
        field : 'tzYxj',
        title : '通知优先级',
        width : 80,
        align : 'center',
        formatter: function(value,row,index){
            if (value === 0){
                return "普通通知";
            } else {
                return "置顶通知";
            }
        }
    }, {
        field : 'tzFbsj',
        title : '通知发布时间',
        width : 120,
        align : 'center',
        formatter: function(value,row,index){
        	return value;
        }
    }, {
        field : 'tzdxSfyd',
        title : '是否阅读',
        width : 80,
        align : 'center',
        formatter: function(value,row,index){
            if (value === 0){
                return "未阅读   &nbsp;&nbsp; " ;
            } else {
                return "已阅读";
            }
        }
    }] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 自己的通知数据表格
        $('#grid').datagrid({
            iconCls : 'icon-forward',
            fit : true,
            border : true,
            rownumbers : true,
            striped : true,
            pageList : [ 5, 10, 15, 20 ],
            pageSize : 10,
            pagination : true,
            toolbar : toolbar,
            url : "getMyselfNoticePageList",
            idField : 'tzfwId',
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
            height :600,
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
</body>
</html>