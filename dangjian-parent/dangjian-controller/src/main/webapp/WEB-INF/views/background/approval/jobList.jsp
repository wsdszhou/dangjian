<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审批岗位列表</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>

    <!-- 添加 -->
    <s:hasPermission name="approvalJob-add">
	    <div class="easyui-window" title="添加审批岗位" id="addApprovalJobWindow"
	        collapsible="false" minimizable="false" maximizable="false"
	        style="top: 20px; left: 50px">
	        <div style="height: 31px; overflow: hidden;" split="false" border="false">
	            <div class="datagrid-toolbar">
	                <a id="addApprovalJob" icon="icon-save" href="#" class="easyui-linkbutton"
	                    plain="true">保存</a>
	                <script type="text/javascript">
	                    $(function() {
	                        $("#addApprovalJob").click(function() {
	                            //表单校验
	                            var r = $("#addApprovalJobJobForm").form('validate');
	                            if (r) {
	                            	$.post(
                                        "saveApproval", 
                                        $("#addApprovalJobJobForm").serializeJson(),
                                        function (date) {
                                            if(date.error == 0){
                                                $("#addApprovalJobWindow").window("close");
                                                $("#grid").datagrid('reload');
                                                $("#addApprovalJobJobForm").form('clear');
                                            }else {
                                                $.messager.alert("提示信息","发布失败！","warning");
                                                $("#addApprovalJobWindow").window("close");
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
	            <form id="addApprovalJobJobForm" method="post" action="saveApproval" >
	                <table class="table-edit" width="80%" align="center">
	                    <tr class="title" >
	                        <td colspan="2">审批岗位信息</td>
	                    </tr>
	                    <tr class="selectFile" >
	                        <td>审批岗位名称</td>
	                        <td>
	                            <input class="easyui-textbox" name="spgwSpgwmc" data-options="required:true,width:500">
	                        </td>
	                    </tr>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
    </s:hasPermission>
    
   <!--   修改 -->
    <s:hasPermission name="approvalJob-update">
	    <div class="easyui-window" title="修改审批岗位" id="updateApprovalJobWindow"
	        collapsible="false" minimizable="false" maximizable="false"
	        style="top: 20px; left: 50px">
	        <div style="height: 31px; overflow: hidden;" split="false" border="false">
	            <div class="datagrid-toolbar">
	                <a id="updateApprovalJob" icon="icon-save" href="#" class="easyui-linkbutton"
	                    plain="true">保存</a>
	                <script type="text/javascript">
	                    $(function() {
	                        $("#updateApprovalJob").click(function() {
	                            //表单校验
	                            var r = $("#updateApprovalJobForm").form('validate');
	                            if (r) {
	                            	$.post(
                                        "updateApprovalJob", 
                                        $("#updateApprovalJobForm").serializeJson(),
                                        function (date) {
                                            if(date.error == 0){
                                                $("#updateApprovalJobWindow").window("close");
                                                $("#grid").datagrid('reload');
                                            }else {
                                                $.messager.alert("提示信息","发布失败！","warning");
                                                $("#updateApprovalJobWindow").window("close");
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
	            <form id="updateApprovalJobForm" method="post" action="updateApprovalJob" >
	                <table class="table-edit" width="80%" align="center">
	                    <tr class="title" >
	                        <td colspan="2">审批岗位信息</td>
	                        <input type="hidden" name = "spgwId"/>
	                    </tr>
	                    <tr class="selectFile" >
	                        <td>审批岗位名称</td>
	                        <td>
	                            <input class="easyui-textbox" name="spgwSpgwmc" data-options="required:true,width:500">
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
    </s:hasPermission>
 
<script type="text/javascript">
    function doAdd() {
        $('#addApprovalJobWindow').window("open");
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
        $("#updateApprovalJobForm").form("load", rows[0]);
        $('#updateApprovalJobWindow').window("open");
    }

    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除审批岗位！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的审批岗位吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var approval = rows[i];
                        var id = approval.spgwId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteApprovalJobBatch/"+ids, function (date) {
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

    function doObserve() {
        //获取数据表格中选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
             $.messager.alert("提示","请选择需要修改的行","info");
             return;
        }
        if(rows.length > 1 ){
            $.messager.alert("提示","本页面是单选操作，只能选择选择一行数据更新","info");
            return;
        }
        var gwid = rows[0].spgwId;
        // 新开一个页面
        var tabsObj = parent.$('#tabs');
        var title = rows[0].spgwSpgwmc;
        if ( tabsObj.tabs('exists', title)){
            tabsObj.tabs('select', title);
        } else {
            var newsContentPage = '<iframe src="/dangjian-controller/back/approval/jobUserList/' + gwid +'"  scrolling="auto"  frameborder="0" style="width:100%;height:100%;"><h1>123456</h1></iframe>';
            tabsObj.tabs('add',{
                title:title,
                content:newsContentPage,
                closable:true
            });

        }
    }

    //工具栏
    var toolbar = [
    	<s:hasPermission name="approvalJob-add">
	    	{
	            id : 'button-add',
	            text : '增加岗位',
	            iconCls : 'icon-add',
	            handler : doAdd
	        },
        </s:hasPermission>
         <s:hasPermission name="approvalJob-update">
	        {
	            id : 'button-edit',
	            text : '修改岗位',
	            iconCls : 'icon-edit',
	            handler : doEdit
	        }, 
        </s:hasPermission>
        <s:hasPermission name="approvalJob-delete">
	        {
	            id : 'button-delete',
	            text : '删除岗位',
	            iconCls : 'icon-cancel',
	            handler : doDelete
	        }, 
        </s:hasPermission>
        <s:hasPermission name="approvalJob-searchUser">
	        {
	            id : 'button-delete',
	            text : '查看岗位人员管理',
	            iconCls : 'icon-search',
	            handler : doObserve
	        } 
        </s:hasPermission> 
    ];

    //定义列
    var columns = [ [ {
        field : 'spgwId',
        checkbox : true
    }, {
        field : 'spgwSpgwmc',
        title : '审批岗位名称',
        width : 170,
        align : 'center'
    }] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 审批岗位数据表格
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
            url : "approvalJobPageList",
            idField : 'tpId',
            columns : columns,
            fitColumns : true
        });

        // 添加
        $('#addApprovalJobWindow').window({
            title : '添加',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        
        // 修改
        $('#updateApprovalJobWindow').window({
            title : '修改',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 800,
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