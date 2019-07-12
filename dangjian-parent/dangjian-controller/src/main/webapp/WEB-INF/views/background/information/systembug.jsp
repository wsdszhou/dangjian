<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>系统bug反馈</title>
</head>
<body>
    <s:hasRole name="admin">
        <div region="center" border="false"  style="width:100%;height:100%;soverflow:scroll;">
	        <table id="bugGrid" ></table>
	    </div>
    </s:hasRole>
    <s:lacksRole name="admin">
        <div style="width: 100%; height: 100%">
	        <a id="btn" href="#" style="margin-top: 50px;margin-left: 350px;" class="easyui-linkbutton" 
	           data-options="iconCls:'icon-save',width:200,height:50" onclick="javascript:add()">bug反馈或者系统建议</a>  
        </div>
        
        <div class="easyui-window" title="反馈信息" id="addbugWindow" collapsible="false" minimizable="false" 
            maximizable="false"style="top: 20px; left: 50px; width: 800px;height: 450px;"  
            data-options="modal:true,closed:true">
            <div style="height: 31px; overflow: hidden;" split="false" border="false">
                <div class="datagrid-toolbar">
                    <a id="addBug" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
                    <script type="text/javascript">
                        $(function() {
                            $("#addBug").click(function() {
                                //表单校验
                                var r = $("#addBugForm").form('validate');
                                if (r) {
                                	$.post("bug/add", $("#addBugForm").serialize(), function (data) {
                                	    	$.messager.alert("提示","您已经成功提交，我们将会尽快处理！","info");  
                                	    	$("#addBugForm").form('clear');
									});
                                    //提交之后自动关闭
                                    $("#addbugWindow").window("close");
                                }
                            });
                        });
                    </script>
                </div>
            </div>
             <div style="overflow: auto; padding: 5px;" border="false">
                <form id="addBugForm" method="post" action="add" >
                    <table class="table-edit" width="90%" align="center">
                        <tr class="title" >
                            <td colspan="2">反馈信息</td>
                        </tr>
                        <tr >
                            <td>标题</td>
                            <td>
                                <select id="btSelect" class="easyui-combobox" name="bt"  data-options="required:true,width:500">   
								    <option>系统bug反馈</option>   
								    <option>系统修改意见</option>   
								</select> 
                            </td>
                        </tr>
                        <tr >
                            <td>标题</td>
                            <td>
                                <input class="easyui-textbox" name="nr" data-options="required:true,width:500,multiline:true,height:150">
                            </td>
                        </tr>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </s:lacksRole>
    
 <script type="text/javascript">
 
 <s:lacksRole name="admin">
	 function add() {
	     $('#addbugWindow').window("open");
	 };
 </s:lacksRole>
 <s:hasRole name="admin">
	 $(function() {
	
	     // 部门通知数据表格
	     $('#bugGrid').datagrid({
	         iconCls : 'icon-forward',
	         fit : true,
	         border : true,
	         rownumbers : true, //显示一个行号列
	         striped : true, //显示斑马线效果
	         pageList : [ 5, 10, 15, 20 ],
	         pageSize : 10,
	         pagination : true,
	         url : "bug/getBugPageList",
	         idField : 'id',
	         columns : [ [ {
	             field : 'bt',
	             title : '标题',
	             width : 120,
	             align : 'center'
	         }, {
	             field : 'nr',
	             title : '内容',
	             width : 350,
	             align : 'center'
	         }, {
	             field : 'yhxxXm',
	             title : '发起者',
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
	             field : 'sj',
	             title : '提交时间',
	             width : 150,
	             align : 'center',
	             formatter: function(value,row,index){
	                 if (value != "" && value != null  && value != "null") {
	                     var datetime = new Date();
	                     datetime.setTime(value);
	                     var year = datetime.getFullYear();
	                     var month = datetime.getMonth() + 1 < 10 ? "0"
	                             + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
	                     var date = datetime.getDate() < 10 ? "0" + datetime.getDate()
	                             : datetime.getDate();
	                     var hour = datetime.getHours() < 10 ? "0" + datetime.getHours()
	                             : datetime.getHours();
	                     var minute = datetime.getMinutes() < 10 ? "0"
	                             + datetime.getMinutes() : datetime.getMinutes();
	                     var second = datetime.getSeconds() < 10 ? "0"
	                             + datetime.getSeconds() : datetime.getSeconds();
	                     return year + "-" + month + "-" + date + " " + hour + ":" + minute
	                             + ":" + second;
	                 } else {
	                     return "";
	                 }
	             }
	         }] ],
	         onClickCell:function(index,field,value){
	             // 查看详细内容
	             if ( field =="reading") {
	                 $(this).datagrid("selectRow",index);
	                 var currentRow = $(this).datagrid("getSelected");
	                 // 新开一个页面
	                 var tabsObj = parent.$('#tabs');
	                 var title = currentRow.nr;
	                 if ( tabsObj.tabs('exists', title)){
	                     tabsObj.tabs('select', title);
	                 } else {
	                     // 打开通知页面
	                     var newsContentPage = '<iframe src="/dangjian-controller/back/bug/'+currentRow.id+'"  scrolling="auto"  frameborder="0" style="width:100%;height:100%;"><h1>123456</h1></iframe>';
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
 </s:hasRole>
    
</script>   

</body>
</html>