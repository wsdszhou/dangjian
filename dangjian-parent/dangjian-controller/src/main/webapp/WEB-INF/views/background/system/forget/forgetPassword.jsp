<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>找回密码</title>
<style type="text/css">
#herder{
    width:100%;
    height:100px;
    background: -webkit-linear-gradient(#becbf3, #ecf0f9); /* Safari 5.1 - 6.0 */
    background: -o-linear-gradient(#becbf3, #ecf0f9); /* Opera 11.1 - 12.0 */
    background: -moz-linear-gradient(#becbf3, #ecf0f9); /* Firefox 3.6 - 15 */
    background: linear-gradient(#becbf3, #ecf0f9); /* 标准的语法 */
}    
</style>
</head>
<body style="background-color: #ecf0f9;">
    <div id="herder"></div>
    <div style="width: 600px;height:60px;;margin:  auto;">
        <img alt="桂林理工大学logo" src="../jsAndCss/images/logo_school.png">
        <img alt="桂林理工大学找回密码logo" src="../jsAndCss/images/logo_rz.png">
    </div>
    <div style="width: 500px; margin:  auto; ">
       <form id="validateInformation" method="post" action="validateInformation" >
            <div style="height: 70px; line-height: 70px;">
                <div style="width: 80px; display: inline-block;font-size: 16px;"><label for="userMc" >用&nbsp;&nbsp;户&nbsp;&nbsp;名:</label></div>
	            <input class="easyui-textbox" name="userMc" data-options="required:true,width:400,height:35">
            </div>
            <div style="height: 70px; line-height: 70px;">
                <div style="width: 80px; display: inline-block;font-size: 16px;"><label for="yhxxSfzh">身份证号:</label></div>
                <input class="easyui-textbox" name="yhxxSfzh" data-options="required:true,width:400,height:35">
            </div>
            <div id="validate" style="width: 500px;height: 50px; line-height:50px; border-radius:5px; text-align:center; margin-top:10px ;font-size: 20px; background-color: #1690f3;cursor: pointer; ">下一步</div>
        </form>
        
        <div style="margin-top: 20px; font-size: 16px;text-align: center;color: red;">${message }</div>
    </div>
<script type="text/javascript">

$("#validate").click(function() {
    //表单校验
    var r = $("#validateInformation").form('validate');
    if (r) {
        $("#validateInformation").submit();
    }
});
</script>
</body>
</html>