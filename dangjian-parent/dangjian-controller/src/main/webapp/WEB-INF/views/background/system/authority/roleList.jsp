<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/ztree.jsp"%>
<title>角色列表</title>
</head>
<body class="easyui-layout" style="visibility: hidden;">
    <div data-options="region:'center'">
        <table id="grid"></table>
    </div>
 
    <!-- 添加 -->
    <s:hasPermission name="role-add">
	    <div class="easyui-window" title="添加功能权限" id="addWindow"
	        collapsible="false" minimizable="false" maximizable="false" style="top: 80px; left: 50px">
	        <div style="height: 31px; overflow: hidden;" split="false" border="false">
	            <div class="datagrid-toolbar">
	                <a id="addRole" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
	                <script type="text/javascript">
	                    $(function() {
	                        $("#addRole").click(function() {
	                            //表单校验
	                            var r = $("#roleForm").form('validate');
	                            if (r) {
	                                //根据ztree的id获取ztree对象
	                                var treeObj = $.fn.zTree.getZTreeObj("addFunctionTree");
	                                //获取ztree上选中的角色，返回数组对象
	                                var nodes = treeObj.getCheckedNodes(true);
	                                if(nodes <= 0){
	                                    $.messager.alert("提示信息","请选择角色","warning");
	                                    return ;
	                                }
	                                var array = new Array();
	                                for(var i=0;i<nodes.length;i++){
	                                    var id = nodes[i].mkId;
	                                    array.push(id);
	                                }
	                                var ids = array.join(",");
	                                $("#qxIds").val(ids);
	                                
	                                // 提交表单
                                    $.post(
                                       "saveRole", 
                                       $("#roleForm").serializeJson(),
                                       function (date) {
                                           if(date.error == 0){
                                               $("#addWindow").window("close");
                                               $("#grid").datagrid('reload');
                                               $.fn.zTree.init($("#addFunctionTree"), setting, null);
                                               $("#roleForm").form('clear');
                                           }else {
                                               $.messager.alert("提示信息","添加失败！","warning");
                                               $("#addWindow").window("close");
                                               $.fn.zTree.init($("#addFunctionTree"), setting, null);
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
	            <form id="roleForm" method="post" action="saveRole" >
	                <table class="table-edit" width="80%" align="center">
	                    <tr class="title">
	                        <td colspan="2">角色信息</td>
	                        <input type="hidden" id="qxIds" name="qxIds"/>
	                    </tr>
	                    <tr>
	                        <td>名称:</td>
	                        <td>
	                            <input name="jsMc" class="easyui-textbox" data-options="required:true" style="width:300px" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td width="50" >关键字:</td>
	                        <td>
	                            <input name="jsCode" class="easyui-textbox" data-options="required:true" style="width:300px" />                       
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>描述：</td>
	                        <td>
	                            <input name="jsMs" class="easyui-textbox" data-options="required:true,multiline:true" style="width:300px;height:80px"></textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>授权：</td>
	                        <td>
	                            <ul id="addFunctionTree" class="ztree"></ul>
	                        </td>
	                    </tr>
	                 </table>
	            </form>
	        </div>
	    </div>
    </s:hasPermission>
    
    <!-- 修改 -->
    <s:hasPermission name="role-update">
	    <div class="easyui-window" title="添加功能权限" id="updateWindow"
	        collapsible="false" minimizable="false" maximizable="false" style="top: 80px; left: 50px">
	        <div style="height: 31px; overflow: hidden;" split="false" border="false">
	            <div class="datagrid-toolbar">
	                <a id="updateRole" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
	                <script type="text/javascript">
	                    $(function() {
	                        $("#updateRole").click(function() {
	                            //表单校验
	                            var r = $("#updateRoleForm").form('validate');
	                            if (r) {
	                                //根据ztree的id获取ztree对象
	                                var treeObj = $.fn.zTree.getZTreeObj("updateFunctionTree");
	                                //获取ztree上选中的角色，返回数组对象
	                                var nodes = treeObj.getCheckedNodes(true);
	                                if(nodes <= 0){
	                                    $.messager.alert("提示信息","请选择角色","warning");
	                                    return ;
	                                }
	                                var array = new Array();
	                                for(var i=0;i<nodes.length;i++){
	                                    var id = nodes[i].mkId;
	                                    array.push(id);
	                                }
	                                var ids = array.join(",");
	                                $("#updateQxIds").val(ids);
	                                // 提交表单
                                    $.post(
                                       "updateRole", 
                                       $("#updateRoleForm").serializeJson(),
                                       function (date) {
                                           if(date.error == 0){
                                               $("#updateWindow").window("close");
                                               $("#grid").datagrid('reload');
                                               $.fn.zTree.init($("#addFunctionTree"), setting, null);
                                           }else {
                                               $.messager.alert("提示信息","添加失败！","warning");
                                               $("#updateWindow").window("close");
                                               $.fn.zTree.init($("#addFunctionTree"), setting, null);
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
	            <form id="updateRoleForm" method="post" action="updateRole" >
	                <table class="table-edit" width="80%" align="center">
	                    <tr class="title">
	                        <td colspan="2">角色信息</td>
	                        <input type="hidden" id="updateQxIds" name="qxIds"/>
	                        <input type="hidden" id="jsId" name="jsId"/>
	                    </tr>
	                    <tr>
	                        <td>名称:</td>
	                        <td>
	                            <input name="jsMc" class="easyui-textbox" data-options="required:true" style="width:300px" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td width="50" >关键字:</td>
	                        <td>
	                            <input name="jsCode" class="easyui-textbox" data-options="required:true" style="width:300px" />                       
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>描述：</td>
	                        <td>
	                            <input name="jsMs" class="easyui-textbox" data-options="required:true,multiline:true" style="width:300px;height:80px"></textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>授权：</td>
	                        <td>
	                            <ul id="updateFunctionTree" class="ztree" data-options="required:true"></ul>
	                        </td>
	                    </tr>
	                 </table>
	            </form>
	        </div>
	    </div>
    
    </s:hasPermission>
    
    <!-- 查询 -->
    <s:hasPermission name="role-search">
	    <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
	        <div style="overflow:auto;padding:5px;" border="false">
	            <form id="searchForm">
	                <table class="table-edit" width="80%" align="center">
	                    <tr class="title">
	                        <td colspan="2">查询条件</td>
	                    </tr>
	                    <tr>
	                        <td>角色名称</td>
	                        <td>
	                            <input class="easyui-textbox" name="jsMc"/>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>角色标识</td>
	                        <td>
	                            <input class="easyui-textbox" name="jsCode"/>
	                        </td>
	                    </tr>
	                   <tr>
	                        <td>角色目描述</td>
	                        <td>
	                            <input class="easyui-textbox" name="jsMs"/>
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

    //授权树初始化
    var setting = {
        view: {
               dblClickExpand: false,//双击节点时，是否自动展开父节点的标识
               showLine: true,//是否显示节点之间的连线
               selectedMulti: true //设置是否允许同时选中多个节点
           },
          check: {enable: true,},
          data: {
              simpleData: {
                  enable: true,
                  idKey: "mkId",
                  pIdKey: "pId",
                  rootPId: 0
              }
          }
      }; 
    // 隐藏树id
    $("#qxIds").next().hide();
    $("#updateQxIds").next().hide();
    $("#jsId").next().hide();
    //添加
    function doAdd() {
        $.ajax({
            url : '../function/loadFunctionAllList',
            type : 'POST',
            dataType : 'json',
            success :function(data){
                $.fn.zTree.init($("#addFunctionTree"), setting, data);
            },
            error : function(msg){
                alert('树加载异常!');
            }
        });
         //  打开窗口
        $('#addWindow').window("open");
    }

    // 修改
    function doEdit() {
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
        var functions = null;
        // 加载该角色的数据
        $.ajax({
            url : '../function/loadFunctonListByRoleId/' + rows[0].jsId,
            type : 'POST',
            dataType : 'json',
            success :function(data){
                functions = data;
            },
            error : function(msg){
                alert('角色拥有的模块加载异常!');
            }
        });
        $("#updateRoleForm").form("load", rows[0]);
        $('#updateWindow').window("open");
        // 对树进行渲染并且进行默认勾选
        $.ajax({
            url : '../function/loadFunctionAllList',
            type : 'POST',
            dataType : 'json',
            success :function(data){
                var functionTree =   $.fn.zTree.init($("#updateFunctionTree"), setting, data);
                $.each(functions, function(i, item){
                    functionTree.checkNode( functionTree.getNodeByParam("mkId", item.functionId) , true, false);
                 });
            },
            error : function(msg){
                alert('树加载异常!');
            }
        }); 
    }

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
                        var id = rows[i].jsId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteBatchRole/"+ids,function (date) {
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

    // 查询
    function doSearch() {
        $('#searchWindow').window("open");
    }

    //工具栏
    var toolbar = [
    	<s:hasPermission name="role-add">
    	{
            id : 'button-add',
            text : "添加角色",
            iconCls : "icon-add",
            handler : doAdd
        } , 
        </s:hasPermission>
        <s:hasPermission name="role-update">
        {
            id : "button-edit",
            text : "修改角色",
            iconCls : "icon-edit",
            handler : doEdit
        } , 
        </s:hasPermission>
        <s:hasPermission name="role-delete">
        {
            id : "button-delete",
            text : "删除角色",
            iconCls : "icon-cancel",
            handler : doDelete
        } , 
        </s:hasPermission>
        <s:hasPermission name="role-search">
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
            field : 'jsId',
            checkbox : true,
        } , {
            field : 'jsMc',
            title : '名称',
            width : 200
        } , {
            field : 'jsCode',
            title : '角色标识',
            width : 200
        } , {
            field : 'jsMs',
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
            url : "getRolePageList",
            idField : 'jsId',
            columns : columns,
            fitColumns : true
        });
        
        // 添加
        $('#addWindow').window({
            title : '添加角色',
            width : 750,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        
        // 修改
        $('#updateWindow').window({
            title : '修改角色',
            width : 750,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
     
        // 查询
        $('#searchWindow').window({
            title : '查询',
            width : 750,
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
</body>
</html>