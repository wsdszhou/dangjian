<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>审批岗位人员列表</title>
    <%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>

    <!-- 添加 -->
    <s:hasPermission name="approvalUser-add">
	    <div class="easyui-window" title="添加审批岗位人员" id="addApprovalJobUserWindow"
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
	                            var r = $("#addApprovalJobUserForm").form('validate');
	                            if (r) {
	                            	$.post(
                                        "../jobUserList/saveApprovalUser", 
                                        $("#addApprovalJobUserForm").serializeJson(),
                                        function (date) {
                                            if(date.error == 0){
                                                $("#addApprovalJobUserWindow").window("close");
                                                $("#grid").datagrid('reload');
                                                $("#addApprovalJobUserForm").form('clear');
                                                $("#addSpgwSpgwmc").textbox('setValue', "${job.spgwSpgwmc }");
                                            }else {
                                                $.messager.alert("提示信息",date.msg,"warning");
                                                $("#addApprovalJobUserWindow").window("close");
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
	            <form id="addApprovalJobUserForm" method="post" action="../jobUserList/saveApprovalUser" >
	                <table class="table-edit" width="80%" align="center">
	                    <tr class="title" >
	                        <td colspan="2">审批岗位人员信息</td>
	                    </tr>
	                    <tr class="selectFile" >
	                        <td>选择审批人员</td>
	                        <td >
                                <input id="addApprovalUserId" type="hidden" name="userId">
                                <input id="addApprovalBmId" type="hidden" name="bmId">
                                <input id="addApprovalUserXm" class="easyui-textbox" name="yhxxXm" data-options="required:true,width:400">
                                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addApprovalUser()" style="width: 80px;">选择用户</a>
                            </td>
	                    </tr>
	                    <tr class="selectFile" >
	                        <td>审批岗位名称</td>
	                        <td>
	                            <input id="addSpgwSpgwmc" class="easyui-textbox" name="spgwSpgwmc" value="${job.spgwSpgwmc }" data-options="required:true,editable:false,width:480">
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
    </s:hasPermission>
    
     <!-- 修改 -->
    <s:hasPermission name="approvalUser-update">
	    <div class="easyui-window" title="修改审批岗位人员" id="updateApprovalJobUserWindow"
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
                                        "../jobUserList/updateApprovalJobUser", 
                                        $("#updateApprovalJobForm").serializeJson(),
                                        function (date) {
                                            if(date.error == 0){
                                                $("#updateApprovalJobUserWindow").window("close");
                                                $("#grid").datagrid('reload');
                                            }else {
                                                $.messager.addApprovalJobUserWindow("提示信息","发布失败！","warning");
                                                $("#updateApprovalJobUserWindow").window("close");
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
	            <form id="updateApprovalJobForm" method="post" action="../jobUserList/updateApprovalJobUser" >
	                <table class="table-edit" width="80%" align="center">
	                    <tr class="title" >
	                        <td colspan="2">审批岗位人员信息</td>
	                        <input type="hidden" name = "spryId"/>
	                    </tr>
	                    <tr class="selectFile" >
	                        <td>选择审批岗位人员</td>
	                        <td>
                                <input id="updateApprovalUserId" type="hidden" name="userId">
                                <input id="updateApprovalBmId" type="hidden" name="bmId">
                                <input id="updateApprovalUserXm" class="easyui-textbox" name="yhxxXm" data-options="required:true,width:400">
                                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateApprovalUser()" style="width: 80px;">选择用户</a>
	                        </td>
	                    </tr>
	                    <tr class="selectFile" >
	                        <td>审批岗位名称</td>
	                        <td>
	                            <input class="easyui-textbox" name="spgwSpgwmc" data-options="required:true,editable:false,width:480">
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
    </s:hasPermission>
    
    <!-- 查询 -->
    <s:hasPermission name="approvalUser-search">
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
	                        <td>选择部门</td>
	                        <td>
	                            <input  class="easyui-combobox loadBm" name="bmId" data-options="width:480" />
	                        </td>
	                    </tr>
	                    <tr>
	                    <tr>
	                        <td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a> </td>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
    </s:hasPermission>


     <!-- 查找用户弹窗 -->
    <div id="searchList" class="easyui-window" title="查询用户" data-options="iconCls:'icon-save',closed:true,modal:true" style="width:800px;height:600px;padding:5px;display: none;">
        <div class="easyui-layout" data-options="fit:true" >
            <div data-options="region:'center'" style="padding:10px;">
                 <table id="searchListGrid"></table> 
            </div>
            <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0; height: 50px;">
                <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:selected()" style="width:80px">确认</a>
                <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:cancel()" style="width:80px">取消</a>
            </div>
        </div>
    </div>

    <!-- 查询用户窗口 -->
    <div class="easyui-window" title="查询用户窗口 " id="doSearchUserWindow" data-options="closed:true,modal:true" collapsible="false" minimizable="false" maximizable="false" style="top:50px;left:50px">
        <div style="overflow:auto;padding:5px;" border="false">
            <form id="searchUserForm">
                <table class="table-edit" width="90%" align="center">
                    <tr class="title">
                        <td colspan="4">查询条件</td>
                    </tr>
                    <tr>
                        <td style="width: 80px;">用户名:</td>
                        <td><input class="easyui-textbox"  name="userMc"  style="width: 200px;"></input></td>
                        <td style="width: 80px;">用户姓名:</td>
                        <td><input class="easyui-textbox"  name="yhxxXm" style="width: 200px;" ></input></td>
                    </tr>
                    <tr>
                        <td>用户性别:</td>
                        <td>
                            <select class="easyui-combobox" name="yhxxXb" style="width: 200px;">   
                                <option value="男">男</option>   
                                <option value="女">女</option>     
                            </select>
                        </td>
                        <td>部门:</td>
                        <td><input id="searchDepartment" class="easyui-combobox"  name="bmId" style="width: 200px;" ></input></td>
                    </tr>
                    <tr>
                        
                        <td ><a id="userBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width: 80px;" >查询</a> </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>    
                </table>
            </form>
        </div>
    </div>  
<script type="text/javascript">
	    
	$("#addApprovalUserId").hide();
	$("#addApprovalBmId").hide();
	$("#updateApprovalBmId").hide();
	$("#updateApprovalUserId").hide();
	var flagBtn = 0;
	function addApprovalUser() {
	    flagBtn = 1;
	    $('#searchList').window('open')
	}
	
	function updateApprovalUser() {
	    flagBtn = 2;
	    $('#searchList').window('open')
	}
	
	function selected() {
	    var rows = $("#searchListGrid").datagrid("getSelections");
	    if(rows.length == 0){
	        $.messager.alert("提示","请选择用户","info");
	        return;
	   }
	   if(rows.length > 1 ){
	       $.messager.alert("提示","本页面是单选操作，只能选择选择一行数据更新","info");
	       return;
	   }
	    if (flagBtn ==1 ) {
	        $("#addApprovalUserId").val(rows[0].userId);
	        $("#addApprovalBmId").val(rows[0].bmId);
	        $("#addApprovalUserXm").textbox('setValue', rows[0].yhxxXm);  
	    } else {
	        $("#updateApprovalUserId").val(rows[0].userId);
	        $("#updateApprovalBmId").val(rows[0].bmId);
	        $("#updateApprovalUserXm").textbox('setValue',rows[0].yhxxXm);
	    }
	    $("#searchList").window('close');
	}
	
	function cancel() {
	    $("#searchList").window('close');
	}   
	
	function searchList() {
	    $("#searchList").css({
	        display : "block"
	    });
	};
	$('#searchListGrid').datagrid({   
	    url:"../../user/loadUserInfoPageList", 
	    idField : 'userId',
	    columns : [[{
	        field : 'userId',
	        checkbox : true,
	    } , {
	        field : 'userMc',
	        title : '用户名',
	        width : 80
	    } , {
	        field : 'yhxxXm',
	        title : '姓名',
	        width : 80
	    } , {
	        field : 'dnzwMc',
	        title : '党内职务',
	        width : 100
	    }, {
	        field : 'xzzwMc',
	        title : '行政职务',
	        width : 100
	    }, {
	        field : 'bmMc',
	        title : '部门',
	        width : 120
	    }]],
	    fitColumns : true,
	    fit : true,
	    border : true,
	    rownumbers : true,
	    pagination:true, 
	    pageList : [ 5, 10, 15, 20 ],
	    pageSize : 10,  
	    pageNumber:1, 
	    toolbar: [{
	        id : 'button-add',
	        text : '查询用户',
	        iconCls : 'icon-add',
	        handler : doSearchUser
	    }],
	    rownumbers:true,   
	    doPagination:function(pPageIndex, pPageSize) {   
	        //改变opts.pageNumber和opts.pageSize的参数值，用于下次查询传给数据层查询指定页码的数据   
	        var gridOpts = $('#searchListGrid').datagrid('options');   
	        gridOpts.pageNumber = pPageIndex;   
	        gridOpts.pageSize = pPageSize;     
	        Exec_Wait('searchListGrid','loadDateGrid()');   
	    } 
	});  
	
	$('#doSearchUserWindow').window({
	    title : '查询用户',
	    width : 800,
	    modal : true,
	    shadow : true,
	    closed : true,
	    height : 400,
	    resizable : false
	});
	
	$("#userBtn").click(function() {
	    var p = $("#searchUserForm").serializeJson();
	    $("#searchListGrid").datagrid("load", p);
	    $("#doSearchUserWindow").window("close");
	});
	function doSearchUser() {
	    $('#searchDepartment').combobox({    
	        url:'../../department/loadBm',    
	        valueField:'bmId',    
	        textField:'bmMc'   
	    });
	    $('#doSearchUserWindow').window("open");
	};
	
	function loadDateGrid(){   
	    var gridOpts = $('#searchListGrid').datagrid('options');   
	    //定义查询条件   
	    var queryCondition = null;   
	    //异步获取数据到javascript对象，入参为查询条件和页码信息   
	    var oData = getAjaxDate(queryCondition,gridOpts);   
	    //使用loadDate方法加载Dao层返回的数据   
	    $('#searchListGrid').datagrid('loadData',{"total" : oData.total, "rows" : oData.rows} );   
	}; 
	
	//异步获取数据到javascript对象，入参为查询条件和页码信息   
	function getAjaxDate (queryCondition,gridOpts) {
	    $.post(
	        "../user/loadUserInfoPageList", 
	        { 
	            page: gridOpts.pageNumber,
	            pageSize: gridOpts.pageSize,
	            name: queryCondition
	        },
	        function(data){
	            return data;
	        }
	    );
	};
	
	function Exec_Wait(grid,func,time){   
	    var dalayTime = 500;
	    __func_= func;
	    __selector_ = '#' + grid;   
	    $(__selector_).datagrid("loading");   
	    if (time) {   
	        dalayTime = time;   
	    }   
	    gTimeout=window.setTimeout(_Exec_Wait_,dalayTime);   
	};
	
	function _Exec_Wait_(){   
	    try{eval(__func_);   
	    }catch(e){   
	        alert("__func_:" + __func_ + ";_ExecWait_" + e.message);   
	    }finally{   
	        window.clearTimeout(gTimeout);   
	        $(__selector_).datagrid("loaded");   
	    }   
	};
	function doUndo(){
		 window.location.href = "../job/list"; 
	}
	
	function doAdd() {
        $('#addApprovalJobUserWindow').window("open");
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
        $('#updateApprovalJobUserWindow').window("open");
    }

    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除审批岗位人员！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的审批岗位人员吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var approval = rows[i];
                        var id = approval.spryId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("../jobUserList/deleteApprovalJobUserBatch/"+ids, function (date) {
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
    	
		// 加载部门
		$('.loadBm').combobox({    
			url: '../../department/loadBm',    
			valueField:'bmId',    
			textField:'bmMc'
			
		}); 
		$('#searchWindow').window("open");
		
    }

    //工具栏
    var toolbar = [ 
    	<s:hasPermission name="approvalUser-return">
    	    {
    	        id : 'button-add',
    	        text : '返回审批岗位管理',
    	        iconCls : 'icon-undo',
    	        handler : doUndo
    	    },
        </s:hasPermission>
        <s:hasPermission name="approvalUser-add">
	        {
	            id : 'button-add',
	            text : '增加岗位人员',
	            iconCls : 'icon-add',
	            handler : doAdd
	        }, 
        </s:hasPermission>
	        <s:hasPermission name="approvalUser-update">
            {
                id : 'button-edit',
                text : '修改岗位人员',
                iconCls : 'icon-edit',
                handler : doEdit
            },
        </s:hasPermission>
        <s:hasPermission name="approvalUser-delete">
            {
                id : 'button-delete',
                text : '删除岗位人员',
                iconCls : 'icon-cancel',
                handler : doDelete
            },
        </s:hasPermission>
        <s:hasPermission name="approvalUser-search">
	        {
	            id : 'button-delete',
	            text : '查询',
	            iconCls : 'icon-search',
	            handler : doSeacher
	        } 
        </s:hasPermission>
    ];

    //定义列
    var columns = [ [ {
        field : 'spgwId',
        checkbox : true,
    }, {
        field : 'yhxxXm',
        title : '审批人员名称',
        width : 120,
        align : 'center'
    }, {
        field : 'bmMc',
        title : '审批人员所属部门',
        width : 120,
        align : 'center'
    }, {
        field : 'spgwSpgwmc',
        title : '审批人员所属岗位',
        width : 120,
        align : 'center'
    }] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 审批岗位人员数据表格
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
            url : "../jobUserList/jobUserPageList/" + ${job.spgwId},
            idField : 'tpId',
            columns : columns,
            fitColumns : true
        });

        // 添加
        $('#addApprovalJobUserWindow').window({
            title : '添加',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 650,
            resizable : false
        });
        
        // 修改
        $('#updateApprovalJobUserWindow').window({
            title : '修改',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 650,
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