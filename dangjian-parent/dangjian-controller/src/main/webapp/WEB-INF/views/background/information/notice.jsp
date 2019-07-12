<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>公告</title>
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
    text-indent: 2em;
    line-height: 30px;
    font-family:"微软雅黑";
    font-size: 20px;
}
</style>
</head>
<body bgcolor="#eee">
    <div class="container" style="border-bottom: 1px dashed #ccc;">
        <div class="title" ><h1  style="text-align: center; font-size: 32px; background-color: #eee;">${viewNotice.tzBt }</h1></div>
        <div style="font-size: 22px;  margin: 35px 0 15px;">
            <span>作者:&nbsp;   ${viewNotice.fbrxm }</span>&nbsp;&nbsp;
            <span id="publicDate">发布时间:&nbsp;  <fmt:formatDate value="${viewNotice.tzFbsj}" pattern="yyyy-MM-dd HH:mm"/></span></div>
    </div>
    <div class="container">
        <div class="main_text" id="content"> ${viewNotice.tzNr} </div>
    </div>
    
    <div class="container" >
        <p id="dateBottom" style="text-align: right;font-family:'微软雅黑';font-size: 20px;"> ${viewNotice.tzFbsj} </p>
    </div>
<script type="text/javascript">
$(function() {
	var id = "${viewNotice.tzId}";
	if (id != "") {
		$.post("readNotice/"+id);
	}
});
</script>
</body>
</html>