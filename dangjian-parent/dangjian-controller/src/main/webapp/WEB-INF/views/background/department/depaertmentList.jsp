<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>部门管理</title>
    <%@include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body class="easyui-layout" style="visibility: hidden;">

<!-- 数据表格 -->
<div region="center" border="false">
    <table id="grid"></table>
</div>

<!-- 添加部门 -->
<s:hasPermission name="dept-add">
    <div class="easyui-window" title="添加部门" id="addDepartmentWindow" style="top: 100px; left: 100px" collapsible="false"
         minimizable="false" maximizable="false">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="addDepartment" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
                <script type="text/javascript">
                    $(function () {
                        $("#addDepartment").click(function () {
                            //表单校验
                            var r = $("#addDepartmentForm").form('validate');
                            if (r) {
                            	$.post(
	                                "addDept", 
	                                $("#addDepartmentForm").serializeJson(),
	                                function (date) {
	                                    if(date.error == 0){
	                                        $("#addDepartmentWindow").window("close");
	                                        $("#grid").datagrid('reload');
	                                        $("#addDepartmentForm").form('clear');
	                                    }else {
	                                        $.messager.alert("提示信息","发布失败！","warning");
	                                        $("#addDepartmentWindow").window("close");
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
            <form id="addDepartmentForm" method="post" action="addDept">
                <table class="table-edit" width="80%" align="center">
                    <tr class="title">
                        <td colspan="3">添加部门信息:</td>
                    </tr>
                    <tr>
                        <td>部门名称</td>
                        <td colspan="2"><input class="easyui-textbox" name="bmMc" data-options="required:true,width:500 "></td>
                    </tr>
                    <tr>
                        <td>书记姓名</td>
                        <td>
                            <input id="addBmSjUserId" type="hidden" class="easyui-textbox" name="bmSj.userId">
                            <input id="addBmSjUserXm" class="easyui-textbox" name="bmSj.yhxxXm"
                                   data-options="required:true,width:400">
                        </td>
                        <td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addSj()">选择用户</a></td>
                    </tr>
                    <tr>
                        <td width="100px">院长姓名</td>
                        <td width="400px">
                            <input id="addBmYzUserId" type="hidden" class="easyui-textbox" name="bmYz.userId">
                            <input id="addBmYzUserXm" class="easyui-textbox" name="bmYz.yhxxXm"
                                   data-options="required:true,width:400">
                        </td>
                        <td width="100px"><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addYz()"
                                             style="width: 100px;">选择用户</a></td>
                    </tr>
                    <tr>
                        <td>部门介绍</td>
                        <td colspan="2"><input class="easyui-textbox" name="bmJs"
                                               data-options="required:true, multiline:true,width:500,height:100"></td>
                    </tr>
                    <tr>
                        <td>部门logo上传</td>
                        <td colspan="2">
                            <form action="uploadLogo" method="post" enctype="multipart/form-data">
                                <input id="uploadFile" type="file" name="uploadFile" value="部门logo">
                                <input id="logoBtn" type="button" onclick="pictureUpload()" value="上传logo">
                            </form>
                            <input id="addbmLogo" type="hidden" name="bmLogo">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <div style="width: 100px;height: 100px;">
                                <img id="displayLogo" alt="" style="width: 100px;" src=""/>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</s:hasPermission>

<!--  修改部门 -->
<s:hasPermission name="dept-update">
    <div class="easyui-window" title="修改部门" id="updateDepartmentWindow" style="top: 100px; left: 100px" collapsible="false"
         minimizable="false" maximizable="false">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="updateDepartment" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
                <script type="text/javascript">
                    $(function () {
                        $("#updateDepartment").click(function () {
                        	$.post(
                                 "editDept", 
                                 $("#updateDepartmentForm").serializeJson(),
                                 function (date) {
                                     if(date.error == 0){
                                         $("#updateDepartmentWindow").window("close");
                                         $("#grid").datagrid('reload');
                                     }else {
                                         $.messager.alert("提示信息","发布失败！","warning");
                                         $("#updateDepartmentWindow").window("close");
                                     }
                                 }
                              );
                        });
                    });
                </script>
            </div>
        </div>
        <div style="overflow: auto; padding: 5px;" border="false">
            <form id="updateDepartmentForm" method="post" action="editDept">
                <table class="table-edit" width="80%" align="center">
                    <tr class="title">
                        <td colspan="3">修改部门信息: <input id="bmId" type="hidden" class="easyui-textbox" name="bmId"></td>
                    </tr>
                    <tr>
                        <td>部门名称</td>
                        <td colspan="2"><input class="easyui-textbox" name="bmMc" data-options="required:true,width:540">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px;">书记姓名</td>
                        <td>
                            <input id="updateBmSjUserId" type="hidden" class="easyui-textbox" name="bmSj.userId">
                            <input id="updateBmSjUserXm" class="easyui-textbox" name="bmSj.yhxxXm"
                                   data-options="required:true,width:350">
                        </td>
                        <td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateSj()"
                               style="width: 100px;">选择用户</a></td>
                    </tr>
                    <tr>
                        <td>院长姓名</td>
                        <td>
                            <input id="updateBmYzUserId" type="hidden" class="easyui-textbox" name="bmYz.userId">
                            <input id="updateBmYzUserXm" class="easyui-textbox" name="bmYz.yhxxXm"
                                   data-options="required:true,width:350">
                        </td>
                        <td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateYz()"
                               style="width: 100px;">选择用户</a></td>
                    </tr>
                    <tr>
                        <td>部门介绍</td>
                        <td><input class="easyui-textbox" name="bmJs"
                                   data-options="required:true, multiline:true,width:540,height:100"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</s:hasPermission>

<!-- 修改logo -->
<s:hasPermission name="dept-udpdate-logo">
    <div class="easyui-window" title="修改部门logo" id="updateDepartmentLogoWindow" style="top: 100px; left: 100px"
         collapsible="false" minimizable="false" maximizable="false">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="updateDepartmentLogo" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
                <script type="text/javascript">
                    $(function () {
                        $("#updateDepartmentLogo").click(function () {
                            //表单校验
                            var r = $("#updateDepartmentLogoForm").form('validate');
                            if (r) {
                            	$.post(
                                      "editDept", 
                                      $("#updateDepartmentLogoForm").serializeJson(),
                                      function (date) {
                                          if(date.error == 0){
                                              $("#updateDepartmentLogoWindow").window("close");
                                              $("#grid").datagrid('reload');
                                          }else {
                                              $.messager.alert("提示信息","发布失败！","warning");
                                              $("#updateDepartmentLogoWindow").window("close");
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
            <form id="updateDepartmentLogoForm" method="post" action="editDept">
                <table class="table-edit" width="80%" align="center">
                    <tr class="title">
                        <td colspan="2">添加部门信息:</td>
                        <input id="bmIdLogo" type="hidden" name="bmId">
                    </tr>
                    <tr>
                        <td width="140px">部门名称</td>
                        <td><input class="easyui-textbox" name="bmMc" data-options="required:true,editable:false,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>书记姓名</td>
                        <td><input class="easyui-textbox" id="logobmSj" name="bmSj" data-options="required:true,editable:false,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>院长姓名</td>
                        <td><input class="easyui-textbox" id="logobmYz" name="bmYz" data-options="required:true,editable:false,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>部门介绍</td>
                        <td><input class="easyui-textbox" name="bmJs"
                                   data-options="required:true,editable:false, multiline:true,width:500,height:100"></td>
                    </tr>
                    <tr>
                        <td>部门logo上传</td>
                        <td>
                            <form action="uploadLogo" method="post" enctype="multipart/form-data">
                                <input id="uploadFileUpdate" type="file" name="uploadFile" value="部门logo">
                                <input id="logoBtnUpdate" type="button" onclick="pictureUploadUpdate()" value="上传logo">
                            </form>
                            <input id="addbmLogoUpdate" type="hidden" name="bmLogo" data-options="required:true">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div style="width: 100px;height: 100px;">
                                <img id="displayLogoUpdate" style="width: 100px;" alt="" src=""/>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</s:hasPermission>

<!-- 查找用户弹窗 -->
<div id="searchList" class="easyui-window" title="查询用户" data-options="iconCls:'icon-save',closed:true,modal:true"
     style="width:800px;height:600px;padding:5px;display: none;">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'center'" style="padding:10px;">
            <table id="searchListGrid"></table>
        </div>
        <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0; height: 50px;">
            <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)"
               onclick="javascript:selected()" style="width:80px">确认</a>
            <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)"
               onclick="javascript:cancel()" style="width:80px">取消</a>
        </div>
    </div>
</div>

<!-- 查询用户窗口 -->
<div class="easyui-window" title="查询用户窗口 " id="doSearchUserWindow" data-options="closed:true,modal:true"
     collapsible="false" minimizable="false" maximizable="false" style="top:50px;left:50px">
    <div style="overflow:auto;padding:5px;" border="false">
        <form id="searchUserForm">
            <table class="table-edit" width="90%" align="center">
                <tr class="title">
                    <td colspan="4">查询条件</td>
                </tr>
                <tr>
                    <td style="width: 80px;">用户名:</td>
                    <td><input class="easyui-textbox" name="userMc" style="width: 200px;"></input></td>
                    <td style="width: 80px;">用户姓名:</td>
                    <td><input class="easyui-textbox" name="yhxxXm" style="width: 200px;"></input></td>
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
                    <td><input id="searchDepartment" class="easyui-combobox" name="bmId" style="width: 200px;"></input>
                    </td>
                </tr>
                <tr>

                    <td><a id="userBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
                           style="width: 80px;">查询</a></td>
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

    $("#bmIdLogo").next().hide();
    $("#addBmSjUserId").next().hide();
    $("#addBmYzUserId").next().hide();
    $("#upadteBmSjUserId").next().hide();
    $("#upadteBmYzUserId").next().hide();
    var flagBtn = 0;

    function addSj() {
        flagBtn = 1;
        $('#searchList').window('open')
    }

    function addYz() {
        flagBtn = 2;
        $('#searchList').window('open')
    }

    function updateSj() {
        flagBtn = 3;
        $('#searchList').window('open')
    }

    function updateYz() {
        flagBtn = 4;
        $('#searchList').window('open')
    }

    function selected() {
        var rows = $("#searchListGrid").datagrid("getSelections");
        if (rows.length == 0) {
            $.messager.alert("提示", "请选择用户", "info");
            return;
        }
        if (rows.length > 1) {
            $.messager.alert("提示", "本页面是单选操作，只能选择选择一行数据更新", "info");
            return;
        }
        if (flagBtn == 1) {
            $("#addBmSjUserId").textbox('setValue', rows[0].userId);
            $("#addBmSjUserXm").textbox('setValue', rows[0].yhxxXm);
        } else if (flagBtn == 2) {
            $("#addBmYzUserId").textbox('setValue', rows[0].userId);
            $("#addBmYzUserXm").textbox('setValue', rows[0].yhxxXm);
        } else if (flagBtn == 3) {
            $("#updateBmSjUserId").textbox('setValue', rows[0].userId);
            $("#updateBmSjUserXm").textbox('setValue', rows[0].yhxxXm);
        } else if (flagBtn == 4) {
            $("#updateBmYzUserId").textbox('setValue', rows[0].userId);
            $("#updateBmYzUserXm").textbox('setValue', rows[0].yhxxXm);
        }
        $("#searchList").window('close');
    }

    function cancel() {
        $("#searchList").window('close');
    }

    function searchList() {
        $("#searchList").css({
            display: "block"
        });
    };
    $('#searchListGrid').datagrid({
        url: "../user/loadUserInfoPageList",
        idField: 'userId',
        columns: [[{
            field: 'userId',
            checkbox: true
        }, {
            field: 'userMc',
            title: '用户名',
            width: 80
        }, {
            field: 'yhxxXm',
            title: '姓名',
            width: 80
        }, {
            field: 'dnzwMc',
            title: '党内职务',
            width: 100
        }, {
            field: 'xzzwMc',
            title: '行政职务',
            width: 100
        }, {
            field: 'bmMc',
            title: '部门',
            width: 120
        }]],
        fitColumns: true,
        fit: true,
        border: true,
        rownumbers: true,
        pagination: true,
        pageList: [5, 10, 15, 20],
        pageSize: 10,
        pageNumber: 1,
        toolbar: [{
            id: 'button-add',
            text: '查询用户',
            iconCls: 'icon-add',
            handler: doSearchUser
        }],
        rownumbers: true,
        doPagination: function (pPageIndex, pPageSize) {
            //改变opts.pageNumber和opts.pageSize的参数值，用于下次查询传给数据层查询指定页码的数据
            var gridOpts = $('#searchListGrid').datagrid('options');
            gridOpts.pageNumber = pPageIndex;
            gridOpts.pageSize = pPageSize;
            Exec_Wait('searchListGrid', 'loadDateGrid()');
        }
    });
    $('#doSearchUserWindow').window({
        title: '查询用户',
        width: 800,
        modal: true,
        shadow: true,
        closed: true,
        height: 400,
        resizable: false
    });
    $("#userBtn").click(function () {
        var p = $("#searchUserForm").serializeJson();
        $("#searchListGrid").datagrid("load", p);
        $("#doSearchUserWindow").window("close");
    });

    function doSearchUser() {
        $('#searchDepartment').combobox({
            url: '../department/loadBm',
            valueField: 'bmId',
            textField: 'bmMc'
        });
        $('#doSearchUserWindow').window("open");
    };

    function loadDateGrid() {
        var gridOpts = $('#searchListGrid').datagrid('options');
        //定义查询条件
        var queryCondition = null;
        //异步获取数据到javascript对象，入参为查询条件和页码信息
        var oData = getAjaxDate(queryCondition, gridOpts);
        //使用loadDate方法加载Dao层返回的数据
        $('#searchListGrid').datagrid('loadData', {"total": oData.total, "rows": oData.rows});
    };

    //异步获取数据到javascript对象，入参为查询条件和页码信息
    function getAjaxDate(queryCondition, gridOpts) {
        $.post(
            "../user/loadUserInfoPageList",
            {
                page: gridOpts.pageNumber,
                pageSize: gridOpts.pageSize,
                name: queryCondition
            },
            function (data) {
                return data;
            }
        );
    };

    function Exec_Wait(grid, func, time) {
        var dalayTime = 500;
        __func_ = func;
        __selector_ = '#' + grid;
        $(__selector_).datagrid("loading");
        if (time) {
            dalayTime = time;
        }
        gTimeout = window.setTimeout(_Exec_Wait_, dalayTime);
    };

    function _Exec_Wait_() {
        try {
            eval(__func_);
        } catch (e) {
            alert("__func_:" + __func_ + ";_ExecWait_" + e.message);
        } finally {
            window.clearTimeout(gTimeout);
            $(__selector_).datagrid("loaded");
        }
    };

    // 图片上传
    function pictureUpload() {
        var formdata = new FormData();
        formdata.append('uploadFile', $('#uploadFile').get(0).files[0]);
        $.ajax({
            url: 'uploadLogo',
            type: 'post',
            data: formdata,
            contentType: false,
            processData: false,
            async: false,
            success: function (data) {
                $("#displayLogo").attr('src', data.data.src)
                $("#addbmLogo").val(data.data.src);
            },
            error: function (err) {
                $.messager.alert("提示", "上传失败", "info");
            }
        });
    };

    // 图片上传
    function pictureUploadUpdate() {
        var formdata = new FormData();
        formdata.append('uploadFile', $('#uploadFileUpdate').get(0).files[0]);
        $.ajax({
            url: 'uploadLogo',
            type: 'post',
            data: formdata,
            contentType: false,
            processData: false,
            async: false,
            success: function (data) {
                $("#displayLogoUpdate").attr('src', data.data.src)
                $("#addbmLogoUpdate").val(data.data.src);
            },
            error: function (err) {
                $.messager.alert("提示", "上传失败", "info");
            }
        });
    };

    // 添加
    <s:hasPermission name="dept-add">
        function doAdd() {
            $('#addDepartmentWindow').window("open");
        }
    </s:hasPermission>

    <s:hasPermission name="dept-update">
        function doEdit() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        console.log(rows);
        if (rows.length == 0) {
            $.messager.alert("提示", "请选择需要修改的行", "info");
            return;
        }
        if (rows.length > 1) {
            $.messager.alert("提示", "本页面是单选操作，只能选择选择一行数据更新", "info");
            return;
        }
        $("#bmId").next().hide();

        $("#updateDepartmentWindow").form("load", rows[0]);

        $("#updateDepartmentWindow #updateBmSjUserId").textbox("setValue",rows[0].bmSj.yhxxId);
        $("#updateDepartmentWindow #updateBmSjUserXm").textbox("setValue",rows[0].bmSj.yhxxXm);
        $("#updateDepartmentWindow #updateBmYzUserId").textbox("setValue",rows[0].bmYz.yhxxId);
        $("#updateDepartmentWindow #updateBmYzUserXm").textbox("setValue",rows[0].bmYz.yhxxXm);

        $('#updateDepartmentWindow').window("open");
    }
    </s:hasPermission>

    <s:hasPermission name="dept-udpdate-logo">
        function doEditLogo() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if (rows.length == 0) {
            $.messager.alert("提示", "请选择需要修改的行", "info");
            return;
        }
        if (rows.length > 1) {
            $.messager.alert("提示", "本页面是单选操作，只能选择选择一行数据更新", "info");
            return;
        }
        $("#updateDepartmentLogoWindow").form("load", rows[0]);
        //$("#updateDepartmentLogoWindow #updateBmSjUserId").textbox("setValue",rows[0].bmSj.yhxxId);
        $("#updateDepartmentLogoWindow #logobmSj").textbox("setValue",rows[0].bmSj.yhxxXm);
        //$("#updateDepartmentLogoWindow #updateBmYzUserId").textbox("setValue",rows[0].bmYz.yhxxId);
        $("#updateDepartmentLogoWindow #logobmYz").textbox("setValue",rows[0].bmYz.yhxxXm);
        $('#updateDepartmentLogoWindow').window("open");
    }
    </s:hasPermission>

    <s:hasPermission name="dept-delete">
        function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if (rows.length == 0) {
            //没有选中
            $.messager.alert("提示信息", "请选择需要删除审批部门！", "warning");
        } else {
            //选中
            $.messager.confirm("删除确认", "你确定要删除选中的审批部门吗？", function (r) {
                if (r) {
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for (var i = 0; i < rows.length; i++) {
                        //json对象
                        var Department = rows[i];
                        var id = Department.bmId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteBm/" + ids, function (date) {
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

    //工具栏
    var toolbar = [
        <s:hasPermission name="dept-add">
        {
            id: 'button-add',
            text: '增加部门',
            iconCls: 'icon-add',
            handler: doAdd
        },
        </s:hasPermission>

        <s:hasPermission name="dept-update">
        {
            id: 'button-edit',
            text: '修改部门',
            iconCls: 'icon-edit',
            handler: doEdit
        },
        </s:hasPermission>

        <s:hasPermission name="dept-udpdate-logo">
        {
            id: 'button-edit',
            text: '修改部门logo',
            iconCls: 'icon-edit',
            handler: doEditLogo
        },
        </s:hasPermission>

        <s:hasPermission name="dept-delete">
        {
            id: 'button-delete',
            text: '删除部门',
            iconCls: 'icon-cancel',
            handler: doDelete
        }
        </s:hasPermission>
         ];
    //定义列
    var columns = [[{
        field: 'bmId',
        checkbox: true
    }, {
        field: 'bmMc',
        title: '部门名称',
        width: 200
    }, {
        field: 'sjMc',
        title: '书记',
        width: 100
    }, {
        field: 'yzMc',
        title: '院长',
        width: 100
    }, {
        field: 'bmJs',
        title: '部门介绍',
        width: 500
    }]];

    $(function () {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility: "visible"
        });

        // 部门表格
        $('#grid').datagrid({
            iconCls: 'icon-forward',
            fit: true,
            border: true,
            rownumbers: true,
            striped: true,
            pageList: [5, 10, 15, 20],
            pageSize: 15,
            pagination: true,
            toolbar: toolbar,
            url: "getDeptList",
            idField: 'bmId',
            columns: columns,
            fitColumns: true
        });

        // 添加
        <s:hasPermission name="dept-add">
        $('#addDepartmentWindow').window({
            title: '添加部门',
            width: 800,
            modal: true,
            shadow: true,
            closed: true,
            height: 600,
            resizable: false
        });
        </s:hasPermission>

        <s:hasPermission name="dept-update">
        $('#updateDepartmentWindow').window({
            title: '修改部门',
            width: 800,
            modal: true,
            shadow: true,
            closed: true,
            height: 600,
            resizable: false
        });
        </s:hasPermission>

        // 
        <s:hasPermission name="dept-udpdate-logo">
        // 修改部门信息
        $('#updateDepartmentLogoWindow').window({
            title: '修改部门logo',
            width: 800,
            modal: true,
            shadow: true,
            closed: true,
            height: 600,
            resizable: false
        });
        </s:hasPermission>


        //定义一个工具方法，用于将指定的form表单中所有的输入项转为json数据{key:value,key:value}
        $.fn.serializeJson = function () {
            var serializeObj = {};
            var array = this.serializeArray();
            $(array).each(
                function () {
                    if (serializeObj[this.name]) {
                        if ($.isArray(serializeObj[this.name])) {
                            serializeObj[this.name].push(this.value);
                        } else {
                            serializeObj[this.name] = [
                                serializeObj[this.name], this.value];
                        }
                    } else {
                        serializeObj[this.name] = this.value;
                    }
                });
            return serializeObj;
        };

        $("#btn").click(function () {
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
