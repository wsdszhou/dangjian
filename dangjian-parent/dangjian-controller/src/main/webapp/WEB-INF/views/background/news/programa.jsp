<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<html>
<head>
	<title>新闻栏目管理</title>
	<%@include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body class="easyui-layout">
	<tabel id="newsProgramList" style="width:100%;height:100%;"></tabel>
	
	<div id="tb">
		<s:hasPermission name="column-add">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="add" onclick="obj.add()">添加同级栏目</a>

            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="insert"
               onclick="obj.insert()">插入</a>
        </s:hasPermission>

        <s:hasPermission name="column-update">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="edit" onclick="obj.edit()">编辑</a>

            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="cancelEdit"
               style="display: none" onclick="obj.cancelEdit()">取消编辑</a>
        </s:hasPermission>

		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" id="cancel"
		   style="display: none" onclick="obj.cancel()">取消</a>
		
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" id="save" style="display: none"
		   onclick="obj.save()">保存</a>
		
        <s:hasPermission name="column-delete">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="delete"
               onclick="obj.delete()">删除</a>
        </s:hasPermission>

		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" id="refresh"
		   onclick="obj.refresh()">刷新</a>
		   
	</div>

</body>
<script>
    $(function () {
        //全局对象
        obj = {
            editFlag: false,	//编辑标志，标志是否有正在编辑的行
            editRowId: '',	//正在编辑的行号
            add: function () {
                if (!this.editFlag) {
                    var node = newsProgramList.treegrid('getSelections');
                    if (node.length > 1 || node.length === 0) {
                        $.messager.alert("提示", "请选择添加的位置");
                        return
                    }
                    this.editRowId = new Date().getTime();
                    newsProgramList.treegrid('append', {
                        parent: node[0].lmFid,
                        data: [{
                            lmId: this.editRowId,
                            lmMc: '',
                            lmMs: ''
                        }]
                    });
                    newsProgramList.treegrid('beginEdit', this.editRowId);
                    $("#add,#insert,#edit,#delete").hide();
                    $("#cancel,#save").show();
                    this.editFlag = true;
                }
            },
            cancel: function () {
                if (this.editRowId !== '') {
                    newsProgramList.treegrid('remove', this.editRowId);
                    newsProgramList.treegrid('uncheckAll');
                    $("#add,#insert,#edit,#delete").show();
                    $("#cancel,#save").hide();
                    this.editFlag = false;
                    this.editRowId = '';
                }
            },
            edit: function () {
                var nodes = newsProgramList.treegrid('getSelections');
                if (nodes.length > 1 || nodes.length === 0) {
                    $.messager.alert("提示", "请选择一条记录进行编辑");
                    return
                }
                this.editRowId = nodes[0].lmId;
                this.editFlag = true;
                newsProgramList.treegrid('beginEdit', this.editRowId);
                $("#add,#delete,#insert,#edit").hide();
                $("#cancelEdit,#save").show();
            },
            cancelEdit: function () {
                if (this.editRowId !== '') {
                    newsProgramList.treegrid('cancelEdit', this.editRowId);
                    newsProgramList.treegrid('uncheckAll');
                    $("#add,#insert,#edit,#delete").show();
                    $("#cancelEdit,#save").hide();
                    this.editFlag = false;
                    this.editRowId = '';
                }
            },
            insert: function () {
                if (!this.editFlag) {
                    var node = newsProgramList.treegrid('getSelections');
                    if (node.length > 1 || node.length === 0) {
                        $.messager.alert("提示", "请选择插入的位置");
                        return
                    }
                    this.editRowId = new Date().getTime();
                    newsProgramList.treegrid('append', {
                        parent: node[0].lmId,
                        data: [{
                            lmId: this.editRowId,
                            lmMc: '',
                            lmMs: ''
                        }]
                    });
                    newsProgramList.treegrid('beginEdit', this.editRowId);
                    $("#add,#insert,#edit,#delete").hide();
                    $("#cancel,#save").show();
                    this.editFlag = true;
                }
            },
            save: function () {
                if (this.editRowId !== '' && this.editFlag) {
                    newsProgramList.treegrid('endEdit', this.editRowId);
                    this.editFlag = false;
                    this.editRowId = '';
                    $("#add,#insert,#edit,#delete").show();
                    $("#cancel,#save,#cancelEdit").hide();
                }
            },
            refresh: function () {
                newsProgramList.treegrid('reload');
            },
            delete: function () {
                var row = newsProgramList.treegrid('getSelected');
				if(row.lmFid === 0){
					$.messager.alert("错误","顶级栏目不能删除！");
					return;
				}
                var nodes = newsProgramList.treegrid("getChildren", row.lmId);
                console.log(nodes);
                var data = [];
                data.push(row.lmId);
                for (var i = 0; i < nodes.length; i++) {
                    data.push(nodes[i].lmId);
                }

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath }/newsProgramManage/deleteProgram",
                    data: {
                        lmId: data.join(",")
                    },
                    success: function (result) {
                        newsProgramList.treegrid('remove', row.lmId);
                        $.messager.show({
                            title: "提示",
                            msg: result.msg
                        })
                    }
                });

            }

        };

        /**
         *    树形网格属性设置
         *
         */
        var newsProgramList = $('#newsProgramList').treegrid({
            url: '${pageContext.request.contextPath }/newsProgramManage/getlist',
            idField: 'lmId',
            treeField: 'lmMc',
            onlyLeafCheck: true,
            autoRowHeight: false,
            singleSelect: true,
            showHeader: true,
            fitColumns: true,
            showFooter: false,
            cascadeCheck: true,	//级联检查
            showLines: true,	//显示行号
            animate: true,		//列表项展开/收缩动画
            columns: [[		//列名
                {field: 'lmId', title: 'ID', checkbox: true},
                {field: 'lmMc', title: '栏目名称', editor: {type: 'validatebox', options: {required: true}}},
                {field: 'lmMs', title: '栏目描述', editor: {type: 'text'}},
                {field: 'lmXgsj', title: '栏目修改时间'}
            ]],
            toolbar: '#tb',
            loadFilter(data) {
                return replaceJsonAll(data, /childrenList/g, "children");
            },
            onAfterEdit: function (row, change) {
                //添加事件
                if(row.lmId > 999999999){
                    $.post("${pageContext.request.contextPath }/newsProgramManage/addProgram",{
                        lmId:row.lmId,
                        lmMc:row.lmMc,
                        lmMs:row.lmMs,
                        lmFid:row._parentId
                    },function (data,status) {
                        newsProgramList.treegrid('reload');
                        $.messager.show({
                            title:'提示',
                            msg:data.msg
                        })
                    });
				}else {
                    $.post("${pageContext.request.contextPath }/newsProgramManage/updateProgram",{
                        lmId:row.lmId,
                        lmMc:row.lmMc,
                        lmMs:row.lmMs
                    },function (data,status) {
                        newsProgramList.treegrid('reload');
                        $.messager.show({
                            title:'提示',
                            msg:data.msg
                        })
                    });
				}

            }
        })
    });

</script>
</html>
