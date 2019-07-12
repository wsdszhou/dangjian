<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>党务审批</title>
</head>
<body>
    <s:lacksRole name="admin">
	    <div region="center" border="false"  style="width:100%;height:100%;soverflow:scroll;">
	        <table id="publicityapprovalGrid"></table>
	    </div>
    </s:lacksRole>
    
<script type="text/javascript">
    
    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 部门通知数据表格
        $('#publicityapprovalGrid').datagrid({
            iconCls : 'icon-forward',
            fit : true,
            border : true,
            rownumbers : true, //显示一个行号列
            striped : true, //显示斑马线效果
            pageList : [ 5, 10, 15, 20 ],
            pageSize : 10,
            pagination : true,
            url : "getPublicityApprovalPageList",
            idField : 'tzfwId',
            columns : [ [ {
                field : 'tzBt',
                title : '通知标题',
                width : 120,
                align : 'center'
            }, {
                field : 'tzNr',
                title : '通知内容',
                width : 350,
                align : 'center'
            }, {
                field : 'fbrxm',
                title : '请求审批人姓名',
                width : 120,
                align : 'center'
            }, {
                field : 'reading',
                title : '阅读',
                width : 80,
                align : 'center',
                formatter: function(value,row,index){
                    return '<font color="red" style="cursor: pointer;">点击查看</font>';
                }
            }, {
                field : 'tzFbsj',
                title : '通知发布时间',
                width : 150,
                align : 'center'
            }] ],
            onClickCell:function(index,field,value){
                // 查看详细内容
                if ( field =="reading") {
                    $(this).datagrid("selectRow",index);
                    var currentRow = $(this).datagrid("getSelected");
                    // 新开一个页面
                    var tabsObj = parent.$('#tabs');
                    var title = currentRow.tzBt;
                    if ( tabsObj.tabs('exists', title)){
                        tabsObj.tabs('select', title);
                    } else {
                        // 打开通知页面
                        var newsContentPage = '<iframe src="/dangjian-controller/back/partyInfo/toDetail/'+currentRow.fbrid+'"  scrolling="auto"  frameborder="0" style="width:100%;height:100%;"><h1>123456</h1></iframe>';
                        tabsObj.tabs('add',{
                            title:title,
                            content:newsContentPage,
                            closable:true
                        });
                    }
                }
            }
        });
    });
</script>

</body>
</html>