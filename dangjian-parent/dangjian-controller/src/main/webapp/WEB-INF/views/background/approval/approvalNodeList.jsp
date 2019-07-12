<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审批节点列表</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

	<!-- 数据表格 -->
	<div region="center" border="false">
		<table id="grid"></table>
	</div>

	<!-- 添加 -->
	<s:hasPermission name="approvalNode-add">
	    <div class="easyui-window" title="添加审批节点" id="addApprovalWindow"
	        collapsible="false" minimizable="false" maximizable="false"
	        style="top: 20px; left: 50px">
	        <div style="height: 31px; overflow: hidden;" split="false" border="false">
	            <div class="datagrid-toolbar">
	                <a id="addApproval" icon="icon-save" href="#" class="easyui-linkbutton"
	                    plain="true">保存</a>
	                <script type="text/javascript">
	                    $(function() {
	                        $("#addApproval").click(function() {
	                            //表单校验
	                            var r = $("#addApprovalForm").form('validate');
	                            if (r) {
	                            	  $.post(
	                                       "saveApprovalNode/${splcId}", 
	                                       $("#addApprovalForm").serializeJson(),
	                                       function (date) {
	                                           if(date.error == 0){
	                                               $("#addApprovalWindow").window("close");
	                                               $("#grid").datagrid('reload');
	                                               $("#addApprovalForm").form('clear');
	                                           }else {
	                                               $.messager.alert("提示信息","添加失败！","warning");
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
	            <form id="addApprovalForm" method="post" action="saveApprovalNode/${splcId}" >
	                <table class="table-edit" width="80%" align="center">
	                    <tr class="title" >
	                        <td colspan="2">审批节点信息: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <font color="red" >下一节点不选择代表为最后审批节点</font> 
	                        </td>
	                    </tr>
	                    <tr class="selectFile" >
	                        <td>审批节点名称</td>
	                        <td>
	                            <input class="easyui-textbox" name="spjdMc" data-options="required:true,width:500">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>选择下一级审批节点</td>
	                        <td>
	                            <input class="easyui-combobox approvalNextNode" name="spjdXyspjddm.spjdId" data-options="required:false,width:500" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>选择审批岗位</td>
	                        <td>
	                            <input class="easyui-combobox approvalJob" name="spjdGwdm.spgwId" data-options="required:true,width:500"/>
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
	</s:hasPermission>
	
	<s:hasPermission name="approvalNode-update">
	   <div class="easyui-window" title="修改审批节点信息" id="updateApprovalNodeInformatWindow"
	        collapsible="false" minimizable="false" maximizable="false"
	        style="top: 20px; left: 50px">
	        <div style="height: 31px; overflow: hidden;" split="false" border="false">
	            <div class="datagrid-toolbar">
	                <a id="updateApprovalNodeInformat" icon="icon-save" href="#" class="easyui-linkbutton"
	                    plain="true">保存</a>
	                <script type="text/javascript">
	                    $(function() {
	                        $("#updateApprovalNodeInformat").click(function() {
	                            //表单校验
	                            var r = $("#updateApprovalNodeInformatForm").form('validate');
	                            if (r) {
	                            	$.post(
                                          "updateApprovalNodeInformat/${splcId}", 
                                          $("#updateApprovalNodeInformatForm").serializeJson(),
                                          function (date) {
                                              if(date.error == 0){
                                                  $("#updateApprovalNodeInformatWindow").window("close");
                                                  $("#grid").datagrid('reload');
                                              }else {
                                                  $.messager.alert("提示信息","修改失败！","warning");
                                                  $("#updateApprovalNodeInformatWindow").window("close");
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
	            <form id="updateApprovalNodeInformatForm" method="post" action="" >
	                <table class="table-edit" width="80%" align="center">
	                    <tr class="title" >
	                        <td colspan="2">审批节点信息: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <font color="red" >下一节点不选择代表为最后审批节点</font> 
	                            <input type="hidden" id="spjdId" name="spjdId" data-options="'readonly':true">
	                        </td>
	                    </tr>
	                    <tr class="selectFile" >
	                        <td>审批节点名称</td>
	                        <td>
	                            <input class="easyui-textbox" id="spjdMc" name="spjdMc" data-options="required:true">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>下一级审批节点名称</td>
	                        <td>
	                            <input class="easyui-textbox"  name="spjdXyjdmc"  data-options="required:true,editable:false"/>
	                            <input class="easyui-textbox"  id="nextNodeId"  name="spjdXyspjddm.spjdId" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>选择审批岗位</td>
	                        <td>
	                            <input class="easyui-combobox approvalJobUpdate" name="spjdGwdm.spgwId" data-options="required:true"/>
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
	</s:hasPermission>
	<!-- 修改审批节点信息 -->
    
	

<script type="text/javascript">
	function doUndo(){
	    window.location.href = "../process/toList"; 
	}
	
	// 修改审批节点信息
	function doEditInformat(){
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
        // 加载审批岗位
        $('.approvalJobUpdate').combobox({    
            url:'../job/loadApprovalJob',    
            valueField:'spgwId',    
            textField:'spgwSpgwmc',
            onLoadSuccess:function(){
                $(this).combobox('select',rows[0].spgwId);
            }
        });
		$("#nextNodeId").textbox('setValue', rows[0].spjdXyspjdid );
		$("#spjdId").next().hide();
		$("#nextNodeId").next().hide();
        $("#updateApprovalNodeInformatWindow").form("load", rows[0]);
        $('#updateApprovalNodeInformatWindow').window("open");
	}
    
	// 添加
    function doAdd() {
		//  打开窗口
		$('#addApprovalWindow').window("open");
		// 加载下一节点
		$('.approvalNextNode').combobox({    
			url:'loadNodeApproval/' + ${splcId},    
			valueField:'spjdId',    
			textField:'spjdMc'
		}); 
		// 加载审批岗位
		$('.approvalJob').combobox({    
			url:'../job/loadApprovalJob',    
			valueField:'spgwId',    
			textField:'spgwSpgwmc'
		});
        
    }

    function doDelete() {
    	//获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
             $.messager.alert("提示","请选择需要删除审批节点！","info");
             return;
        } else if(rows.length > 1 ){
            $.messager.alert("提示","本页面是单选操作，只能选择选择一行数据更新","info");
            return;
        } else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的审批节点吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var approval = rows[i];
                        var id = approval.spjdId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
					$.post("deleteApprovalBatch/"+ids +"/" + ${splcId}, function (date) {
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
        $('#searchWindow').window("open");
    }

    //工具栏
    var toolbar = [
    	<s:hasPermission name="approvaNode-return">
	    	{
	            id : 'button-undo',
	            text : '返回审批流程管理',
	            iconCls : 'icon-undo',
	            handler : doUndo
	        },
        </s:hasPermission>
        <s:hasPermission name="approvalNode-add">
	        {
	            id : 'button-add',
	            text : '增加节点',
	            iconCls : 'icon-add',
	            handler : doAdd
	        },
        </s:hasPermission>
        <s:hasPermission name="approvalNode-update">
	        {
	            id : 'button-edit',
	            text : '修改节点信息',
	            iconCls : 'icon-edit',
	            handler : doEditInformat
	        },
        </s:hasPermission>
        <s:hasPermission name="approvalNode-delete">
	        {
	            id : 'button-delete',
	            text : '删除节点',
	            iconCls : 'icon-cancel',
	            handler : doDelete
	        },
        </s:hasPermission> 
	 ];

    //定义列
    var columns = [ [ {
        field : 'spjdId',
        checkbox : true,
    }, {
        field : 'spjdMc',
        title : '审批节点名称',
        width : 170,
        align : 'center'
    }, {
        field : 'splcMc',
        title : '审批流程名称',
        width : 170,
        align : 'center',
    },{
        field : 'spjdXyjdmc',
        title : '下一节点名称',
        width : 170,
        align : 'center',
        formatter: function(value,row,index){
            if (value === "" || value == null){
                return "end";
            } else {
            	return value;
			}
        }

    },{
        field : 'spgwSpgwmc',
        title : '审批岗位名称',
        width : 170,
        align : 'center',
    }] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 审批节点数据表格
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
            url : "list/" + ${splcId} ,
            idField : 'tpId',
            columns : columns,
            fitColumns : true
        });

        // 添加
        $('#addApprovalWindow').window({
            title : '添加节点',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        
        // 调整位置
        $('#updateApprovalNodeWindow').window({
            title : '修改节点',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
		
		// 修改节点信息
        $('#updateApprovalNodeInformatWindow').window({
            title : '修改节点',
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