<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>远程图片列表</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/ztree.jsp"%>
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
                        <td>选择父栏目</td>
                        <td>
                          <input class="easyui-combobox firstLm" 
                            data-options="valueField:'lmId',textField:'lmMc',
                                url:'../lm/loadFirstLmList'" />
                        </td>
                    </tr>
                    <tr>
                        <td>选择子栏目</td>
                        <td>
                            <input class="easyui-combobox childrenLm" name="tpLmdm.lmId"
                                data-options="valueField:'lmId',textField:'lmMc',
                                    url:'../lm/loadChildrenLmList?id=0'"/>
                        </td>
                    </tr>
                    <tr>
                        <td>选择新闻</td>
                        <td>
                            <input  class="easyui-combobox selectNews" />
                        </td>
                    </tr>
                    <tr>
                        <td>图片显示名称</td>
                        <td>
                            <input  class="easyui-textbox" name="tpXsmc"/>
                        </td>
                    </tr>
                    <tr>
                        <td>图片绝对路径</td>
                        <td>
                            <input  class="easyui-textbox" name="tpJdlj"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a> </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

<script type="text/javascript">

    function doSearch() {
        $('#searchWindow').window("open");
    }

    //工具栏
   var toolbar = [ 
   	{
	    id : 'button-search',
	    text : '查询',
	    iconCls : 'icon-search',
	    handler : doSearch
    }];

    //定义列
    var columns = [ [ {
        field : 'tpId',
        checkbox : true
    }, {
        field : 'tpSjmc',
        title : '图片实际名称',
        width : 170,
        align : 'center'
    }, {
        field : 'tpXsmc',
        title : '图片显示名称',
        width : 170,
        align : 'center'
    }, {
        field : 'tpXdlj',
        title : '图片相对路径',
        width : 250,
        align : 'center'
    }, {
        field : 'tpJdlj',
        title : '图片绝对路径',
        width : 250,
        align : 'center'
    }] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 图片数据表格
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
            url : "pictureList",
            idField : 'tpId',
            columns : columns,
            fitColumns : true
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
        
        $(".firstLm").combobox({
            onSelect: function(rec){    
                $('.childrenLm').combobox({    
                    url:'../lm/loadChildrenLmList?id=' + rec.lmId,    
                    valueField:'lmId',    
                    textField:'lmMc'   
                });  
            }
        });
        
        $(".childrenLm").combobox({
            onSelect: function(rec){    
                $('.selectNews').combobox({    
                    url:'../loadNewsListByLmId?lmId=' + rec.lmId,    
                    valueField:'xwId',    
                    textField:'xwBt'   
                });  
            }
        });
        
    });
</script>
</body>
</html>