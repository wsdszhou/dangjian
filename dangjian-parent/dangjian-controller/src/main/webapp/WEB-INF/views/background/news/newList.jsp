<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 设置请求编码
    request.setCharacterEncoding("UTF-8");
    // 初始化富文本编辑器中的内容
    String htmlData = request.getParameter("xwZw") != null ? request.getParameter("xwZw") : "";
%>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>党建宣传</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 引入富文本依赖的js与css -->
<%@include file="/WEB-INF/views/include/kindeditorHeader.jsp"%>
<style type="text/css">
.selectLm {
    position: absolute;
    top: 2px;
    left: 250px;
    z-index: 99;
}

.selectLm span {
    font-family: arial,sans-serif;
    font-size: 14px;
    line-height: 32px; 
    color: #0000FF;
}

</style>

</head>
<body class="easyui-layout" style="visibility: hidden;">
    
    <!-- 栏目下拉框 -->
    <div class="selectLm">
        <span>选择新闻父栏目:&nbsp;</span> 
        <input id="firstLm" class="easyui-combobox "/>&nbsp;&nbsp;
            
        <span >选择新闻子栏目:&nbsp;</span> 
        <input id="childrenLm" class="easyui-combobox " data-options="required:true" name="lmId" />
    </div>
    
    <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid"></table>
    </div>
    
    <!-- 添加新闻 -->
    <s:hasPermission name="news-add">
        <div class="easyui-window" title="添加新闻" id="addNewsWindow"
             collapsible="false" minimizable="false" maximizable="false"
             style="top: 20px; left: 50px">
            <div style="height: 31px; overflow: hidden;" split="false" border="false">
                <div class="datagrid-toolbar">
                    <a id="addNews" icon="icon-save" href="#" class="easyui-linkbutton"
                       plain="true">保存</a>
                    <script type="text/javascript">
                        $(function() {
                            $("#addNews").click(function() {
                                editor.sync();
                                $.post(
                                     "../news/saveNews", 
                                     $("#addNewsForm").serializeJson(),
                                     function (date) {
                                         if(date.error == 0){
                                             $("#addNewsWindow").window("close");
                                             $("#grid").datagrid('reload');
                                             $("#addNewsForm").form('clear');
                                         }else {
                                             $.messager.alert("提示信息","发布失败！","warning");
                                             $("#addNewsWindow").window("close");
                                         }
                                     }
                                 );
                            });
                        });
                    </script>
                </div>
            </div>
            <div style="overflow: auto; padding: 5px;" border="false">
                <form id="addNewsForm" method="post" action="../news/saveNews" >
                    <table class="table-edit" width="100%" >
                        <tr>
                            <td width="80" align="right">新闻标题</td>
                            <td colspan="7">
                                <input style="width:80%" class="easyui-textbox" name="xwBt" data-options="required:true">
                            </td>
                        </tr>
                        <tr>
                            <td width="80" align="right">作者</td>
                            <td width="16%">
                                <input  class="easyui-textbox" name="xwYhm" data-options="required:true,editable:false" value="${viewYhxx.yhxxXm }">
                            </td>
                            <td width="50" align="right">编辑部门</td>
                            <td width="16%">
                                <input  class="easyui-textbox" name="xwBmmc" data-options="required:true,editable:false"  value="${viewYhxx.bmMc }"  >
                            </td>
                            <td width="100"> 
                                <span>&nbsp;&nbsp;  是否置顶</span>
                                <input type="radio" name="xwYxj"  data-options="required:true" value="1" >
                            </td>
                            <td width="120">
                                <span> &nbsp;&nbsp;  是否编辑完成</span>
                                <input type="radio" name="xwXwztdm.xwztId"  data-options="required:true" value="2" >
                            </td>
                            <td width="90">上传新闻缩略图</td>
                            <td width="150">
                                <form action="" method="post" enctype="multipart/form-data" width="150">
                                    <input id="addUploadFile" type="file" name="uploadFile" width="150" >
                                </form>
                                <input id="addNewsPicture" type="hidden" name="xwSlt" value="" data-options="required:true">
                            </td>
                            <td><input  type="button" onclick="pictureUploadAdd()" value="上传图片"></td>
                        </tr>
                    </table>
                    <!-- 富文本编辑器 -->
                    <textarea id="content" name="xwZw" cols="100" rows="8" style="width:100%;height:500px;visibility:hidden;">
                </textarea>
                </form>
            </div>
        </div>
    </s:hasPermission>

    <!-- 修改新闻 -->
    <s:hasPermission name="news-update">
        <div class="easyui-window" title="修改新闻" id="updateNewsWindow"
             collapsible="false" minimizable="false" maximizable="false"  style="top: 20px; left: 50px">
            <div style="height: 31px; overflow: hidden;" split="false" border="false">
                <div class="datagrid-toolbar">
                    <a id="updateNews" icon="icon-save" href="#" class="easyui-linkbutton"
                       plain="true">保存</a>
                    <script type="text/javascript">
                        $(function() {
                            $("#updateNews").click(function() {
                                editor2.sync();
                                //表单校验
                                $.post(
                                     "../news/updateNews", 
                                     $("#updateNewsForm").serializeJson(),
                                     function (date) {
                                         if(date.error == 0){
                                             $("#updateNewsWindow").window("close");
                                             $("#grid").datagrid('reload');
                                         }else {
                                             $.messager.alert("提示信息","发布失败！","warning");
                                             $("#updateNewsWindow").window("close");
                                         }
                                     }
                                 );
                            });
                        });
                    </script>
                </div>
            </div>
            <div style="overflow: auto; padding: 5px;" border="false">
                <form id="updateNewsForm" method="post" action="../news/updateNews" >
                    <input type="hidden" name="xwId" >
                    <table class="table-edit" width="100%" >
                        <tr>
                            <td width="80" align="right">新闻标题</td>
                            <td colspan="7">
                                <input style="width:80%" class="easyui-textbox" name="xwBt" data-options="required:true">
                            </td>
                        </tr>
                        <tr>
                            <td width="80" align="right">作者</td>
                            <td width="16%">
                                <input  class="easyui-textbox" name="xwYhm" data-options="required:true,editable:false" value="${viewYhxx.yhxxXm }">
                            </td>
                            <td width="50" align="right">编辑部门</td>
                            <td width="16%">
                                <input  class="easyui-textbox" name="xwBmmc" data-options="required:true,editable:false"  value="${viewYhxx.bmMc }"  >
                            </td>
                            <td width="100"> 
                                <span>&nbsp;&nbsp;  是否置顶</span>
                                <input type="radio" name="xwYxj"  data-options="required:true" value="1" >
                            </td>
                            <td width="120">
                                <span> &nbsp;&nbsp;  是否编辑完成</span>
                                <input id="updateNewsRadio" type="radio" name="xwXwztdm.xwztId"   data-options="required:true" value="2">
                            </td>
                            <td width="90">上传新闻缩略图</td>
                            <td width="150">
                                <form action="" method="post" enctype="multipart/form-data" width="150">
                                    <input id="updateUploadFile" type="file" name="uploadFile" width="150" >
                                </form>
                                <input id="updateNewsPicture" type="hidden" name="xwSlt" value="" data-options="required:true">
                            </td>
                            <td><input  type="button" onclick="pictureUploadUpdate()" value="上传图片"></td>
                        </tr>
                    </table>
                    <!-- 富文本编辑器 -->
                    <textarea id="content2" name="xwZw" cols="100" rows="8" style="width:100%;height:500px;visibility:hidden;">
                </textarea>
                </form>
            </div>
        </div>
    </s:hasPermission>

    <!-- 新闻查询 -->
    <s:hasPermission name="news-search">
        <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
            <div style="overflow:auto;padding:5px;" border="false">
                <form id="searchForm">
                    <table class="table-edit" width="80%" align="center">
                        <tr class="title">
                            <td colspan="2">查询条件</td>
                        </tr>
                        <tr>
                            <td>新闻标题</td>
                            <td>
                                <input  class="easyui-textbox"  data-options="width:500" name="xwBt" />
                            </td>
                        </tr>
                        <tr>
                            <td>所属部门名称</td>
                            <td>
                                <input id="bmBox" class="easyui-combobox"  data-options="width:500"  name="bmId"  />
                            </td>
                        </tr>
                        <tr>
                            <td>新闻状态</td>
                            <td>
                                <input id="ztBox" class="easyui-combobox" data-options="width:500"  name="xwztId"/>
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


