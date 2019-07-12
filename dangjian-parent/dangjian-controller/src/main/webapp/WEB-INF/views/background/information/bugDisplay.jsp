<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bug信息反馈</title>
<style type="text/css">
.content {
    height:50px;
    line-height:50px;
    border-bottom:  1px solid #555;
}
</style>
</head>
<body>
    <div style="width: 80%;height: 100%; margin: auto;">
        <div style="padding: 0 80px;border: 1px solid #555;">
            <div class="content">
	            <h2 style="text-align: center;">bug信息反馈</h2>
            </div>
            <div class="content">
                <div class="title" style=" display: inline-block;width: 120px;font-size: 20px;"><span>标题:</span></div>
                <div style="display: inline-block;width: 600px;font-size: 20px;">${viewBug.bt }</div>
            </div>
            <div class="content">
                <div class="title" style="display: inline-block;width: 120px;font-size: 20px;"><span>反馈人:</span></div>
                <div style="display: inline-block;width: 600px;font-size: 20px;">${viewBug.yhxxXm }</div>
            </div>
            <div class="content">
                <div class="title" style="display: inline-block;width: 120px;font-size: 20px;"><span>反馈时间:</span></div>
                <div style="display: inline-block;width: 600px;font-size: 20px;">
                    <fmt:formatDate value="${viewBug.sj}" pattern="yyyy-MM-dd"/> 
                </div>
            </div>
            <div >
                <div class="title" style="display: inline-block; vertical-align:middle; width: 120px;font-size: 20px;"><span>反馈内容:</span></div>
                <div style="width: 600px; height:350px; display: inline-block; vertical-align:middle;font-size: 20px;">
                    <pre>${viewBug.nr }</pre>
                </div>
        </div>
    </div>

</body>
</html>