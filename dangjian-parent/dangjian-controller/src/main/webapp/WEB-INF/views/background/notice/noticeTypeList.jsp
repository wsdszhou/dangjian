<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知范围列表</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>

    <!-- 添加 -->
    <s:hasPermission name="noticeType-add">
    <div class="easyui-window" title="添加通知范围" id="addNoticeTypeWindow"
        collapsible="false" minimizable="false" maximizable="false"
        style="top: 20px; left: 50px">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="addNoticeType" icon="icon-save" href="#" class="easyui-linkbutton"
                    plain="true">保存</a>
                <script type="text/javascript">
                    $(function() {
                        $("#addNoticeType").click(function() {
                            //表单校验
                            var r = $("#addNoticeTypeForm").form('validate');
                            if (r) {
                            	$.post(
                                     "addNoticeRange", 
                                     $("#addNoticeTypeForm").serializeJson(),
                                     function (date) {
                                         if(date.error == 0){
                                             $("#addNoticeTypeWindow").window("close");
                                             $("#grid").datagrid('reload');
                                             $("#addNoticeTypeForm").form('clear');
                                         }else {
                                             $.messager.alert("提示信息","添加失败！","warning");
                                             $("#addNoticeTypeWindow").window("close");
                                         }
                                     }
                                 );
                            }
                        });
                    });
                </script>
            </div>
        </div>
         <div style="overflow: auto; padding: 5px;" border="false">
            <form id="addNoticeTypeForm" method="post" action="addNoticeRange" >
                <table class="table-edit" width="80%" align="center">
                    <tr class="title" >
                        <td colspan="2">通知范围信息</td>
                    </tr>
                    <tr class="selectFile" >
                        <td>通知范围名称</td>
                        <td>
                            <input class="easyui-textbox" name="tzfwMc" data-options="required:true">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    </s:hasPermission>
    
    <!-- 修改 -->
    <s:hasPermission name="noticeType-update">
    <div class="easyui-window" title="修改通知范围" id="updateNoticeTypeWindow"
        collapsible="false" minimizable="false" maximizable="false"
        style="top: 20px; left: 50px">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="updateNoticeType" icon="icon-save" href="#" class="easyui-linkbutton"
                    plain="true">保存</a>
                <script type="text/javascript">
                    $(function() {
                        $("#updateNoticeType").click(function() {
                            //表单校验
                            var r = $("#updateNoticeTypeForm").form('validate');
                            if (r) {
                            	$.post(
                                     "updateNoticeRange", 
                                     $("#updateNoticeTypeForm").serializeJson(),
                                     function (date) {
                                         if(date.error == 0){
                                             $("#updateNoticeTypeWindow").window("close");
                                             $("#grid").datagrid('reload');
                                         }else {
                                             $.messager.alert("提示信息","修改失败！","warning");
                                             $("#updateNoticeTypeWindow").window("close");
                                         }
                                     }
                                 );
                            }
                        });
                    });
                </script>
            </div>
        </div>
        <div style="overflow: auto; padding: 5px;" border="false">
            <form id="updateNoticeTypeForm" method="post" action="updateNoticeRange" >
                <table class="table-edit" width="80%" align="center">
                    <tr class="title" >
                        <td colspan="2">通知范围信息</td>
                        <input type="hidden" id="noticeRangeId" name = "tzfwId"/>
                    </tr>
                    <tr class="selectFile" >
                        <td>通知范围名称</td>
                        <td>
                            <input class="easyui-textbox" name="tzfwMc" data-options="required:true">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    </s:hasPermission>

    <!-- 查询 -->
    <s:hasPermission name="noticeType-search">
    <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
        <div style="overflow:auto;padding:5px;" border="false">
            <form id="searchForm">
                <table class="table-edit" width="80%" align="center">
                    <tr class="title">
                        <td colspan="2">查询条件</td>
                    </tr>
                    <tr>
                        <td>用户名</td>
                        <td>
                            <input class="easyui-textbox" name="yhxxXm"/>
                        </td>
                    </tr>
                    <tr>
                        <td>选择部门</td>
                        <td>
                            <input  class="easyui-combobox loadBm" name="bmId" />
                        </td>
                    </tr>
                    <tr>
                    <tr>
                        <td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a> </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    </s:hasPermission>

<script type="text/javascript">
    
	function doAdd() {
        $('#addNoticeTypeWindow').window("open");
    }

    function doEdit() {
        // 获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
             $.messager.alert("提示","请选择需要修改的行","info");
             return;
        }
        if(rows.length > 1 ){
            $.messager.alert("提示","本页面是单选操作，只能选择选择一行数据更新","info");
            return;
        }
		$('#noticeRangeId').next().hide();
        $("#updateNoticeTypeForm").form("load", rows[0]);
        $('#updateNoticeTypeWindow').window("open");
    }

    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除通知范围！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的通知范围吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var approval = rows[i];
                        var id = approval.tzfwId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteNoticRangeeBatch/"+ids,function (date) {
                        if (date.error == 0) {
                            $("#grid").datagrid('load');    // 重新载入当前页面数据
                        } else {
                            $.messager.alert("提示信息","删除失败！","warning");
                        }
                    });
                }
            });
        }
    }

    function doSeacher() {
    	
		// 加载部门
		$('.loadBm').combobox({    
			url:'${pageContext.request.contextPath }' + '/back/other/loadBm',    
			valueField:'bmId',    
			textField:'bmMc'
			
		}); 
		$('#searchWindow').window("open");
		
    }

    //工具栏
    var toolbar = [
    	<s:hasPermission name="noticeType-add">
    	{
            id : 'button-add',
            text : '增加通知范围',
            iconCls : 'icon-add',
            handler : doAdd
        }, 
    	</s:hasPermission>
    	<s:hasPermission name="noticeType-update">
    	{
            id : 'button-edit',
            text : '修改通知范围',
            iconCls : 'icon-edit',
            handler : doEdit
        }, 
    	</s:hasPermission>
    	<s:hasPermission name="noticeType-delete">
    	{
            id : 'button-delete',
            text : '删除通知范围',
            iconCls : 'icon-cancel',
            handler : doDelete
        }, 
    	</s:hasPermission>
    	<s:hasPermission name="noticeType-search">
    	{
            id : 'button-search',
            text : '查询',
            iconCls : 'icon-search',
            handler : doSeacher
        } 
    	</s:hasPermission>
    ];

    //定义列
    var columns = [ [ {
        field : 'tzfwId',
        checkbox : true,
    }, {
        field : 'tzfwMc',
        title : '通知范围名称',
        width : 120,
        align : 'center'
    }] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 通知范围数据表格
        $('#grid').datagrid({
            iconCls : 'icon-forward',
            fit : true,
            border : true,
            rownumbers : true,
            striped : true,
            pageList : [ 5, 10, 15, 20 ],
            pageSize : 5,
            pagination : true,
            toolbar : toolbar,
            url : "getNoticeRangePageList",
            idField : 'tzfwId',
            columns : columns,
            fitColumns : true
        });

        // 添加
        $('#addNoticeTypeWindow').window({
            title : '添加',
            width : 600,
            modal : true,
            shadow : true,
            closed : true,
            height : 400,
            resizable : false
        });
        
        // 修改
        $('#updateNoticeTypeWindow').window({
            title : '修改',
            width : 600,
            modal : true,
            shadow : true,
            closed : true,
            height : 400,
            resizable : false
        });

        // 查询
        $('#searchWindow').window({
            title : '查询分区',
            width : 400,
            modal : true,
            shadow : true,
            closed : true,
            height : 400,
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