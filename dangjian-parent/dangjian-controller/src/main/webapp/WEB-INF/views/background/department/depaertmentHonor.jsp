<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>部门荣誉荣誉</title>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>
    
	<!-- 添加部门荣誉 -->
    <s:hasPermission name="deptHonor-add">
        <div class="easyui-window" title="添加部门荣誉" id="addDeptHonorWindow" style="top: 100px; left: 100px" collapsible="false" minimizable="false" maximizable="false" >
            <div style="height: 31px; overflow: hidden;" split="false" border="false">
                <div class="datagrid-toolbar">
                    <a id="addDeptHonor" icon="icon-save" href="#" class="easyui-linkbutton"  plain="true">保存</a>
                    <script type="text/javascript">
                        $(function() {
                            $("#addDeptHonor").click(function() {
                                //表单校验
                                var r = $("#addDeptHonorForm").form('validate');
                                if (r) {
                                	$.post(
                                        "addDeptHonor", 
                                        $("#addDeptHonorForm").serializeJson(),
                                        function (date) {
                                            if(date.error == 0){
                                                $("#addDeptHonorWindow").window("close");
                                                $("#grid").datagrid('reload');
                                                $("#addDeptHonorForm").form('clear');
                                            }else {
                                                $.messager.alert("提示信息","发布失败！","warning");
                                                $("#addDeptHonorWindow").window("close");
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
                <form id="addDeptHonorForm" method="post" action="addDeptHonor" >
                    <table class="table-edit" width="80%" align="center">
                        <tr class="title" >
                            <td colspan="2">添加部门荣誉信息:</td>
                        </tr>
                        <tr>
                            <td width="140px">部门荣誉名称</td>
                            <td><input class="easyui-textbox" name="bmryMc" data-options="required:true,width:500" "></td>
                        </tr>
                        <tr>
                            <td>所属部门</td>
                            <td ><input id="deptNmaeAdd" class="easyui-combobox" name="bmryBmdm.bmId" data-options="required:true,width:500"  /></td>
                        </tr>
                        <tr>
                            <td>部门荣誉介绍</td>
                            <td><input class="easyui-textbox" name="bmryJs" data-options="required:true, multiline:true,width:500,height:100"></td>
                        </tr>
                        <tr>
                            <td>部门荣誉图片上传</td>
                            <td>
                                <form action="uploadHonor" method="post" enctype="multipart/form-data" >
                                    <input  id="uploadFile" type="file" name="uploadFile" value="部门荣誉图片" >
                                    <input id="PictureBtn" type="button" onclick="pictureUpload()" value="上传图片">
                                </form>
                                <input id="addbmryPicture" type="hidden" name="bmryTp">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <div style="width: 100px;height: 100px;">
                                    <img style="width: 100px;" id="displayPicture" alt="" src="" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </s:hasPermission>

	<!--  修改部门荣誉 -->
    <s:hasPermission name="deptHonor-update">
        <div class="easyui-window" title="修改部门荣誉" id="updateDeptHonorWindow" style="top: 100px; left: 100px" collapsible="false" minimizable="false" maximizable="false" >
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="updateDeptHonor" icon="icon-save" href="#" class="easyui-linkbutton"  plain="true">保存</a>
                <script type="text/javascript">
                    $(function() {
                        $("#updateDeptHonor").click(function() {
                            //表单校验
                            var r = $("#updateDeptHonorForm").form('validate');
                            if (r) {
                            	$.post(
                                    "editDeptHonor", 
                                    $("#updateDeptHonorForm").serializeJson(),
                                    function (date) {
                                        if(date.error == 0){
                                            $("#updateDeptHonorWindow").window("close");
                                            $("#grid").datagrid('reload');
                                        }else {
                                            $.messager.alert("提示信息","发布失败！","warning");
                                            $("#updateDeptHonorWindow").window("close");
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
            <form id="updateDeptHonorForm" method="post" action="editDeptHonor" >
                <table class="table-edit" width="80%" align="center">
                    <tr class="title" >
                        <td colspan="2">添加部门荣誉信息:</td>
                        <input id="bmId" type="hidden" name="bmryId">
                    </tr>
                    <tr>
                        <td width="140px">部门荣誉名称</td>
                        <td><input class="easyui-textbox" name="bmryMc" data-options="required:true,width:500" "></td>
                    </tr>
                    <tr>
                        <td>所属部门</td>
                        <td ><input id="deptNmaeUpdate" class="easyui-combobox" name="bmryBmdm.bmId" data-options="required:true,width:500"  /></td>
                    </tr>
                    <tr>
                        <td>部门荣誉介绍</td>
                        <td><input class="easyui-textbox" name="bmryJs" data-options="required:true, multiline:true,width:500,height:100"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    </s:hasPermission>

    <!-- 查询 -->
    <s:hasPermission name="deptHonor-search">
        <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
            <div style="overflow:auto;padding:5px;" border="false">
                <form id="searchForm">
                    <table class="table-edit" width="80%" align="center">
                        <tr class="title">
                            <td colspan="2">查询条件</td>
                        </tr>
                        <tr>
                            <td width="140px">荣誉名称</td>
                            <td><input  class="easyui-textbox" name="bmryMc" data-options="width:500" /></td>
                        </tr>
                        <tr>
                            <td>所属部门名称</td>
                            <td><input id="deptNmaeSercch" class="easyui-combobox" name="bmryBmdm.bmId" data-options="width:500"  /></td>
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
	            $("#addbmryPicture").val(data.data.src);
	        },
	        error:function(err){
	            $.messager.alert("提示","上传失败","info");
	        }
	    });
	};
	
    // 添加
    <s:hasPermission name="deptHonor-add">
    function doAdd() {
        // 加载部门
        $('#deptNmaeAdd').combobox({
            url:'../loadBm',
            valueField:'bmId',
            textField:'bmMc' ,
            onLoadSuccess: function(){
                var val = $(this).combobox('getData');
                $(this).combobox("select", val[0].bmId);
            }
        });
        $('#addDeptHonorWindow').window("open");
    }
    </s:hasPermission>


    <s:hasPermission name="deptHonor-update">
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
        $('#deptNmaeUpdate').combobox({
            url:'../loadBm',
            valueField:'bmId',
            textField:'bmMc',
            onLoadSuccess: function(){
                var val = $(this).combobox('getData');
                for(var item=0;item < val.length;item++ ){
                    if ( val[item].bmMc == rows[0].bmMc) {
                        $(this).combobox("select", val[item].bmId);
                    }
                };
            }

        });
        $("#bmryId").next().hide();
        $("#updateDeptHonorWindow").form("load", rows[0]);
        $('#updateDeptHonorWindow').window("open");
    }
    </s:hasPermission>


    <s:hasPermission name="deptHonor-delete">
    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除审批部门荣誉！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的审批部门荣誉吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var deptHonor = rows[i];
                        var id = deptHonor.bmryId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteDeptHonor/"+ids, function (date) {
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


    <s:hasPermission name="deptHonor-search">
    function doSearch() {
        // 加载部门
        $('#deptNmaeSercch').combobox({
            url:'../loadBm',
            valueField:'bmId',
            textField:'bmMc'
        });
        $('#searchWindow').window("open");
    }
    </s:hasPermission>

    
  //工具栏
    var toolbar = [
        <s:hasPermission name="deptHonor-add">
        {
            id : 'button-add',
            text : '增加部门荣誉',
            iconCls : 'icon-add',
            handler : doAdd
        },
        </s:hasPermission>

        <s:hasPermission name="deptHonor-update">
        {
            id : 'button-edit',
            text : '修改部门荣誉',
            iconCls : 'icon-edit',
            handler : doEdit
        },
        </s:hasPermission>

        <s:hasPermission name="deptHonor-delete">
        {
            id : 'button-delete',
            text : '删除部门荣誉',
            iconCls : 'icon-cancel',
            handler : doDelete
        },
        </s:hasPermission>

        <s:hasPermission name="deptHonor-search">
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
        field : 'bmryId',
        checkbox : true,
    },{
        field:'bmryMc',
        title:'部门荣誉名称',
        width : 200
    },{
        field:'bmMc',
        title:'所属部门',
        width : 200
    },{
        field:'bmryJs',
        title:'部门荣誉介绍',
        width : 500
    }] ];
  
    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 部门荣誉表格
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
            url : "getDeptHonorList" ,
            idField : 'bmryId',
            columns : columns,
            fitColumns : true
        });

        // 添加
        <s:hasPermission name="deptHonor-add">
        $('#addDeptHonorWindow').window({
            title : '添加部门荣誉',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        </s:hasPermission>

        
        //
        <s:hasPermission name="deptHonor-update">
        $('#updateDeptHonorWindow').window({
            title : '修改部门荣誉',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        </s:hasPermission>

        
        // 查询
        <s:hasPermission name="deptHonor-search">
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
