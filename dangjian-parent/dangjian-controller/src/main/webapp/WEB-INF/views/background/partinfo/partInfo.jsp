<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>党籍信息</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>

    <!-- 添加 -->
    <div class="easyui-window" title="添加党籍" id="addWindow"
        collapsible="false" minimizable="false" maximizable="false"
        style="top: 20px; left: 50px">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="addPartInfo" icon="icon-save" href="#" class="easyui-linkbutton"
                    plain="true">保存</a>
                <script type="text/javascript">
                    $(function() {
                        $("#addPartInfo").click(function() {
                            //表单校验
                            var r = $("#addPartInfoForm").form('validate');
                            if (r) {
                            	$.post(
                                    "save", 
                                    $("#addPartInfoForm").serializeJson(),
                                    function (date) {
                                        if(date.error == 0){
                                            $("#addWindow").window("close");
                                            $("#grid").datagrid('reload');
                                            $("#addPartInfoForm").form('clear');
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
            <form id="addPartInfoForm" method="post" action="save" >
                <table class="table-edit" width="80%" align="center">
                    <tr class="title" >
                        <td >党籍信息</td>
                        <td ><span id="userHint" style="font-size: 16px;color: red"></span> </td>
                    </tr>
                    <tr >
                        <td>用户</td>
                        <td>
                            <input id="userName" class="easyui-textbox" data-options="required:true,width:400">
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="selectUser()" style="width: 80px;">选择用户</a>
                            <input id="userId" type="hidden" name="yhdm.userId">
                        </td>
                    </tr>
                    <tr >
                        <td>入党时间</td>
                        <td>
                            <input class="easyui-datebox" name="rdsj" data-options="required:true,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>选择部门</td>
                        <td>
                            <input id="department" class="easyui-combobox" name="bmdm" data-options="required:true,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>选择支部</td>
                        <td>
                            <input id="addBranch" class="easyui-combobox" name="zbdm" data-options="required:true,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>选择政治面貌</td>
                        <td>
                            <input id="addZzmm" class="easyui-combobox" name="zzmmdm" data-options="required:true,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>选择党务</td>
                        <td>
                            <input id="addDnzw" class="easyui-combobox" name="dnzwdm" data-options="required:true,width:500">
                        </td>
                    </tr>
                    <tr >
                        <td>描述</td>
                        <td>
                            <input class="easyui-textbox" name="ms" data-options="required:true,multiline:true,height:50,width:500">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    
    <!-- 修改 -->
    <div class="easyui-window" title="修改党籍" id="updateWindow"
        collapsible="false" minimizable="false" maximizable="false"
        style="top: 20px; left: 50px">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="updatePartInfo" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
                <script type="text/javascript">
                    $(function() {
                        $("#updatePartInfo").click(function() {
                            //表单校验
                            var r = $("#updatePartInfoForm").form('validate');
                            if (r) {
                            	$.post(
                                    "update", 
                                    $("#updatePartInfoForm").serializeJson(),
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
            <form id="updatePartInfoForm" method="post" action="update" >
                <table class="table-edit" width="80%" align="center">
                    <tr class="title" >
                        <td colspan="2">党籍信息</td>
                        <input type="hidden" name = "id"/>
                    </tr>
                    <tr >
                        <td>入党时间</td>
                        <td>
                            <input class="easyui-datebox" name="rdsj" data-options="required:true,width:500">
                        </td>
                    </tr>
                    <tr >
                        <td>党籍状态</td>
                        <td>
                            <select id="zt" class="easyui-combobox" name="zt" style="width:500px">   
							    <option value="1">在籍</option>   
							    <option value="2">转出</option>  
							</select>
                        </td>
                    </tr>
                    <tr >
                        <td>党籍转出地点</td>
                        <td>
                            <input class="easyui-textbox" name="zcdd" data-options="multiline:true,height:50,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>选择部门</td>
                        <td>
                            <input id="updateDepartment" class="easyui-combobox" name="bmdm" data-options="required:true,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>选择支部</td>
                        <td>
                            <input id="updateBranch" class="easyui-combobox" name="zbdm" data-options="required:true,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>选择政治面貌</td>
                        <td>
                            <input id="updateZzmm" class="easyui-combobox" name="zzmmdm" data-options="required:true,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>选择党务</td>
                        <td>
                            <input id="updateDnzw" class="easyui-combobox" name="dnzwdm" data-options="required:true,width:500">
                        </td>
                    </tr>
                   <tr >
                        <td>描述</td>
                        <td>
                            <input class="easyui-textbox" name="ms" data-options="required:true,multiline:true,height:50,width:500">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
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
                        <td width="140px">姓名</td>
                        <td><input  class="easyui-textbox" name="yhxxXm" data-options="width:500" /></td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td >
                            <select class="easyui-combobox" name="yhxxXb" style="width: 500px;">   
                                <option value="男">男</option>   
                                <option value="女">女</option>     
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>学历:</td>
                        <td><input id="education" class="easyui-combobox"  name="xlId" style="width: 500px;" ></td>
                    </tr>
                    <tr>
                        <td>政治面貌:</td>
                        <td><input id="politicsState" class="easyui-combobox"  name="zzmmId"  style="width: 500px;"></td>
                    </tr>
                    <tr>
                        <td>所属部门</td>
                        <td ><input id="dept" class="easyui-combobox" name="bmId" data-options="width:500"  /></td>
                    </tr>
                    <tr>
                        <td>所属支部名称</td>
                        <td><input id="branch" class="easyui-combobox" name="zbId" data-options="width:500"  /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a> </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    
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

    $("#userId").next().hide();
	
	function selectUser() {
		 $('#searchList').window('open');
	}
	
	$('#searchListGrid').datagrid({   
        url:"../user/loadUserInfoPageList", 
        idField : 'userId',
        columns : [[{
            field : 'userId',
            checkbox : true
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
            url:'../department/loadBm',    
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
        __func_=func;   
        __selector_ = '#' + grid;   
        $(__selector_).datagrid("loading");   
        if (time) {   
            dalayTime = time;   
        }   
        gTimeout=window.setTimeout(_Exec_Wait_,dalayTime);   
    } ;
    
    function _Exec_Wait_(){   
        try{eval(__func_);   
        }catch(e){   
            alert("__func_:" + __func_ + ";_ExecWait_" + e.message);   
        }finally{   
            window.clearTimeout(gTimeout);   
            $(__selector_).datagrid("loaded");   
        }   
    };
    
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
       $("#userId").val(rows[0].userId);
       $("#userName").textbox('setValue',rows[0].yhxxXm);
       $("#searchList").window('close');
    };
    
    function cancel() {
        $("#searchList").window('close');
    } ; 

    function doAdd() {
        $('#addWindow').window("open");
         // 加载部门
        $('#department').combobox({    
            url:'../department/loadBm',
            valueField:'bmId',    
            textField:'bmMc',
            onSelect: function(rec){      
                // 加载支部
                $('#addBranch').combobox({    
                    url:'../branch/loadBranch/' + rec.bmId ,    
                    valueField:'zbId',    
                    textField:'zbMc'
                });    
            } 
        });
         // 加载政治面貌
        $('#addZzmm').combobox({    
        	url:'../politicsState/loadPoliticsStateAll',    
            valueField:'zzmmId',    
            textField:'zzmmMc'
        });
        // 加载党内职务
        $('#addDnzw').combobox({    
        	url:'../partyJob/loadPartyJobAll',    
            valueField:'dnzwId',    
            textField:'dnzwMc'
        });
    };
    

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
        $("#updatePartInfoForm").form("load", rows[0]);
        $('#updateWindow').window("open");
        $("#zt").combobox("select", rows[0].zt);
        // 加载部门
        $('#updateDepartment').combobox({    
            url:'../department/loadBm',
            valueField:'bmId',    
            textField:'bmMc',
            onSelect: function(rec){
            	// 加载支部
                $('#updateBranch').combobox({    
                    url:'../branch/loadBranch/' + rec.bmId ,    
                    valueField:'zbId',    
                    textField:'zbMc'
                });     
            },
            onLoadSuccess : function() {
            	var val = $(this).combobox('getData');
            	for(var item=0;item < val.length;item++ ){
                    if ( val[item].bmId == rows[0].bmdm) {
                        $(this).combobox("select", val[item].bmId);
                    }
                 };
			}
        });
         // 加载支部
        $('#updateBranch').combobox({    
        	onLoadSuccess : function() {
                var val = $(this).combobox('getData');
        		console.log(val);
                for(var item=0;item < val.length;item++ ){
                    if ( val[item].zbId == rows[0].zbdm) {
                        $(this).combobox("select", val[item].zbId);
                    }
                 };
            }
        });  
         // 加载政治面貌
        $('#updateZzmm').combobox({    
            url:'../politicsState/loadPoliticsStateAll',    
            valueField:'zzmmId',    
            textField:'zzmmMc',
            onLoadSuccess : function() {
                var val = $(this).combobox('getData');
                for(var item=0;item < val.length;item++ ){
                    if ( val[item].zzmmId == rows[0].zzmmdm) {
                        $(this).combobox("select", val[item].zzmmId);
                    }
                 };
            }
        });
        // 加载党内职务
        $('#updateDnzw').combobox({    
            url:'../partyJob/loadPartyJobAll',    
            valueField:'dnzwId',    
            textField:'dnzwMc',
            onLoadSuccess : function() {
                var val = $(this).combobox('getData');
                for(var item=0;item < val.length;item++ ){
                    if ( val[item].dnzwId == rows[0].dnzwdm) {
                        $(this).combobox("select", val[item].dnzwId);
                    }
                 };
            }
        });
    };

    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除党籍！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的党籍吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //保存在我们的数组里面
                        array.push( rows[i].id );
                    }
                    var ids = array.join(",");
                    $.post("deleteBatch/"+ids,function (date) {
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
    
    function doSearch() {
    	$('#searchWindow').window("open");
    	// 加载学历
        $('#education').combobox({    
            url:'../education/loadEducationAll',    
            valueField:'xlId',    
            textField:'xlMc'
        });
        // 加载政治面貌
        $('#politicsState').combobox({    
            url:'../politicsState/loadPoliticsStateAll',    
            valueField:'zzmmId',    
            textField:'zzmmMc'
        });
        // 加载民族
        $('#nation').combobox({    
            url:'../nation/loadNationAll',    
            valueField:'mzId',    
            textField:'mzMc'
        });
        // 加载部门
        $('#dept').combobox({  
            url:'../department/loadBm',    
            valueField:'bmId',    
            textField:'bmMc' , 
            onSelect: function(rec){    
	            $('#branch').combobox({  
	                url:'../loadBranch/' + rec.bmId,    
	                valueField:'zbId',    
	                textField:'zbMc' 
	            });
            }     
        });
        // 加载支部
        $('#branch').combobox({  
            url:'../branch/loadBranch/-1',    
            valueField:'zbId',    
            textField:'zbMc'
        }); 
	};

    //工具栏
    var toolbar = [{
        id : 'button-add',
        text : '增加党籍',
        iconCls : 'icon-add',
        handler : doAdd
    }, {
        id : 'button-edit',
        text : '修改党籍',
        iconCls : 'icon-edit',
        handler : doEdit
    }, {
        id : 'button-delete',
        text : '删除党籍',
        iconCls : 'icon-cancel',
        handler : doDelete
    }, {
        id : 'button-search',
        text : '查询',
        iconCls : 'icon-search',
        handler : doSearch
    } ];

    //定义列
    var columns = [ [ {
        field : 'id',
        checkbox : true,
    }, {
        field : 'yhxxXm',
        title : '姓名',
        width : 70,
        align : 'center'
    }, {
        field : 'yhxxXb',
        title : '性别',
        width : 70,
        align : 'center'
    }, {
        field : 'rdsj',
        title : '入党时间',
        width : 100,
        align : 'center',
        formatter: function(value,row,index){

            if(value == null){
                return "无";
            }else {
                return value.substring(0,10);
            }

        }
    }, {
        field : 'zrsj',
        title : '转入时间',
        width : 100,
        align : 'center',
        formatter: function(value,row,index){
            if(value == null){
                return "无";
            }else {
                return value.substring(0,10);
            }

        }
    }, {
        field : 'zt',
        title : '党籍状态',
        width : 40,
        align : 'center',
        formatter:  function(value,row,index){
        	if (row.result == 1) {
	        	if (value == 1) {
					return "在籍";
				} else {
					return "已转出";
				}
			} else {
				return "审批中";
			}
        }
    }, {
        field : 'ms',
        title : '描述',
        width : 200,
        align : 'center'
    }] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 党籍数据表格
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
            url : "partyInfoList",
            idField : 'id',
            columns : columns,
            fitColumns : true
        });

        // 添加
        $('#addWindow').window({
            title : '添加',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 600,
            resizable : false
        });
        
        // 修改
        $('#updateWindow').window({
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
            width : 1000,
            modal : true,
            shadow : true,
            closed : true,
            height : 650,
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