<!-- 栏目复选框js脚本 -->
<script type="text/javascript">

     // 用于判断是否为首次加载
     var isFirstLoad = 1;
     var currentLmId = '${currentLmId}';
     // 加载父栏目
     $("#firstLm").combobox({
        url:'../news/lm/loadFirstLmList',   
        valueField:'lmId',    
        textField:'lmMc',
        onSelect: function(rec){    
             $('#childrenLm').combobox({    
                 url:'../news/lm/loadChildrenLmList?id=' + rec.lmId,    
                 valueField:'lmId',    
                 textField:'lmMc',
             }); 
             isFirstLoad = 0;
         },
         onLoadSuccess: function(){    
             var val = $(this).combobox('getData');
             $(this).combobox("select", val[0].lmId);
          }
     });
     $('#childrenLm').combobox({  
         onLoadSuccess: function(){    
             var val = $(this).combobox('getData'); 
             if(currentLmId=="" || currentLmId==null || currentLmId=='null'){
            	 $(this).combobox("select", val[0].lmId);
            	 currentLmId =  val[0].lmId;
             }else{
            	 if (isFirstLoad == 0) {
            		 $(this).combobox("select", val[0].lmId);
            		 return ;
				 }
             }
         },
         onBeforeLoad: function(){
            if (isFirstLoad == 1) {
				return false;
			} else {
				return true;
			} 
         },
         onSelect : function(rec){
        	 // 加载新闻列表
        	 if (isFirstLoad == 0) {
        		 $('#grid').datagrid({url:"loadNewsPage/" + rec.lmId});
			}
         }
     });
     
     <s:hasPermission name="news-add">
     function doAdd() {
         $('#addNewsWindow').window("open");
     }
     // 上传新闻缩略图
     function pictureUploadAdd() {
         var formdata=new FormData();
         formdata.append('uploadFile',$('#addUploadFile').get(0).files[0]);
         $.ajax({
             url:'uploadCorePicture',
             type:'post',
             data:formdata,
             contentType:false,
             processData:false,
             async:false,
             success:function(data){ 
            	 if (data.error == 0) {
	                 $("#addNewsPicture").val(data.data);
				 } else {
					 $.messager.alert("提示","上传失败","info");
				}
             },
             error:function(err){
                 $.messager.alert("提示","上传失败,请联系管理员","info");
             }
         });
     };
     </s:hasPermission>

     <s:hasPermission name="news-update">
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
         editor2.html(rows[0].xwNr);
         if(rows[0].xwXwztdm.xwztId != 1){
             $("#updateNewsRadio").attr('checked','checked');
         }
         $("#updateNewsForm").form("load", rows[0]);
         $('#updateNewsWindow').window("open");
     }
     function pictureUploadUpdate() {
         var formdata=new FormData();
         formdata.append('uploadFile',$('#updateUploadFile').get(0).files[0]);
         $.ajax({
             url:'uploadCorePicture',
             type:'post',
             data:formdata,
             contentType:false,
             processData:false,
             async:false,
             success:function(data){ 
                 if (date.error == 0) {
                     $("#updateNewsPicture").val(data.data);
                 } else {
                     $.messager.alert("提示","上传失败","info");
                }
             },
             error:function(err){
                 $.messager.alert("提示","上传失败,请联系管理员","info");
             }
         });
     };
     </s:hasPermission>

     <s:hasPermission name="news-delete">
     function doDelete() {
         //获取数据表格中所有选中的行(数据)
         var rows = $("#grid").datagrid("getSelections");
         if(rows.length == 0){
             //没有选中
             $.messager.alert("提示信息","请选择需要删除新闻！","warning");
         }else{
             //选中
             $.messager.confirm("删除确认","你确定要删除选中的新闻吗？",function(r){
                 if(r){
                     //创造一个数组
                     var array = new Array();
                     //通过循环获取id
                     for(var i=0;i<rows.length;i++){
                         //json对象
                         var News = rows[i];
                         var id = News.xwId;
                         //保存在我们的数组里面
                         array.push(id);
                     }
                     var ids = array.join(",");
                     $.post("../news/deleteNewsBatch/"+ids,function (date) {
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
     </s:hasPermission>

    <s:hasPermission name="news-search">
	     function doSearch() {
	          // 加载部门
	         $("#bmBox").combobox({
	             url:'../department/loadBm', 
	             valueField:'bmId',    
	             textField:'bmMc',   
	         });
	         
	         // 加载新闻状态
	         $("#ztBox").combobox({
	             url:'../news/loadNewsState', 
	             valueField:'xwztId',    
	             textField:'xwztMc',
	         });
	         $('#searchWindow').window("open");
	     }
     </s:hasPermission>


    //工具栏
    var toolbar = [
        <s:hasPermission name="news-search">
        {
            id : 'button-search',
            text : '查询',
            iconCls : 'icon-search',
            handler : doSearch
        },
        </s:hasPermission>

        <s:hasPermission name="news-add">
        {
            id : 'button-add',
            text : '增加',
            iconCls : 'icon-add',
            handler : doAdd
        },
        </s:hasPermission>

        <s:hasPermission name="news-update">
        {
            id : 'button-edit',
            text : '修改',
            iconCls : 'icon-edit',
            handler : doEdit
        },
        </s:hasPermission>

        <s:hasPermission name="news-delete">
        {
            id : 'button-delete',
            text : '删除',
            iconCls : 'icon-cancel',
            handler : doDelete
        }
        </s:hasPermission>

         ];

    //定义列
    var columns = [ [ {
        field : 'xwId',
        checkbox : true,
    }, {
        field : 'xwBt',
        title : '新闻标题',
        width : 280,
        align : 'center'
    }, {
        field : 'xwYhm',
        title : '发布人',
        width : 80,
        align : 'center'
    }, {
        field : 'xwBmmc',
        title : '发布人所属部门名称',
        width : 150,
        align : 'center'
    } , {
        field : 'xwXgsj',
        title : '发布时间',
        width : 120,
        align : 'center'
    }, {
        field : 'xwztMc',
        title : '新闻状态',
        width : 80,
        align : 'center'
    }, {
        field : 'xwSfpl',
        title : '评论',
        width : 80,
        align : 'center',
        formatter: function(value,row,index){
            console.log(value)
            if ( value == 1 ){
                return "<font color='red' >点击关闭</font>";
            } else {
                return "<font color='red' >点击开启</font>";
            }
        }
    }, {
        field : 'xwNr',
        title : '内容',
        width : 80,
        align : 'center',
        formatter: function(value,row,index){
        	return '<font color="red">点击查看</font>';
        }

    }, {
        field : 'xwYdrs',
        title : '阅读人数',
        width : 80,
        align : 'center'
    }] ];
    
    function onDetail() {
        alert("测试成功");		
	}

    $(function() {
    	 // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        }); 
    	$('#grid').datagrid({
            iconCls : 'icon-forward',
            fit : true,
            border : true,
            rownumbers : true,
            striped : true,
            pageList : [ 5, 10, 15, 20 ],
            pageSize : 10,
            pagination : true,
            toolbar : toolbar,
            url : "loadNewsPage/" + currentLmId,
            idField : 'xwId', 
            columns : columns,
            fitColumns : true,
            onClickCell:function(index,field,value){
                
                // 查看详细内容
                if ( field =="xwNr") {
                    $(this).datagrid("selectRow",index);
                    var currentRow = $(this).datagrid("getSelected");
                    
                    // 新开一个页面
                    var tabsObj = parent.$('#tabs');
                    var title = currentRow.xwBt;
                    if ( tabsObj.tabs('exists', title)){
                        tabsObj.tabs('select', title);
                    } else {
                        var newsContentPage = '<iframe src="/dangjian-controller/back/news/'+currentRow.xwId+'"  scrolling="auto"  frameborder="0" style="width:100%;height:100%;"><h1>123456</h1></iframe>';
                        tabsObj.tabs('add',{
                            title:title,
                            content:newsContentPage,
                            closable:true
                        });
                    }
                }
                // 开启关闭关闭评论
                if(field == 'xwSfpl'){
                    $(this).datagrid("selectRow",index);
                    var currentRow = $(this).datagrid("getSelected");
                    if(currentRow.xwSfpl == 1 ){
                        // 关闭评论
                        $.ajax({
                            type: "POST",
                            url: "closeComment/" + currentRow.xwId ,
                            success: function(msg){
                                $.messager.alert("提示信息","关闭评论成功","info");
                            },
                            error:function(msg){
                                $.messager.alert("提示信息","关闭评论失败","warning");
                            }
                         });
                         $(this).datagrid("reload");
                    } else {
                        // 开启评论
                        $.ajax({
                            type: "POST",
                            url: "openComment/" + currentRow.xwId ,
                            success: function(msg){
                                $.messager.alert("提示信息","开启评论成功","info");
                            },
                            error:function(msg){
                                $.messager.alert("提示信息","开启评论失败","warning");
                            }
                         });
                         $(this).datagrid("reload");
                    }
                }
            }
        });
        // 添加
        <s:hasPermission name="news-add">
        $('#addNewsWindow').window({
            title : '添加',
            width : 1200,
            modal : true,
            shadow : true,
            closed : true,
            height : 650,
            resizable : false
        });
        </s:hasPermission>

        
        // 修改
        <s:hasPermission name="news-update">
        $('#updateNewsWindow').window({
            title : '修改',
            width : 1200,
            modal : true,
            shadow : true,
            closed : true,
            height : 650,
            resizable : false
        });
        </s:hasPermission>


        // 查询
        <s:hasPermission name="news-search">
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
//富文本编辑器js脚本 
KindEditor.ready(function(K) {  // 将指定函数绑定到DOM加载完成事件(DOMContentLoaded)上
     editor = K.create('textarea[id="content"]', { // 去到指定的富文本编辑器
        cssPath : '../../kindeditor/plugins/code/prettify.css',  // css样式的根目录
        //newlineTag: "br", // 设置br换行
        uploadJson : '${pageContext.request.contextPath }/back/news/fileUpload',     // 指定上传文件的服务器端程序
        fileManagerJson : '${pageContext.request.contextPath }/back/news/fileManager',  // 指定浏览远程图片的服务器端程序
        formatUploadUrl : false,
        allowFileManager : true,     // 显示浏览远程服务器按钮
        afterCreate : function() {   //  创建富文本编辑器后产生回调函数
            var self = this;
            K.ctrl(document, 13, function() {      // 将指定函数绑定到ctrl + enter组合键,表示提交
                self.sync();
                document.forms['example'].submit();
            });
            K.ctrl(self.edit.doc, 13, function() {
                self.sync();
                document.forms['example'].submit();
            });
        },
        items : ['source', '|', 'undo', 'redo', '|', 'preview', 'template', 'cut', 'copy', 'paste',
            'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
            'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
            'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
            'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
            'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
            'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
            'anchor', 'link', 'unlink']
    });
     editor2 = K.create('textarea[id="content2"]', { // 去到指定的富文本编辑器
         cssPath : '../../kindeditor/plugins/code/prettify.css',  // css样式的根目录
         //newlineTag: "br", // 设置br换行
         uploadJson : '${pageContext.request.contextPath }/back/news/fileUpload',     // 指定上传文件的服务器端程序
         fileManagerJson : '${pageContext.request.contextPath }/back/news/fileManager',  // 指定浏览远程图片的服务器端程序
         formatUploadUrl : false,
         allowFileManager : true,     // 显示浏览远程服务器按钮
         afterCreate : function() {   //  创建富文本编辑器后产生回调函数
             var self = this;
             K.ctrl(document, 13, function() {      // 将指定函数绑定到ctrl + enter组合键,表示提交
                 self.sync();
                 document.forms['example'].submit();
             });
             K.ctrl(self.edit.doc, 13, function() {
                 self.sync();
                 document.forms['example'].submit();
             });
         },
         items : ['source', '|', 'undo', 'redo', '|', 'preview', 'template', 'cut', 'copy', 'paste',
             'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
             'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
             'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
             'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
             'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
             'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
             'anchor', 'link', 'unlink']
     });
    prettyPrint();
}); 

</script>
</body>
</html>