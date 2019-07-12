<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/ztree.jsp"%>
<title>权限列表</title>
</head>
<body  class="easyui-layout" style="visibility: hidden;">
    <div data-options="region:'center'">
        <table id="grid"></table>
    </div>
    <s:hasPermission name="function-add">
    <!-- 添加 -->
    <div class="easyui-window" title="添加功能权限" id="addWindow"
        collapsible="false" minimizable="false" maximizable="false" style="top: 80px; left: 50px">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="addFunction" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
                <script type="text/javascript">
                    $(function() {
                        $("#addFunction").click(function() {
                            //表单校验
                            var r = $("#FunctionForm").form('validate');
                            if (r) {
                            	$.post(
                                    "saveFunction", 
                                    $("#FunctionForm").serializeJson(),
                                    function (date) {
                                        if(date.error == 0){
                                            $("#addWindow").window("close");
                                            $("#grid").datagrid('reload');
                                            $("#FunctionForm").form('clear');
                                        }else {
                                            $.messager.alert("提示信息","发布失败！","warning");
                                            $("#addWindow").window("close");
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
            <form id="FunctionForm" method="post" action="saveFunction" >
                <table class="table-edit" width="80%" align="center">
                    <tr class="title">
                        <td colspan="2">功能权限信息</td>
                    </tr>
                    <tr>
                        <td>名称:</td>
                        <td>
                            <input name="mkMc" class="easyui-textbox" data-options="required:true" style="width:300px" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100" >关键字:</td>
                        <td>
                            <input name="mkCode" class="easyui-textbox" data-options="required:true" style="width:300px" />                       
                        </td>
                    </tr>
                    <tr>
                        <td>是否菜单:</td>
                        <td>
                            <select name="mkSfsccd" class="easyui-combobox" data-options="required:true" style="width:300px">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>菜单优先级（0为顶级）:</td>
                        <td>
                            <input type="text" name="mkPx" class="easyui-numberbox" data-options="required:true" style="width:300px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>路径URL:</td>
                        <td>
                            <input name="mkUrl" class="easyui-textbox" data-options="required:false" style="width:300px" />
                        </td>
                    </tr>
                    <tr>
                        <td>图标:</td>
                        <td>
                            <input name="mkIcon" class="easyui-textbox" data-options="required:false" style="width:300px" />
                        </td>
                    </tr>
                    <tr>
                        <td>父功能点:</td>
                        <td>
                             <input class="easyui-combotree" id="fatherTree" data-options="required:true" name="mkFId"style="width:300px">
                        </td>
                    </tr>
                    <tr>
                        <td>描述：</td>
                        <td>
                            <input name="mkMs" class="easyui-textbox" data-options="required:true,multiline:true" style="width:300px;height:80px"></textarea>
                        </td>
                    </tr>
                 </table>
            </form>
        </div>
    </div>
    </s:hasPermission>
    
    <s:hasPermission name="function-update">
    <!-- 修改 -->
	<div class="easyui-window" title="修改功能权限" id="updateWindow"
        collapsible="false" minimizable="false" maximizable="false"
        style="top: 20px; left: 50px">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="updateFunction" icon="icon-save" href="#" class="easyui-linkbutton"
                    plain="true">保存</a>
                <script type="text/javascript">
                    $(function() {
                        $("#updateFunction").click(function() {
                            //表单校验
                            var r = $("#updateFunctionForm").form('validate');
                            if (r) {
                            	$.post(
                                     "updateFunction", 
                                     $("#updateFunctionForm").serializeJson(),
                                     function (date) {
                                         if(date.error == 0){
                                             $("#updateWindow").window("close");
                                             $("#grid").datagrid('reload');
                                         }else {
                                             $.messager.alert("提示信息","发布失败！","warning");
                                             $("#updateWindow").window("close");
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
            <form id="updateFunctionForm" method="post" action="updateFunction" >
                <input type="hidden" id="functionId" name="mkId" data-options="'readonly':true"/>
				<table class="table-edit" width="80%" align="center">
                    <tr class="title">
						<td colspan="2">功能权限信息</td>
					</tr>
					<tr>
						<td>名称:</td>
						<td>
							<input name="mkMc" class="easyui-textbox" data-options="required:true" style="width:300px" />
						</td>
					</tr>
					<tr>
						<td width="100" >关键字:</td>
						<td>
							<input name="mkCode" class="easyui-textbox" data-options="required:true" style="width:300px" />                       
						</td>
					</tr>
					<tr>
						<td>是否菜单:</td>
						<td>
							<select name="mkSfsccd" class="easyui-combobox" data-options="required:true" style="width:300px">
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>菜单优先级（0为顶级）:</td>
						<td>
							<input type="text" name="mkPx" class="easyui-numberbox" data-options="required:true" style="width:300px"/>
						</td>
					</tr>
					<tr>
						<td>路径URL:</td>
						<td>
							<input name="mkUrl" class="easyui-textbox" data-options="required:false" style="width:300px" />
						</td>
					</tr>
					<tr>
						<td>图标:</td>
						<td>
							<input name="mkIcon" class="easyui-textbox" data-options="required:false" style="width:300px" />
						</td>
					</tr>
					<tr>
						<td>父功能点:</td>
						<td>
							 <input class="easyui-combotree" id="upadteFatherTree" name="mkFId"style="width:300px">
						</td>
					</tr>
					<tr>
						<td>描述：</td>
						<td>
							<input name="mkMs" class="easyui-textbox" data-options="required:true,multiline:true" style="width:300px;height:80px"></textarea>
						</td>
					</tr>
                </table>
            </form>
        </div>
    </div>
    </s:hasPermission>
    
    <s:hasPermission name="function-search">
    <!-- 查询 -->
    <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
        <div style="overflow:auto;padding:5px;" border="false">
            <form id="searchForm">
                <table class="table-edit" width="80%" align="center">
                    <tr class="title">
                        <td colspan="2">查询条件</td>
                    </tr>
                    <tr>
                        <td>名称:</td>
                        <td>
                            <input name="mkMc" class="easyui-textbox"  style="width:300px" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100" >关键字:</td>
                        <td>
                            <input name="mkCode" class="easyui-textbox" style="width:300px" />                       
                        </td>
                    </tr>
                    <tr>
                        <td>是否为菜单:</td>
                        <td>
                            <select name="mkSfsccd" class="easyui-combobox" style="width:300px">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>优先级:</td>
                        <td>
                            <input type="text" name="mkPx" class="easyui-numberbox" style="width:300px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>父功能点:</td>
                        <td>
                             <input class="easyui-combotree" id="searchFatherTree" name="mkFId"style="width:300px">
                        </td>
                    </tr>
                    <tr>
                        <td>描述：</td>
                        <td>
                            <input name="mkMs" class="easyui-textbox" data-options="multiline:true" style="width:300px;height:80px"></textarea>
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
	//添加
	function doAdd() {
		$('#fatherTree').combotree({
		    url: 'getFunctionAllList',
		    required: true
		});
	     //  打开窗口
	    $('#addWindow').window("open");
	}; 

	// 修改
	function doEdit() {
		// 加载树
		$('#upadteFatherTree').combotree({
            url: 'getFunctionAllList',
            required: true
        });
		//获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
             $.messager.alert("提示","请选择需要修改的行","info");
             return;
        }
        if(rows.length > 1 ){
            $.messager.alert("提示","本页面是单选操作，只能选择选择一行数据更新","info");
            return;
        }
        // 隐藏id
        //$("#functionId").next().hide();
        // 加载默认值
        $("#updateWindow").form("load", rows[0]);
		 //  打开窗口
        $('#updateWindow').window("open");
	};

	// 删除
	function doDelete() {
		//获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除选项！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的选项吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var id = rows[i].mkId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteBacthFunction/"+ids,function (date) {
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
	
	// 查询
	function doSearch() {
		// 加载树
        $('#searchFatherTree').combotree({
            url: 'getFunctionAllList',
            required: true
        });
        //  打开窗口
        $('#searchWindow').window("open");
		
	};

	//工具栏
	var toolbar = [
	<s:hasPermission name="function-add">
		{
	    id : 'button-add',
	    text : "添加功能权限",
	    iconCls : "icon-add",
	    handler : doAdd
	} ,
	</s:hasPermission>
	<s:hasPermission name="function-update">
	{
	    id : "button-edit",
	    text : "修改功能权限",
	    iconCls : "icon-edit",
	    handler : doEdit
	} ,
	</s:hasPermission>
	<s:hasPermission name="function-delete">
	{
	    id : "button-delete",
	    text : "删除功能权限",
	    iconCls : "icon-cancel",
	    handler : doDelete
	} ,
	</s:hasPermission>
	<s:hasPermission name="function-search">
	{
	    id : 'button-delete',
	    text : '查询',
	    iconCls : 'icon-search',
	    handler : doSearch
	}
	</s:hasPermission>
	];

	//定义列
	var columns = [[{
	        field : 'mkId',
	        checkbox : true,
	    } , {
	        field : 'mkMc',
	        title : '名称',
	        width : 100
	    } , {
	        field : 'mkCode',
	        title : '功能权限标识',
	        width : 80
	    } , {
            field : 'mkSfsccd',
            title : '是否为菜单',
            width : 80,
            formatter : function(data,row, index){
                if(data=="1"){
                    return "是";
                }else{
                    return "否";
                }
            }
        }, {
            field : 'mkPx',
            title : '优先级',
            width : 50
        }, {
            field : 'mkIcon',
            title : '图标',
            width : 50
        }, {
            field : 'mkUrl',
            title : '路径',
            width : 200
        } , {
            field : 'mkMs',
            title : '描述',
            width : 200
        }
	]];

	$(function(){
		
		// 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });
		
	    // 数据表格属性
		$("#grid").datagrid({
		    iconCls : 'icon-forward',
		    fit : true,
		    border : true,
		    rownumbers : true,
		    striped : true,
		    pageList : [ 5, 10, 15, 20 ],
		    pageSize : 20,
		    pagination : true,
		    toolbar : toolbar,
		    url : "getFunctionPageList",
		    idField : 'mkId',
		    columns : columns,
		    fitColumns : true
		});
		
		// 添加
	    $('#addWindow').window({
		    title : '添加功能权限',
		    width : 700,
		    modal : true,
		    shadow : true,
		    closed : true,
		    height : 550,
		    resizable : false
		});
		
	     // 修改
        $('#updateWindow').window({
            title : '修改功能权限',
            width : 700,
            modal : true,
            shadow : true,
            closed : true,
            height : 550,
            resizable : false
        });
		
	     
     // 修改
        $('#searchWindow').window({
            title : '查询功能权限',
            width : 700,
            modal : true,
            shadow : true,
            closed : true,
            height : 500,
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