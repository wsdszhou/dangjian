<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>党费列表信息</title>
    <%@include file="/WEB-INF/views/include/header.jsp"%>
</head>

<body class="easyui-layout" style="visibility: hidden;">

<!-- 数据表格 -->
<div region="center" border="false">
    <table id="grid"></table>
</div>
<!-- 查询 -->
<s:hasPermission name="duesList-search">
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
                            <input class="easyui-textbox" name="yhxxXm" data-options="width:480" />
                        </td>
                    </tr>
                    <tr>
                        <td>月份</td>
                        <td>
                            <input class="easyui-textbox" name="duesMonth" data-options="width:480" />
                        </td>
                    </tr>
                    <tr>
                        <td>缴费状态:</td>
                        <td>
                            <select class="easyui-combobox" name="duesStatus" style="width: 200px;">
                                <option value="已缴费">已缴费</option>
                                <option value="未缴费">未缴费</option>
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
</s:hasPermission>

<script type="text/javascript">


    function doUndo(){
        window.location.href = "../branch/list";
    }
    
    function doNotice() {
        // 获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            $.messager.alert("提示","请选择需要修改的行","info");
            return;
        }
        if(rows.length > 1){
            $.messager.alert("提示","请选择单人","info");
        }
        else {
        var duesNotice = rows[0].duesNotice;
            if ( duesNotice == "未提醒"){
            var listIds = rows[0].listId;
            $.post("duesNotice/"+listIds)
            $.messager.alert('Warning','提醒成功');
            $("#grid").datagrid('reload');

            }
            else{
                $.messager.alert('Warning','无需再次提醒');
            }
        }

    }

    function doSearch() {
        //    打开查询窗口
        $('#searchWindow').window("open");
    }

    function doDownload() {
        $.messager.alert('Warning','暂未完成');
    }
    //工具栏
    // approvalUser-return
    var toolbar = [
        <s:hasPermission name="duesList-return">
        {
            id : 'button-add',
            text : '返回支部',
            iconCls : 'icon-undo',
            handler : doUndo
        },
        </s:hasPermission>
        <%--提醒功能   即将实现--%>
        <s:hasPermission name="duesList-notice">
        {
            id : 'button-delete',
            text : '提醒',
            iconCls : 'icon-search',
            handler : doNotice
        },
        </s:hasPermission>
        <%--查询功能 即将实现--%>
        <s:hasPermission name="duesList-search">
        {
            id : 'button-search',
            text : '查询',
            iconCls : 'icon-search',
            handler : doSearch
        },
        </s:hasPermission>
        <%--下载功能  即将实现--%>
        <s:hasPermission name="duesList-download">
        {
            id : 'button-download',
            text : '下载Excel表格',
            iconCls : 'icon-undo',
            handler : doDownload
        }
        </s:hasPermission>
    ];

    //定义列
    var columns = [ [ {
        field : 'listId',
        checkbox : true,
    }, {
        field : "yhxxXm",
        title : '用户名称',
        width : 70,
        align : 'center'
    }, {
        field : 'duesMonth',
        title : '月份',
        width : 70,
        align : 'center'
    }, {
        field : 'duesAnount',
        title : '应付',
        width : 80,
        align : 'center'
    },{
        field : 'duesStatus',
        title : '缴费情况',
        width : 80,
        align : 'center'
    }, {
        field : 'duesNotice',
        title : '提醒状态',
        width : 60,
        align : 'center'
    },{
        field : 'duesPerson',
        title : '经办人',
        width : 70,
        align : 'center'
    },{
        field : 'duesTime',
        title : '缴费时间',
        width : 120,
        align : 'center'
    },{
        field : 'collegeName',
        title : '所属学院',
        width : 120,
        align : 'center'
    },{
        field : 'branchName',
        title : '所属支部',
        width : 80,
        align : 'center'
    }
    ] ];
    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 数据表格
        $('#grid').datagrid({
            iconCls : 'icon-forward',
            fit : true,
            border : true,
            rownumbers : true,
            striped : true,
            pageList : [ 5, 10, 15, 20 ],
            pageSize : 20,
            pagination : true,
            toolbar : toolbar,

            url : "duesPageList/"+ ${branch.branchId},
            idField : 'listId',
            columns : columns,
            fitColumns : true
        });

        // 查询
        <s:hasPermission name="duesList-search">
        $('#searchWindow').window({
            title : '查询分区',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        </s:hasPermission>

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