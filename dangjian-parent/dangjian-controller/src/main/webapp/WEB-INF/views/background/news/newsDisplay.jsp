<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻显示页面</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<style type="text/css">

*{
    padding: 0;
    margin: 0;
}
.container{
    width: 1200px;
    margin: 50px auto 0;
}
#content{
    width: 1200px;
	 margin: 0;
}
p{
    line-height: 30px;
    font-family:"微软雅黑";
    font-size: 20px;
}

</style>
</head>
<body bgcolor="#eee">
    <div class="container" style="border-bottom: 1px dashed #ccc;">
        <div class="title" ><h1  style="text-align: center; font-size: 32px; background-color: #eee;">${xwb.xwBt }</h1></div>
        <div style="font-size: 22px;  margin: 35px 0 15px;">
            <span>作者:&nbsp;   ${xwb.xwYhm }</span>&nbsp;&nbsp;
            <span id="publicDate">'编辑时间:&nbsp;${xwb.xwXgsj}</span></div>
    </div>

    <div class="container">
        <div class="main_text"  id="content"> ${xwb.xwNr} </div>
    </div>
    <div class="container approval">
        <div style="width: 276px; height: 105px; margin:auto;">
            <span style="width: 100px;height: 50px;  padding:15px; margin-right:5px; border-radius:10px; background-color:red; font-size: 30px;line-height: 50px; cursor: pointer;" onclick="agree()">通过</span>
            <span style="width: 100px;height: 50px;  padding:15px; margin-left:5px;  border-radius:10px; background-color:red; font-size: 30px;line-height: 50px; cursor: pointer;" onclick="disagree()">不通过</span>
        </div>
   </div>
   
<script type="text/javascript"> 

    var newsId = "${xwb.xwId}";
    var approval = "${approval}";
    if (approval == 0) {
    	$(".approval").css("display","block");
	}else {
		$(".approval").css("display","none");
	};
    
	// 同意审批
	var btn = 1;
	function agree() {
		if (btn ==1 ) {
			$.post(
		            "../../approval/project/agree", 
		            { objectId: newsId },
		             function(data){
		                if (data == 200) {
		                    $.messager.alert("提示信息","提交审批完成","info");
		                    btn= 0;
		                }else {
		                    $.messager.alert("提示信息","提交审批失败","warning");
		                    btn= 0;
		                    
		                }
		             }
		        );
		}
	};  
	// 不同意审批
	function disagree() {
		if ( btn ==  1) {
			$.post(
		            "../../approval/project/disagree", 
		            { objectId: newsId },
		             function(data){
		                if (data == 200) {
		                    $.messager.alert("提示信息","提交审批完成","info");
		                    btn= 0;
		                }else {
		                    $.messager.alert("提示信息","提交审批失败","warning");
		                    btn= 0;
		                }
		             }
		        );
		}
	};
</script>
</body>
</html>