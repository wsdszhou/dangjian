<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/jsAndCss/js/viedeo/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jsAndCss/js/viedeo/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jsAndCss/js/viedeo/jquery.fileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jsAndCss/js/viedeo/jquery.xdr-transport.js"></script>
<style type="text/css">
    .bar {
        margin-top:10px;
        height:10px;
        max-width: 300px;
        background: green;
    }
</style>
</head>
<body  class="easyui-layout" style="visibility: hidden;">
     <!-- 数据表格 -->
    <div region="center" border="false">
        <table id="grid" height="100%"></table>
    </div>
    
    <s:hasPermission name="video-add">
     <!-- 添加视频 -->
    <div class="easyui-window" title="添加视频" id="addVideoWindow"
        collapsible="false" minimizable="false" maximizable="false"
        style="top: 20px; left: 200px">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="addVideo" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
                <script type="text/javascript">
                    $(function() {
                        $("#addVideo").click(function() {
                            var t = $("#addVideoProgressBar").css("width");
                            console.log(t);
                            if(t === "0px"){
                                $.messager.alert("错误","视频错误，请重新选择！");
                                return false;
                            }
                            //表单校验
                            var r = $("#addVideoForm").form('validate');
                            if (r) {
                            	$.post(
                                    "saveVideo", 
                                    $("#addVideoForm").serializeJson(),
                                    function (date) {
                                        if(date.error == 0){
                                            $("#addVideoWindow").window("close");
                                            $("#grid").datagrid('reload');
                                            $("#addVideoForm").form('clear');
                                        }else {
                                            $.messager.alert("提示信息","添加失败！","warning");
                                            $("#addVideoWindow").window("close");
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
            <form id="addVideoForm" method="post" action="saveVideo" >
                <table class="table-edit" width="80%" align="center">
                    <tr class="selectFile" >
                        <td width="100">视频名称</td>
                        <td>
                            <input class="easyui-textbox" data-options="required:true,width:500" name="spMc" >
                        </td>
                    </tr>
                    <tr class="selectFile" >
                        <td>视频描述</td>
                        <td>
                            <input class="easyui-textbox" name="spMs" data-options="required:true,multiline:true,height:50,width:500">
                        </td>
                    </tr>
                    <tr>
                        <td>视频缩略图上传</td>
                        <td>
                            <form action="" method="post" enctype="multipart/form-data" >
                                <input  id="uploadFile" type="file" name="uploadFile" value="支部荣誉图片" >
                                <input id="PictureBtn" type="button" onclick="pictureUpload()" value="上传图片">
                            </form>
                            <input id="uploadVideoSlt" type="hidden" name="spSlt">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div style="width: 300px;height: 100px;">
                                <img id="displayPicture" alt="" style="height: 100px;" src="" />
                            </div>
                        </td>
                    </tr>
                    <tr class="selectFile" >
                        <td>视频上传</td>
                        <td>
                            <form action="" name="" enctype="multipart/form-data">
	                            <input type="file" name="uploadFile" class="upinputAdd"  param1="xxx"/>
	                        </form> 
	                         <input id="addSpLj" type="hidden" name="spLj" data-options="required:true">
                        </td>
                    </tr>
                    <tr class="progress" >
                        <td>传进度条及状态</td>
                        <td>
                            <div class="bar" id="addVideoProgressBar" style="width: 0;"></div>
                            <div class="upstatus" style="margin-top:10px;"></div>
                        </td>
                    </tr>
                    <tr class="progress" >
                        <td>预览框</td>
                        <td>
                            <div class="preview" width="500"></div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    </s:hasPermission>
    
    <s:hasPermission name="video-update">
    <!-- 修改视频 -->
    <div class="easyui-window" title="修改视频" id="updateVideoWindow"
        collapsible="false" minimizable="false" maximizable="false"
        style="top: 20px; left: 200px">
        <div style="height: 31px; overflow: hidden;" split="false" border="false">
            <div class="datagrid-toolbar">
                <a id="updateVideo" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
                <script type="text/javascript">
                    $(function() {
                        $("#updateVideo").click(function() {
                            //表单校验
                            var t = $("#updateVideoProgressBar").css("width");
                            if(t === "0px"){
                                $.messager.alert("错误","视频错误，请重新选择！");
                                return false;
                            }
                            var r = $("#updateVideoForm").form('validate');
                            if (r) {
                            	$.post(
                                        "updateVideo", 
                                        $("#updateVideoForm").serializeJson(),
                                        function (date) {
                                            if(date.error == 0){
                                                $("#updateVideoWindow").window("close");
                                                $("#grid").datagrid('reload');
                                            }else {
                                                $.messager.alert("提示信息","修改失败！","warning");
                                                $("#updateVideoWindow").window("close");
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
            <form id="updateVideoForm" method="post" action="updateVideo" >
                <table class="table-edit" width="80%" align="center">
                    <tr class="selectFile" >
                        <td width="100">视频名称</td>
                        <td>
                            <input class="easyui-textbox" data-options="required:true,width:500" name="spMc" >
                        </td>
                    </tr>
                    <tr class="selectFile" >
                        <td>视频描述</td>
                        <td>
                            <input class="easyui-textbox" name="spMs" data-options="required:true,multiline:true,height:50,width:500">
                        </td>
                    </tr>
                    <tr class="selectFile" >
                        <td>视频上传</td>
                        <td>
                            <form action="" name="" enctype="multipart/form-data">
                                <input type="file" name="uploadFile" class="upinputAdd"  param1="xxx"/>
                            </form> 
                             <input id="updateSpLj" type="hidden" name="spLj" data-options="required:true">
                        </td>
                    </tr>
                    <tr class="progress" >
                        <td>传进度条及状态</td>
                        <td>
                            <div class="bar" id="updateVideoProgressBar" style="width: 0;"></div>
                            <div class="upstatus" style="margin-top:10px;"></div>
                        </td>
                    </tr>
                    <tr class="progress" >
                        <td>预览框</td>
                        <td>
                            <div class="preview" width="500"></div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    </s:hasPermission>
    
    <s:hasPermission name="video-search">
    <!-- 查询用户窗口 -->
    <div class="easyui-window" title="查询用户窗口 " id="searchWindow" data-options="closed:true,modal:true" collapsible="false" minimizable="false" maximizable="false" style="top:50px;left:50px">
        <div style="overflow:auto;padding:5px;" border="false">
            <form id="searchForm">
                <table class="table-edit" width="90%" align="center">
                    <tr class="title">
                        <td colspan="2">查询条件</td>
                    </tr>
                    <tr>
                        <td style="width: 80px;">视频名称:</td>
                        <td><input class="easyui-textbox"  name="spMc" data-options="width:500" ></input></td>
                    </tr>
                    <tr>
                        <td>视频描述:</td>
                        <td><input id="searchDepartment" class="easyui-textbox"  name="spMs" data-options="multiline:true,height:50,width:500"" ></input></td>
                    </tr>
                    <tr>
                        
                        <td ><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width: 80px;" >查询</a> </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>    
                </table>
            </form>
        </div>
    </div>  
    </s:hasPermission>
    
<script type="text/javascript">
	//图片上传
	function pictureUpload() {
	    var formdata=new FormData();
	    formdata.append('uploadFile',$('#uploadFile').get(0).files[0]);
	    $.ajax({
	        url:'uploadVideoSlt',
	        type:'post',
	        data:formdata,
	        contentType:false,
	        processData:false,
	        async:false,
	        success:function(data){ 
	            $("#displayPicture").attr('src',data.data.src)
	            $("#uploadVideoSlt").val(data.data.src);
	        },
	        error:function(err){
	            $.messager.alert("提示","上传失败","info");
	        }
	    });
	};
	$(".upinputAdd").fileupload({
	    url:"fileUpload",//文件上传地址，当然也可以直接写在input的data-url属性内
	    dataType: "json", //如果不指定json类型，则传来的json字符串就需要解析jQuery.parseJSON(data.result);
	    done:function(e,data){
            console.log(data);
	        if(data.result.state) {
	            // 上传成功：
	            $(".upstatus").html(data.result.msg);
	            $("#addSpLj").val(data.result.src);
	            $("#updateSpLj").val(data.result.src);

                //var playurl = document.location.pathname.match(/^\/[^/]+/i)+"/"+data.result.src;
                var playurl = data.result.src;

	             $(".preview").html('<video width="400" height="350" controls>'+
	            		'<source src="'+ playurl +'" type="video/mp4">'+
	            		'<source src="'+ playurl +'" type="video/wmv">'+
	            		'<source src="'+ playurl +'" type="video/avi">'+
	            		'<source src="'+ playurl +'" type="video/wav">'+
	            		'<source src="'+ playurl +'" type="video/mkv">'+
	            		'<source src="'+ playurl +'" type="video/flv">'+
	            		'<source src="'+ playurl +'" type="video/rmvb">'+
	            		'<source src="movie.ogg" type="video/ogg"> '+
	            		'<object data="'+ playurl +'" width="400" height="350">'+
	            		     '<embed width="400" height="350" src="'+ playurl +'" />'+
	                    '</object>'+
	            		'您的浏览器不支持 video 标签。</video>'); 
	        } else {
	            // 上传失败：
	            $(".progress .bar").css("width", "0%");
	            $(".upstatus").html("<span style='color:red;'>"+data.result.msg+"</span>");
	        }
	        
	    },
	    progress: function (e, data) {//上传进度
	        var progress = parseInt(data.loaded / data.total * 100, 10);
	        $(".progress .bar").css("width", progress + "%");
	        $(".upstatus").html("正在上传...");
	    }
	});
	$("#spLj").next().hide();
	
    function doAdd() {
        $('#addVideoWindow').window("open");
    };

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
        var Video = rows[0];
        $("#updateVideoForm").form("load", rows[0]);
        $('#updateVideoWindow').window("open");
    };

    function doDelete() {
        //获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除视频！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的视频吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //保存在我们的数组里面
                        array.push(rows[i].spId);
                    }
                    var ids = array.join(",");
                    $.post("deleteBatchVideo/"+ids,function (date) {
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
    };

    //工具栏
    var toolbar = [ 
    	<s:hasPermission name="video-search">
    	{
        id : 'button-search',
        text : '查询',
        iconCls : 'icon-search',
        handler : doSearch
    },
    </s:hasPermission>
    <s:hasPermission name="video-add">
    {
        id : 'button-add',
        text : '增加',
        iconCls : 'icon-add',
        handler : doAdd
    },
    </s:hasPermission>
    <s:hasPermission name="video-update">
    {
        id : 'button-edit',
        text : '修改',
        iconCls : 'icon-edit',
        handler : doEdit
    },
    </s:hasPermission>
    <s:hasPermission name="video-delete">
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
        field : 'spId',
        checkbox : true,
    }, {
        field : 'spMc',
        title : '视频名称',
        width : 170,
        align : 'center'
    }, {
        field : 'spMs',
        title : '视频描述',
        width : 170,
        align : 'center'
    }, {
        field : 'spLj',
        title : '视频路径',
        width : 250,
        align : 'center'
    } ] ];

    $(function() {
        // 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });

        // 视频数据表格
        $('#grid').datagrid({
            iconCls : 'icon-forward',
            fit : true,
            border : true,
            rownumbers : true,
            striped : true,
            pageList : [ 5, 10, 15, 20, 30, 40 ],
            pageSize : 20,
            pagination : true,
            toolbar : toolbar,
            url : "videoList",
            idField : 'spId',
            columns : columns,
            fitColumns : true
        });

        // 添加
        $('#addVideoWindow').window({
            title : '添加',
            width : 900,
            modal : true,
            shadow : true,
            closed : true,
            height : 650,
            resizable : false
        });
        
        // 修改
        $('#updateVideoWindow').window({
        	title : '添加',
            width : 900,
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