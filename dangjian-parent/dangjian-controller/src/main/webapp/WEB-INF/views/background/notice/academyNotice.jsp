<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门通知列表</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>

    <!-- 添加 -->
    <s:hasPermission name="deptNotice-add">
	    <div class="easyui-window" title="添加部门通知" id="addAcademyNoticeWindow"
	        collapsible="false" minimizable="false" maximizable="false"
	        style="top: 20px; left: 50px">
	        <div style="height: 31px; overflow: hidden;" split="false" border="false">
	            <div class="datagrid-toolbar">
	                <a id="addAcademyNotice" icon="icon-save" href="#" class="easyui-linkbutton"
	                    plain="true">保存</a>
	                <script type="text/javascript">
	                    $(function() {
	                        $("#addAcademyNotice").click(function() {
	                        	$.post(
                                   "addAcademyNotice", 
                                    {data:JSON.stringify($("#addAcademyNoticeForm").serializeJson())},
                                   function (date) {
                                       if(date.error == 0){
                                           $("#addAcademyNoticeWindow").window("close");
                                           $("#grid").datagrid('reload');
                                           $("#addAcademyNoticeForm").form('clear');
                                       }else {
                                           $.messager.alert("提示信息","发布失败！","warning");
                                           $("#addAcademyNoticeWindow").window("close");
                                       }
                                   }
                               );
	                        });
	                    });
	                </script>
	            </div>
	        </div>
	         <div style="overflow: auto; padding: 5px;" border="false">
	            <form id="addAcademyNoticeForm" method="post" action="addAcademyNotice" >
	                <table class="table-edit" width="80%" align="center">
	                    <tr class="title" >
	                        <td colspan="2">部门通知信息</td>
	                    </tr>
	                    <tr  >
	                        <td>通知标题</td>
	                        <td>
	                            <input class="easyui-textbox" name="tzBt" data-options="required:true,width:500">
	                        </td>
	                    </tr>
						<tr  >
	                        <td>通知内容</td>
	                        <td>
	                            <input class="easyui-textbox" name="tzNr" data-options="required:true,width:500,height:65,multiline:true">
	                        </td>
	                    </tr>
						<tr  >
	                        <td>通知范围</td>
	                        <td>
	                            <input class="easyui-combobox noticeRange" name="tzFwdm.tzfwId" data-options="required:true,width:500" >
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
	                            <input class="easyui-datetimebox" name="tzFbsj" data-options="required:true,showSeconds:false,width:500">
	                        </td>
	                    </tr>
	                    <tr  >
	                        <td>通知结束时间</td>
	                        <td>
	                            <input class="easyui-datetimebox" name="tzJssj" data-options="required:true,showSeconds:false,width:500">
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
    </s:hasPermission>
    
    <!-- 修改 -->
    <s:hasPermission name="deptNotice-update">
    <div class="easyui-window" title="修改部门通知" id="updateAcademyNoticeWindow"
        collapsible="false" minimizable="false" maximizable="false"
        style="top: 20px; left: 50px">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="updateAcademyNotice" icon="icon-save" href="#" class="easyui-linkbutton"
                    plain="true">保存</a>
                <script type="text/javascript">
                    $(function() {
                        $("#updateAcademyNotice").click(function() {
                        	$.post(
                                "updateAcademyNotice",
                                {data:JSON.stringify($("#updateAcademyNoticeForm").serializeJson())},
                                function (date) {
                                    if(date.error == 0){
                                        $("#updateAcademyNoticeWindow").window("close");
                                        $("#grid").datagrid('reload');
                                    }else {
                                        $.messager.alert("提示信息","发布失败！","warning");
                                        $("#updateAcademyNoticeWindow").window("close");
                                    }
                                }
                            );
                        });
                    });
                </script>
            </div>
        </div>
        <div style="overflow: auto; padding: 5px;" border="false">
            <form id="updateAcademyNoticeForm" method="post" action="updateAcademyNotice" >
                <table class="table-edit" width="80%" align="center">
                    <table class="table-edit" width="80%" align="center">
                    <tr class="title" >
                        <td colspan="2">部门通知信息</td>
						<input type="hidden" id="NoticeId" name = "tzId"/>
                    </tr>
                    <tr  >
                        <td>通知标题</td>
                        <td>
                            <input class="easyui-textbox" name="tzBt" data-options="required:true,width:500">
                        </td>
                    </tr>
					<tr  >
                        <td>通知内容</td>
                        <td>
                            <input class="easyui-textbox" name="tzNr" data-options="required:true,width:500,height:65,multiline:true">
                        </td>
                    </tr>
					<tr  >
                        <td>通知范围</td>
                        <td>
                            <input class="easyui-combobox" id="noticeRange" name="tzFwdm.tzfwId" data-options="required:true,width:500" >
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
                        <td>发布时间范围：开始</td>
                        <td>
                            <input class="easyui-datetimebox" name="tzFbsj" data-options="required:true,showSeconds:false,width:500">
                        </td>
                    </tr>
                    <tr  >
                        <td>发布时间范围：结束</td>
                        <td>
                            <input class="easyui-datetimebox" name="tzJssj" data-options="required:true,showSeconds:false,width:500">
                        </td>
                    </tr>
                </table>
            </form>
                </table>
            </form>
        </div>
    </div>
    </s:hasPermission>
    
    <!-- 查询 -->
    <s:hasPermission name="deptNotice-search">
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
                            <input class="easyui-textbox" name="tzBt" data-options="width:500">
                        </td>
                    </tr>
					<tr  >
                        <td>通知内容</td>
                        <td>
                            <input class="easyui-textbox" name="tzNr" data-options="width:500,height:65,multiline:true">
                        </td>
                    </tr>
					<tr  >
                        <td>通知范围</td>
                        <td>
                            <input class="easyui-combobox " id="SearchnoticeRange" name="tzfwId" data-options="width:500" >
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
                            <input class="easyui-datetimebox" name="tzFbsj" data-options="showSeconds:false,width:500">
                        </td>
                    </tr>
                    <tr  >
                        <td>通知结束时间</td>
                        <td>
                            <input class="easyui-datetimebox" name="tzJssj" data-options="showSeconds:false,width:500">
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

    // 用于格式化日期 
	/*$.fn.datetimebox.defaults.formatter = function(date){
        return getLocalTime(date);
    }*/
	
	function doAdd() {
		$('.noticeRange').combobox({    
            url:'../range/loadNoticeRange/学院',    
            valueField:'tzfwId',    
            textField:'tzfwMc'
        }); 
        $('#addAcademyNoticeWindow').window("open");
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
		$('#noticeRange').combobox({    
            url:'../range/loadNoticeRange/学院',    
            valueField:'tzfwId',    
            textField:'tzfwMc',
			onLoadSuccess:function(){
				var val = $(this).combobox('getData'); 
                for(var item=0;item < val.length;item++ ){
                    if ( val[item].tzfwId == rows[0].tzfwId ) {
                        $(this).combobox("select", val[item].tzfwId );
                    }
                };
			}
            
        }); 
		$('#NoticeId').next().hide();
        $("#updateAcademyNoticeForm").form("load", rows[0]);
        $('#updateAcademyNoticeWindow').window("open");
    }

    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除部门通知！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的部门通知吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var approval = rows[i];
                        var id = approval.tzId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteAcademyNoticeBatch/"+ids,function (date) {
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
		$('#SearchnoticeRange').combobox({    
            url:'../range/loadNoticeRange/部门',    
            valueField:'tzfwId',    
            textField:'tzfwMc'
            
        }); 
		$('#searchWindow').window("open");
    }

    //工具栏
    var toolbar = [
 	   <s:hasPermission name="deptNotice-add">
  	   {
  	        id : 'button-add',
  	        text : '增加部门通知',
  	        iconCls : 'icon-add',
  	        handler : doAdd
  	    },
 	    </s:hasPermission>
 	    <s:hasPermission name="deptNotice-update">
  	    {
  	        id : 'button-edit',
  	        text : '修改部门通知',
  	        iconCls : 'icon-edit',
  	        handler : doEdit
  	    }, 
 	    </s:hasPermission>
 	    <s:hasPermission name="deptNotice-delete">
  	    {
  	        id : 'button-delete',
  	        text : '删除部门通知',
  	        iconCls : 'icon-cancel',
  	        handler : doDelete
  	    },
 	    </s:hasPermission>
 	    <s:hasPermission name="branchNotice-search">
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
        field : 'tzId',
        checkbox : true
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
        field : 'yhxxXm',
        title : '发布人名称',
        width : 120,
        align : 'center'
    }, {
        field : 'tzfwMc',
        title : '通知范围',
        width : 120,
        align : 'center'
    }, {
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
        field : 'tzJssj',
        title : '通知结束时间',
        width : 120,
        align : 'center',
        formatter: function(value,row,index){

        	return value;
        }
    }] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 部门通知数据表格
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
            url : "getAcademyNoticePageList",
            idField : 'tzfwId',
            columns : columns,
            fitColumns : true
        });

        // 添加
        $('#addAcademyNoticeWindow').window({
            title : '添加',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        
        // 修改
        $('#updateAcademyNoticeWindow').window({
            title : '修改',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });

        // 查询
        $('#searchWindow').window({
            title : '查询分区',
            width : 800,
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