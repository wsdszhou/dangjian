<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>支部荣誉</title>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>
    
	<!-- 添加支部荣誉 -->
    <s:hasPermission name="branchHonor-add">
        <div class="easyui-window" title="添加支部荣誉" id="addBranchHonorWindow" style="top: 100px; left: 100px" collapsible="false" minimizable="false" maximizable="false" >
            <div style="height: 31px; overflow: hidden;" split="false" border="false">
                <div class="datagrid-toolbar">
                    <a id="addBranchHonor" icon="icon-save" href="#" class="easyui-linkbutton"  plain="true">保存</a>
                    <script type="text/javascript">
                        $(function() {
                            $("#addBranchHonor").click(function() {
                                //表单校验
                                var r = $("#addBranchHonorForm").form('validate');
                                if (r) {
                                	$.post(
                                        "addBranchHonor", 
                                        $("#addBranchHonorForm").serializeJson(),
                                        function (date) {
                                            if(date.error == 0){
                                                $("#addBranchHonorWindow").window("close");
                                                $("#grid").datagrid('reload');
                                                $("#addBranchHonorForm").form('clear');
                                            }else {
                                                $.messager.alert("提示信息","发布失败！","warning");
                                                $("#addBranchHonorWindow").window("close");
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
                <form id="addBranchHonorForm" method="post" action="addBranchHonor" >
                    <table class="table-edit" width="80%" align="center">
                        <tr class="title" >
                            <td colspan="2">添加支部荣誉信息:</td>
                        </tr>
                        <tr>
                            <td width="140px">支部荣誉名称</td>
                            <td><input class="easyui-textbox" name="zbryMc" data-options="required:true,width:500" "></td>
                        </tr>
                        <tr>
                            <td>所属部门</td>
                            <td ><input id="deptNameAdd" class="easyui-combobox" data-options="required:true,width:500"  /></td>
                        </tr>
                        <tr>
                            <td>所属支部</td>
                            <td ><input id="BranchNameAdd" class="easyui-combobox" name="zbryZbdm.zbId" data-options="required:true,width:500"  /></td>
                        </tr>
                        <tr>
                            <td>支部荣誉介绍</td>
                            <td><input class="easyui-textbox" name="zbryJs" data-options="required:true, multiline:true,width:500,height:100"></td>
                        </tr>
                        <tr>
                            <td>支部荣誉图片上传</td>
                            <td>
                                <form action="uploadHonor" method="post" enctype="multipart/form-data" >
                                    <input  id="uploadFile" type="file" name="uploadFile" value="支部荣誉图片" >
                                    <input id="PictureBtn" type="button" onclick="pictureUpload()" value="上传图片">
                                </form>
                                <input id="addBranchHonorPicture" type="hidden" name="zbryTp">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <div style="width: 100px;height: 100px;">
                                    <img id="displayPicture" alt="" style="width: 100px;" src="" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

    </s:hasPermission>

	<!--  修改支部荣誉 -->
    <s:hasPermission name="branchHonor-update">
        <div class="easyui-window" title="修改支部荣誉" id="updateBranchHonorWindow" style="top: 100px; left: 100px" collapsible="false" minimizable="false" maximizable="false" >
            <div style="height: 31px; overflow: hidden;" split="false" border="false">
                <div class="datagrid-toolbar">
                    <a id="updateBranchHonor" icon="icon-save" href="#" class="easyui-linkbutton"  plain="true">保存</a>
                    <script type="text/javascript">
                        $(function() {
                            $("#updateBranchHonor").click(function() {
                                //表单校验
                            	$.post(
                                    "editBranchHonor", 
                                    $("#updateBranchHonorForm").serializeJson(),
                                    function (date) {
                                        if(date.error == 0){
                                            $("#updateBranchHonorWindow").window("close");
                                            $("#grid").datagrid('reload');
                                        }else {
                                            $.messager.alert("提示信息","发布失败！","warning");
                                            $("#updateBranchHonorWindow").window("close");
                                        }
                                    }
                                 );
                            });
                        });
                    </script>
                </div>
            </div>
            <div style="overflow: auto; padding: 5px;" border="false">
                <form id="updateBranchHonorForm" method="post" action="editBranchHonor" >
                    <table class="table-edit" width="80%" align="center">
                        <tr class="title" >
                            <td colspan="2">添加支部荣誉信息:</td>
                            <input id="bmId" type="hidden" name="zbryId">
                        </tr>
                        <tr>
                            <td width="140px">支部荣誉名称</td>
                            <td><input class="easyui-textbox" name="zbryMc" data-options="required:true,width:500" "></td>
                        </tr>
                        <tr>
                            <td>所属部门</td>
                            <td ><input id="deptNameUpdate" class="easyui-combobox" data-options="required:true,width:500"  /></td>
                        </tr>
                        <tr>
                            <td>所属支部</td>
                            <td ><input id="BranchNameUpdate" class="easyui-combobox" name="zbryZbdm.zbId" data-options="required:true,width:500"  /></td>
                        </tr>
                        <tr>
                            <td>支部荣誉介绍</td>
                            <td><input class="easyui-textbox" name="zbryJs" data-options="required:true, multiline:true,width:500,height:100"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </s:hasPermission>
    
    <!-- 查询 -->
    <s:hasPermission name="branchHonor-search">
        <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
            <div style="overflow:auto;padding:5px;" border="false">
                <form id="searchForm">
                    <table class="table-edit" width="80%" align="center">
                        <tr class="title">
                            <td colspan="2">查询条件</td>
                        </tr>
                        <tr>
                            <td width="140px">荣誉名称</td>
                            <td><input  class="easyui-textbox" name="zbryMc" data-options="width:500" /></td>
                        </tr>
                        <tr>
                            <td>所属部门</td>
                            <td ><input id="deptNameSearch" class="easyui-combobox" data-options="required:true,width:500"  /></td>
                        </tr>
                        <tr>
                            <td>所属支部名称</td>
                            <td><input id="BranchNameSearch" class="easyui-combobox" name="zbryZbdm.zbId" data-options="width:500"  /></td>
                        </tr>
                        <tr>
                            <td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a> </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </s:hasPermission>

</body>
<script>
    // 图片上传
    function pictureUpload() {
		var formdata=new FormData();
	    formdata.append('uploadFile',$('#uploadFile').get(0).files[0]);
	    $.ajax({
	        url:'uploadHonor',
	        type:'post',
	        data:formdata,
	        contentType:false,
	        processData:false,
	        async:false,
	        success:function(data){ 
	            $("#displayPicture").attr('src',data.data.src)
	            $("#addBranchHonorPicture").val(data.data.src);
	        	
	        },
	        error:function(err){
	            $.messager.alert("提示","上传失败","info");
	        }
	    });
	};
	
	var isLoadDept = false;
    // 添加
    <s:hasPermission name="branchHonor-add">
    function doAdd() {
        // 加载部门
        $('#deptNameAdd').combobox({
            url:'../../department/loadBm',
            valueField:'bmId',
            textField:'bmMc' ,
            onLoadSuccess: function(){
                var val = $(this).combobox('getData');
                $(this).combobox("select", val[0].bmId);
            },
            onSelect: function(rec){
                if (isLoadDept == true) {
                    $('#BranchNameAdd').combobox({
                        url:'../loadBranch/' + rec.bmId,
                        valueField:'zbId',
                        textField:'zbMc'
                    });
                }
            }
        });
        // 加载支部
        $('#BranchNameAdd').combobox({
            url:'../loadBranch/-1',
            valueField:'zbId',
            textField:'zbMc' ,
            onLoadSuccess: function(){
                isLoadDept = true;
                var val = $(this).combobox('getData');
                $(this).combobox("select", val[0].zbId);
            }
        });


        $('#addBranchHonorWindow').window("open");
    }
    </s:hasPermission>


    <s:hasPermission name="branchHonor-update">
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
        // 加载部门
        $('#deptNameUpdate').combobox({
            url:'../../department/loadBm',
            valueField:'bmId',
            textField:'bmMc' ,
            onLoadSuccess: function(){
                var val = $(this).combobox('getData');
                for(var item=0;item < val.length;item++ ){
                    if ( val[item].bmMc == rows[0].zbryZbdm.zbSsbmdm.bmMc) {
                        $(this).combobox("select", val[item].bmId);
                    }
                };
            },
            onSelect: function(rec){
                $('#BranchNameAdd').combobox({
                    url:'../loadBranch/' + rec.bmId,
                    valueField:'zbId',
                    textField:'zbMc' ,
                    onLoadSuccess: function(){
                        var val = $(this).combobox('getData');
                        for(var item=0;item < val.length;item++ ){
                            if ( val[item].zbMc == rows[0].zbryZbdm.zbMc) {
                                $(this).combobox("select", val[item].zbId);
                            }
                        };
                    }
                });
            }
        });
        // 加载支部
        $('#BranchNameUpdate').combobox({
            url:'../loadBranch/-1',
            valueField:'zbId',
            textField:'zbMc' ,
            onLoadSuccess: function(){
                isLoadDept = true;
                var val = $(this).combobox('getData');
                for(var item=0;item < val.length;item++ ){
                    if ( val[item].zbMc == rows[0].zbryZbdm.zbMc) {
                        $(this).combobox("select", val[item].zbId);
                    }
                };
            }
        });
        $("#zbryId").next().hide();
        $("#updateBranchHonorForm").form("load", rows[0]);
        $('#updateBranchHonorWindow').window("open");
    }
    </s:hasPermission>


    <s:hasPermission name="branchHonor-delete">
    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除审批支部荣誉！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的审批支部荣誉吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var BranchHonor = rows[i];
                        var id = BranchHonor.zbryId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteBranchHonor/"+ids,function (date) {
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
    </s:hasPermission>


    <s:hasPermission name="branchHonor-search">
    function doSearch() {
        // 加载部门
        $('#deptNameSearch').combobox({
            url:'../../department/loadBm',
            valueField:'bmId',
            textField:'bmMc' ,
            onSelect: function(rec){
                $('#BranchNameSearch').combobox({
                    url:'../loadBranch/' + rec.bmId,
                    valueField:'zbId',
                    textField:'zbMc'
                });
            }
        });
        // 加载支部
        $('#BranchNameSearch').combobox({
            url:'../loadBranch/-1',
            valueField:'zbId',
            textField:'zbMc'
        });
        $('#searchWindow').window("open");
    }
    </s:hasPermission>

    
  //工具栏
    var toolbar = [
        <s:hasPermission name="branchHonor-add">
        {
            id : 'button-add',
            text : '增加支部荣誉',
            iconCls : 'icon-add',
            handler : doAdd
        },
        </s:hasPermission>

        <s:hasPermission name="branchHonor-update">
        {
            id : 'button-edit',
            text : '修改支部荣誉',
            iconCls : 'icon-edit',
            handler : doEdit
        },
        </s:hasPermission>

        <s:hasPermission name="branchHonor-delete">
        {
            id : 'button-delete',
            text : '删除支部荣誉',
            iconCls : 'icon-cancel',
            handler : doDelete
        },
        </s:hasPermission>

        <s:hasPermission name="branchHonor-search">
        {
            id : 'button-search',
            text : '查询',
            iconCls : 'icon-search',
            handler : doSearch
        }
        </s:hasPermission>
        ];
  
    //定义列
    var columns = [ [ {
        field : 'zbryId',
        checkbox : true,
    },{
        field:'zbryMc',
        title:'支部荣誉名称',
        width : 200
    },{
        field:'zbMc',
        title:'所属支部',
        width : 200
    },{
        field:'zbryJs',
        title:'支部荣誉介绍',
        width : 500
    }] ];
  
    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 支部荣誉表格
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
            url : "getBranchHonorList" ,
            idField : 'zbryId',
            columns : columns,
            fitColumns : true
        });

        // 添加
        <s:hasPermission name="branchHonor-add">
        $('#addBranchHonorWindow').window({
            title : '添加支部荣誉',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        </s:hasPermission>

        
        //
        <s:hasPermission name="branchHonor-update">
        $('#updateBranchHonorWindow').window({
            title : '修改支部荣誉',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        </s:hasPermission>

        
        // 查询
        <s:hasPermission name="branchHonor-search">
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
</html>
