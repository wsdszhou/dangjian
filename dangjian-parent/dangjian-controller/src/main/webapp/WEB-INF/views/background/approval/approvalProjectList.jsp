<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审批项目列表</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body class="easyui-layout" style="visibility: hidden;">

    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>
    
    <!-- 查询 -->
    <s:hasPermission name="approvalProject-search">
    <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
        <div style="overflow:auto;padding:5px;" border="false">
            <form id="searchForm">
                <table class="table-edit" width="80%" align="center">
                    <tr class="title">
                        <td colspan="2">查询条件</td>
                    </tr>
                    <tr>
                        <td>审批项目名称</td>
                        <td>
                            <input class="easyui-textbox" name="lcxmMc"/>
                        </td>
                    </tr>
                    <tr>
                        <td>审批项目描述</td>
                        <td>
                            <input class="easyui-textbox" name="lcxmXmms"/>
                        </td>
                    </tr>
                    <tr>
                        <td>选择审批流程</td>
                        <td>
                            <input class="easyui-combobox selectProcess" name="splcId"/>
                        </td>
                    </tr>
                    <tr>
                        <td>选择审批节点</td>
                        <td>
                            <input class="easyui-combobox selectNode" name="spjdId"/>
                        </td>
                    </tr>
                    <tr>
                        <td>选择审批结果</td>
                        <td>
                            <select id="cc" class="easyui-combobox" name="lcxmResulte" style="width:200px;">   
                                <option value="0"  selected="selected">待审批</option>     
                                <option value="1">审批结束</option>   
                            </select>
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
    
    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除审批项目！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的审批项目吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var approval = rows[i];
                        var id = approval.lcxmId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteApprovalProjectBatch/"+ids, function (date) {
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
		// 加载审批流程
		$('.selectProcess').combobox({    
			url: '../loadApprovalProcess',    
			valueField:'splcId',    
			textField:'splcMc',
			onSelect: function(rec){    
				// 加载审批节点
                $('.selectNode').combobox({    
                    url: '../node/loadNodeApproval/' + rec.splcId,    
                    valueField:'spjdId',    
                    textField:'spjdMc',
                    onSelect: function(rec){    
                        
                    }
                }); 
	        }
		}); 
		// 加载审批节点
		$('.selectNode').combobox({    
			url: '../node/loadNodeApproval/' + 0,    
			valueField:'spjdId',    
			textField:'spjdMc',
			onSelect: function(rec){    
				
			}
		}); 
		$('#searchWindow').window("open");
		
    }

    //工具栏
    var toolbar = [ 
	    <s:hasPermission name="approvalProject-delete">
		    {
		        id : 'button-delete',
		        text : '删除审批项目',
		        iconCls : 'icon-cancel',
		        handler : doDelete
		    }, 
	    </s:hasPermission>	
	    <s:hasPermission name="approvalProject-search">
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
        field : 'lcxmId',
        checkbox : true,
    }, {
        field : 'lcxmMc',
        title : '审批项目名称',
        width : 120,
        align : 'center'
    }, {
        field : 'lcxmXmms',
        title : '审批项目描述',
        width : 120,
        align : 'center'
    }, {
        field : 'splcMc',
        title : '审批流程名称',
        width : 120,
        align : 'center'
    }, {
        field : 'spjdMc',
        title : '审批节点名称',
        width : 120,
        align : 'center'
    }, {
        field : 'spgwSpgwmc',
        title : '审批岗位名称',
        width : 120,
        align : 'center'
    }, {
        field : 'lcxmResulte',
        title : '当前审批结果',
        width : 120,
        align : 'center',
		formatter: function(value,row,index){
				if ( value === 0){
					return '未审批完成';
				} else {
					return '审批完成';
				}
			}

    }] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 审批项目数据表格
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
            url : "getApprovalProjectPageList",
            idField : 'lcxmId',
            columns : columns,
            fitColumns : true
        });

       
        // 查询
        $('#searchWindow').window({
            title : '查询分区',
            width : 400,
            modal : true,
            shadow : true,
            closed : true,
            height : 400,
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