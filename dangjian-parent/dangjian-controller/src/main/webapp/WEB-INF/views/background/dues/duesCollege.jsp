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


<script type="text/javascript">

    function doObserve() {
        //获取数据表格中选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            $.messager.alert("提示","请选择单个学院","info");
            return;
        }
        if(rows.length > 1 ){
            $.messager.alert("提示","本页面是单选操作，只能选择选择一行数据更新","info");
            return;
        }
        var gwid = rows[0].collegeId;
        // 新开一个页面
        var tabsObj = parent.$('#tabs');
        var title = rows[0].collegeName;
        if ( tabsObj.tabs('exists', title)){
            tabsObj.tabs('select', title);
        } else {
            var newsContentPage = '<iframe src="/dangjian-controller/back/dues/branchList/' + gwid +'"  scrolling="auto"  frameborder="0" style="width:100%;height:100%;"><h1>123456</h1></iframe>';
            tabsObj.tabs('add',{
                title:title,
                content:newsContentPage,
                closable:true
            });

        }
    }

    //工具栏
    var toolbar = [
        <s:hasPermission name="approvalJob-searchUser">
        {
            id : 'button-delete',
            text : '查看学院信息',
            iconCls : 'icon-search',
            handler : doObserve
        }
        </s:hasPermission>
    ];

    //定义列
    var columns = [ [ {
        field : 'collegeId',
        checkbox : true,
    }, {
        field : 'collegeName',
        title : '部门名称',
        width : 120,
        align : 'center'
    }, {
        field : 'collegeNum',
        title : '党员总人数',
        width : 120,
        align : 'center'
    }, {
        field : 'collegeRate',
        title : '当月党费缴纳比例',
        width : 80,
        align : 'center'
    }
    ] ];
    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 学院数据表格
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
            url : "duesCollegePageList",
            idField : 'tpId',
            columns : columns,
            fitColumns : true
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