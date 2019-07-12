<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>支部管理</title>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/jsAndCss/js/index.js"></script>
	
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>
    
	<!-- 添加支部 -->
    <s:hasPermission name="branch-add">
        <div class="easyui-window" title="添加支部" id="addWindow" style="top: 20px; left: 100px" collapsible="false" minimizable="false" maximizable="false" >
            <div style="height: 31px; overflow: hidden;" split="false" border="false">
                <div class="datagrid-toolbar">
                    <a id="add" icon="icon-save" href="#" class="easyui-linkbutton"  plain="true">保存</a>
                    <script type="text/javascript">
                        $(function() {
                            $("#add").click(function() {
                                //表单校验
                                var r = $("#addForm").form('validate');
                                if (r) {
                                	$.post(
                                        "addBranch", 
                                        $("#addForm").serializeJson(),
                                        function (date) {
                                            if(date.error == 0){
                                                $("#addWindow").window("close");
                                                $("#grid").datagrid('reload');
                                                $("#addForm").form('clear');
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
                <form id="addForm" method="post" action="addBranch" >
                    <table class="table-edit" width="80%" align="center">
                        <tr class="title" >
                            <td colspan="3">添加支部信息:</td>
                        </tr>
                        <tr>
                            <td ><span style="width: 100px;">支部名称</span></td>
                            <td colspan="2"><input class="easyui-textbox" name="zbMc" data-options="required:true,width:400"></td>
                        </tr>
                        <tr>
                            <td>所属部门</td>
                            <td ><input id="deptNmaeAdd" class="easyui-combobox" name="zbSsbmdm.bmId" data-options="required:true,width:400"  /></td>
                        </tr>
                        <tr>
                            <td>支部类型</td>
                            <td ><input id="addBranchTypeAdd" class="easyui-combobox" name="zbLxdm.zblxId" data-options="required:true,width:400"  /></td>
                        </tr>
                        <tr>
                            <td >支部书记</td>
                            <td >
                                <input id="addBranchSjUserId" type="hidden" class="easyui-textbox" name="zbSj.userId">
                                <input id="addBranchSjUserXm" class="easyui-textbox" name="zbSj.yhxxXm" data-options="required:true,width:400">
                            </td>
                            <td ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addSj()" style="width: 80px;">选择用户</a></td>
                        </tr>
                        <tr>
                            <td>支部组织委员</td>
                            <td>
                                <input id="addBranchZzwyUserId" type="hidden" class="easyui-textbox" name="zbZzwy.userId">
                                <input id="addBranchZzwyUserXm" class="easyui-textbox" name="zbZzwy.yhxxXm" data-options="required:true,width:400">
                            </td>
                            <td ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addZzwy()" style="width: 80px;">选择用户</a></td>
                        </tr>
                        <tr>
                            <td>支部宣传委员</td>
                            <td>
                                <input id="addBranchXcwyUserId" type="hidden" class="easyui-textbox" name="zbXcwy.userId">
                                <input id="addBranchXcwyUserXm" class="easyui-textbox" name="zzbXcwy.yhxxXm" data-options="required:true,width:400">
                            </td>
                            <td ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addXcwy()" style="width: 80px;">选择用户</a></td>
                        </tr>
                        <tr>
                            <td>支部介绍</td>
                            <td><input class="easyui-textbox" name="zbMs" data-options="required:true, multiline:true,width:500,height:100"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

    </s:hasPermission>

	<!--  修改支部 -->
    <s:hasPermission name="branch-update">
        <div class="easyui-window" title="修改支部" id="updateWindow" style="top: 20px; left: 100px" collapsible="false" minimizable="false" maximizable="false" >
            <div style="height: 31px; overflow: hidden;" split="false" border="false">
                <div class="datagrid-toolbar">
                    <a id="update" icon="icon-save" href="#" class="easyui-linkbutton"  plain="true">保存</a>
                    <script type="text/javascript">
                        $(function() {
                            $("#update").click(function() {
                                //表单校验
                                var r = $("#updateForm").form('validate');
                                if (r) {
                                	$.post(
                                            "editBranch", 
                                            $("#updateForm").serializeJson(),
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
                <form id="updateForm" method="post" action="editBranch" >
                    <table class="table-edit" width="80%" align="center">
                        <tr class="title" >
                            <td colspan="2">添加支部信息:</td>
                            <input id="zbId" type="hidden" name="zbId">
                        </tr>
                        <tr>
                            <td width="140px">支部名称</td>
                            <td><input class="easyui-textbox" name="zbMc" data-options="required:true,width:500"></td>
                        </tr>
                        <tr>
                            <td>所属部门</td>
                            <td ><input id="deptNmaeUpdate" class="easyui-combobox" name="zbSsbmdm.bmId" data-options="required:true,width:500"  /></td>
                        </tr>
                        <tr>
                            <td>支部类型</td>
                            <td ><input id="updateBranchType" class="easyui-combobox" name="zbLxdm.zblxId" data-options="required:true,width:400"  /></td>
                        </tr>
                        <tr>
                            <td >支部书记</td>
                            <td >
                                <input id="updateBranchSjUserId" type="hidden" class="easyui-textbox" name="zbSj.userId">
                                <input id="updateBranchSjUserXm" class="easyui-textbox" name="zbSj.yhxxXm" data-options="required:true,width:400">
                            </td>
                            <td ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateSj()" style="width: 80px;">选择用户</a></td>
                        </tr>
                        <tr>
                            <td>支部组织委员</td>
                            <td>
                                <input id="updateBranchZzwyUserId" type="hidden" class="easyui-textbox" name="zbZzwy.userId">
                                <input id="updateBranchZzwyUserXm" class="easyui-textbox" name="zbZzwy.yhxxXm" data-options="required:true,width:400">
                            </td>
                            <td ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateZzwy()" style="width: 80px;">选择用户</a></td>
                        </tr>
                        <tr>
                            <td>支部宣传委员</td>
                            <td>
                                <input id="updateBranchXcwyUserId" type="hidden" class="easyui-textbox" name="zbXcwy.userId">
                                <input id="updateBranchXcwyUserXm" class="easyui-textbox" name="zzbXcwy.yhxxXm" data-options="required:true,width:400">
                            </td>
                            <td ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateXcwy()" style="width: 80px;">选择用户</a></td>
                        </tr>
                        <tr>
                            <td>支部介绍</td>
                            <td><input class="easyui-textbox" name="zbMs" data-options="required:true, multiline:true,width:400,height:100"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

    </s:hasPermission>

    <!-- 查询 -->
    <s:hasPermission name="branch-search">
        <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
            <div style="overflow:auto;padding:5px;" border="false">
                <form id="searchForm">
                    <table class="table-edit" width="80%" align="center">
                        <tr class="title">
                            <td colspan="2">查询条件</td>
                        </tr>
                        <tr>
                            <td width="140px">支部名称</td>
                            <td><input  class="easyui-textbox" name="zbMc" data-options="width:500" /></td>
                        </tr>
                        <tr>
                            <td>所属部门名称</td>
                            <td><input id="namaeSercch" class="easyui-combobox" name="zbSsbmdm.bmId" data-options="width:500"  /></td>
                        </tr>
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
</body>
<script>

	$("#addBranchSjUserId").next().hide();
	$("#addBranchZzwyUserId").next().hide();
	$("#addBranchXcwyUserId").next().hide();
	$("#updateBranchSjUserId").next().hide();
    $("#updateBranchZzwyUserId").next().hide();
    $("#updateBranchXcwyUserId").next().hide();
	var flagBtn = 0;
    function addSj() {
        flagBtn = 1;
        $('#searchList').window('open')
    }
    function addZzwy() {
        flagBtn = 2;
        $('#searchList').window('open')
        }
    function addXcwy() {
        flagBtn = 3;
        $('#searchList').window('open')
    }
    function updateSj() {
        flagBtn = 4;
        $('#searchList').window('open')
    }
    function updateZzwy() {
        flagBtn = 5;
        $('#searchList').window('open')
        }
    function updateXcwy() {
        flagBtn = 6;
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
            $("#addBranchSjUserId").textbox('setValue',rows[0].userId);
            $("#addBranchSjUserXm").textbox('setValue', rows[0].yhxxXm);  
        } else if (flagBtn ==2 ) {
            $("#addBranchZzwyUserId").textbox('setValue',rows[0].userId);
            $("#addBranchZzwyUserXm").textbox('setValue', rows[0].yhxxXm);
        }else if (flagBtn == 3 ) {
            $("#addBranchXcwyUserId").textbox('setValue',rows[0].userId);
            $("#addBranchXcwyUserXm").textbox('setValue',rows[0].yhxxXm);
        }else if (flagBtn == 4 ) {
            $("#updateBranchSjUserId").textbox('setValue',rows[0].userId);
            $("#updateBranchSjUserXm").textbox('setValue',rows[0].yhxxXm);
        }else if (flagBtn == 5 ) {
            $("#updateBranchZzwyUserId").textbox('setValue',rows[0].userId);
            $("#updateBranchZzwyUserXm").textbox('setValue',rows[0].yhxxXm);
        }else if (flagBtn == 6 ) {
            $("#updateBranchXcwyUserId").textbox('setValue',rows[0].userId);
            $("#updateBranchXcwyUserXm").textbox('setValue',rows[0].yhxxXm);
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
        url:"../user/loadUserInfoPageList", 
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
    
    // 添加
    <s:hasPermission name="branch-add">
    function doAdd() {
        // 加载部门
        $('#deptNmaeAdd').combobox({
            url:'../department/loadBm',
            valueField:'bmId',
            textField:'bmMc' ,
            onLoadSuccess: function(){
                var val = $(this).combobox('getData');
                $(this).combobox("select", val[0].bmId);
            }
        });
        $('#addBranchTypeAdd').combobox({
            url:'loadBranchTypeList',
            valueField:'zblxId',
            textField:'zblxMc' ,
            onLoadSuccess: function(){
                var val = $(this).combobox('getData');
                $(this).combobox("select", val[0].zblxId);
            }
        });
        $('#addWindow').window("open");
    }
    </s:hasPermission>

    <s:hasPermission name="branch-update">
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
        $('#updateBranchType').combobox({
            url:'loadBranchTypeList',
            valueField:'zblxId',
            textField:'zblxMc' ,
            onLoadSuccess: function(){
                var val = $(this).combobox('getData');
                for(var item=0;item < val.length;item++ ){
                    if ( val[item].zblxMc == rows[0].zblxMc) {
                        $(this).combobox("select", val[item].zblxId);
                    }
                };
            }
        });

        $('#deptNmaeUpdate').combobox({
            url:'../department/loadBm',
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

        $("#updateBranchSjUserId").textbox('setValue',rows[0].sjid);
        $("#updateBranchSjUserXm").textbox('setValue',rows[0].sjxm);
        $("#updateBranchZzwyUserId").textbox('setValue',rows[0].zzwyid);
        $("#updateBranchZzwyUserXm").textbox('setValue',rows[0].zzwyxm);
        $("#updateBranchXcwyUserId").textbox('setValue',rows[0].xcwyid);
        $("#updateBranchXcwyUserXm").textbox('setValue',rows[0].xcwyxm);
        $("#zbId").next().hide();
        $("#updateWindow").form("load", rows[0]);

        $('#updateWindow').window("open");
    }
    </s:hasPermission>

    <s:hasPermission name="branch-delete">
    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除审批支部！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的审批支部吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var obj = rows[i];
                        var id = obj.zbId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteBranch/"+ids,"", function (date) {
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

    <s:hasPermission name="branch-search">
    function doSearch() {
        // 加载部门
        $('#namaeSercch').combobox({
            url:'../department/loadBm',
            valueField:'bmId',
            textField:'bmMc'
        });
        $('#searchWindow').window("open");
    }
    </s:hasPermission>

    
    function doObserve() {
    	//获取数据表格中选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
             $.messager.alert("提示","请选择需要查看的支部","info");
             return;
        }
        if(rows.length > 1 ){
            $.messager.alert("提示","本页面是单选操作，只能选择选择一行数据更新","info");
            return;
        } 
        window.location.href = "user/" + rows[0].zbId;
	}
    
  //工具栏
    var toolbar = [
        <s:hasPermission name="branch-add">
        {
            id : 'button-add',
            text : '增加支部',
            iconCls : 'icon-add',
            handler : doAdd
        },
        </s:hasPermission>

        <s:hasPermission name="branch-update">
        {
            id : 'button-edit',
            text : '修改支部',
            iconCls : 'icon-edit',
            handler : doEdit
        },
        </s:hasPermission>

        <s:hasPermission name="branch-delete">
        {
            id : 'button-delete',
            text : '删除支部',
            iconCls : 'icon-cancel',
            handler : doDelete
        },
        </s:hasPermission>

        <s:hasPermission name="branch-search">
        {
            id : 'button-search',
            text : '查询',
            iconCls : 'icon-search',
            handler : doSearch
        },
        </s:hasPermission>

        <s:hasPermission name="branch-user-search">
        {
            id : 'button-delete',
            text : '查看支部人员详细信息',
            iconCls : 'icon-search',
            handler : doObserve
        }
        </s:hasPermission>
       ];
  
    //定义列
    var columns = [ [ {
        field : 'zbId',
        checkbox : true
    },{
        field:'zbMc',
        title:'支部名称',
        width : 200
    },{
        field:'sjxm',
        title:'支部书记',
        width : 100
    },{
        field:'zzwyxm',
        title:'支部组织委员',
        width : 100
    },{
        field:'xcwyxm',
        title:'支部宣传委员',
        width : 100
    },{
        field:'zblxMc',
        title:'支部类型',
        width : 200
    },{
        field:'bmMc',
        title:'所属部门',
        width : 200
    },{
        field:'zbMs',
        title:'支部介绍',
        width : 500
    }] ];
  
    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 支部表格
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
            url : "getBranchList" ,
            idField : 'zbId',
            columns : columns,
            fitColumns : true
        });

        // 添加
        <s:hasPermission name="branch-add">
        $('#addWindow').window({
            title : '添加支部',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 700,
            resizable : false
        });
        </s:hasPermission>

        
        //
        <s:hasPermission name="branch-update">
        $('#updateWindow').window({
            title : '修改支部',
            width : 800,
            modal : true,
            shadow : true,
            closed : true,
            height : 700,
            resizable : false
        });
        </s:hasPermission>

        
        // 查询
        <s:hasPermission name="branch-search">
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
