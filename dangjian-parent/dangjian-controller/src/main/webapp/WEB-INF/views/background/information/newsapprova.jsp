<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>审批</title>
</head>
<body>
    <s:lacksRole name="admin">
	    <s:hasPermission name="news-add">
		    <!-- 新闻评论精选审批 -->
	        <div region="center" border="false"  style="width:100%;height:70%;">
	            <table id="newsCommentGrid" ></table>
	        </div>
	        <div class="easyui-window" title="新闻评论精选审批" id="addWindow" collapsible="false" minimizable="false" 
	            maximizable="false"style="top: 20px; left: 50px; width: 800px;height: 450px;"  data-options="modal:true,closed:true">
	            <div style="overflow: auto; padding: 5px;" border="false">
	                <form id="commentForm" method="post"  >
			            <table class="table-edit" width="90%" align="center">
			                <tr class="title" >
			                    <td colspan="2">评论内容详细信息</td>
			                    <input id="commentId" name="id" type="hidden"  />
			                </tr>
			                <tr >
			                    <td>新闻标题</td>
			                    <td>
			                         <input name="xwBt" class="easyui-textbox" data-options="required:true,width:500" />
			                    </td>
			                </tr>
			                <tr >
			                    <td>评论人</td>
			                    <td>
			                         <input name="plUsername" class="easyui-textbox" data-options="required:true,width:500" />
			                    </td>
			                </tr>
			                <tr >
			                    <td>内容</td>
			                    <td>
			                        <input class="easyui-textbox" name="zw" data-options="required:true,width:500,multiline:true,height:150">
			                    </td>
			                </tr>
			            </table>
		            </form>
			        <div style="width: 276px; height: 105px; margin:auto;">
			            <span style="width: 100px;height: 50px;  padding:15px; margin-right:5px; border-radius:10px; background-color:red; font-size: 30px;line-height: 50px; cursor: pointer;" onclick="agree()">通过</span>
			            <span style="width: 100px;height: 50px;  padding:15px; margin-left:5px;  border-radius:10px; background-color:red; font-size: 30px;line-height: 50px; cursor: pointer;" onclick="disagree()">不通过</span>
			        </div>
	            </div>
	        </div>
	    </s:hasPermission>
    </s:lacksRole>
    
    <s:lacksRole name="admin">
	    <s:hasPermission name="news-add">
			<!-- 新闻文章审批 -->
			<div region="center" border="false"  style="width:100%;height:100%;soverflow:scroll;">
				<table id="newsapprovaGrid" ></table>
			</div>
	    </s:hasPermission>
    </s:lacksRole>
    
<script type="text/javascript">
// 新闻评论精选审批
<s:hasPermission name="news-add">
var commentId = -1;
//同意审批
var btn = 1;
function agree() {
	if (btn == 1) {
		$.post("approval/project/commentAgree", {
			commentId : $("#commentId").val()
		}, function(data) {
			if (data == 200) {
				$.messager.alert("提示信息", "提交审批完成", "info");
				btn = 0;
			} else {
				$.messager.alert("提示信息", "提交审批失败", "warning");
				btn = 0;

			}
		}); 
	}
};
// 不同意审批
function disagree() {
	if (btn == 1) {
		$.post("approval/project/commentDisagree", {
			commentId : $("#commentId").val()
		}, function(data) {
			if (data == 200) {
				$.messager.alert("提示信息", "提交审批完成", "info");
				btn = 0;
			} else {
				$.messager.alert("提示信息", "提交审批失败", "warning");
				btn = 0;
			}
		}); 
	}
};
$(function() {
	// 先将body隐藏，再显示，不会出现页面刷新效果
	$("body").css({
		visibility : "visible"
	});

	// 新闻评论数据表格
	$('#newsCommentGrid').datagrid({
		iconCls : 'icon-forward',
		fit : true,
		border : true,
		rownumbers : true, //显示一个行号列
		striped : true, //显示斑马线效果
		pageList : [ 5, 10, 15, 20 ],
		pageSize : 5,
		pagination : true,
		url : "getNewsCommentPageList",
		idField : 'tzId',
		columns : [ [
			{
				field : 'tzBt',
				title : '通知标题',
				width : 120,
				align : 'center'
			},
			{
				field : 'tzNr',
				title : '通知内容',
				width : 350,
				align : 'center'
			},
			{
				field : 'fbrxm',
				title : '发布人名称',
				width : 120,
				align : 'center'
			},
			{
				field : 'reading',
				title : '审批评论',
				width : 80,
				align : 'center',
				formatter : function(value, row, index) {
					return '<font color="red" style="cursor: pointer;">点击审批</font>';
				}
			},
			{
				field : 'tzFbsj',
				title : '通知发布时间',
				width : 150,
				align : 'center'
			} ] ],
			onClickCell : function(index, field, value) {
				// 查看详细内容
				if (field == "reading") {
					$(this).datagrid("selectRow", index);
					var currentRow = $(this).datagrid("getSelected");
					// 加载表单
				    $('#commentForm').form('load','../back/news/getViewNewsCommentByNoticeId/' + currentRow.tzId ); 
					$('#addWindow').window("open");
				}
			}
		});
	});
</s:hasPermission>
	// 新闻文章审批
<s:hasPermission name="news-add">
	$(function() {
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({
			visibility : "visible"
		});

		// 部门通知数据表格
		$('#newsapprovaGrid').datagrid({
			iconCls : 'icon-forward',
			fit : true,
			border : true,
			rownumbers : true, //显示一个行号列
			striped : true, //显示斑马线效果
			pageList : [ 5, 10, 15, 20 ],
			pageSize : 5,
			pagination : true,
			url : "getNewsApprovalPageList",
			idField : 'tzId',
			columns : [ [
				{
					field : 'tzBt',
					title : '通知标题',
					width : 120,
					align : 'center'
				},
				{
					field : 'tzNr',
					title : '通知内容',
					width : 350,
					align : 'center'
				},
				{
					field : 'fbrxm',
					title : '发布人名称',
					width : 120,
					align : 'center'
				},
				{
					field : 'reading',
					title : '阅读新闻',
					width : 80,
					align : 'center',
					formatter : function(value, row, index) {
						return '<font color="red" style="cursor: pointer;">点击查看</font>';
					}
				},
				{
					field : 'tzFbsj',
					title : '通知发布时间',
					width : 150,
					align : 'center'
				} ] ],
			onClickCell : function(index, field, value) {
				// 查看详细内容
				if (field == "reading") {
					$(this).datagrid("selectRow", index);
					var currentRow = $(this).datagrid(
							"getSelected");
					// 新开一个页面
					var tabsObj = parent.$('#tabs');
					var title = currentRow.tzNr;
					if (tabsObj.tabs('exists', title)) {
						tabsObj.tabs('select', title);
					} else {
						// 打开通知页面
						var newsContentPage = '<iframe src="/dangjian-controller/back/news/notice/'
								+ currentRow.tzId
								+ '"  scrolling="auto"  frameborder="0" style="width:100%;height:100%;"><h1>123456</h1></iframe>';
						tabsObj.tabs('add', {
							title : title,
							content : newsContentPage,
							closable : true
						});
					}
				}
			}
		});
	});
	</s:hasPermission>
</script>

</body>
</html>