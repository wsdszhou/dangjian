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
    
    <div style="width: 600px;margin:  auto;">
       <form id="setPassword" method="post" action="setPassword" >
            <div style="height: 70px; line-height: 70px;">
                <label for="pwd">请输入密码 &nbsp;&nbsp;:</label>
	            <input id="pwd" name="pwd" type="password" class="easyui-validatebox easyui-textbox" data-options="required:true,width:400,height:35" /> 
            </div>
              <div style="height: 70px; line-height: 70px;">
                <label for="password">再次确认密码:</label>
                <input id="rpwd" name="password" type="password" class="easyui-validatebox easyui-textbox" style="width: 400px;height:35px;" required="required:true,width:400,height:35" validType="equals['#pwd']" /> 
            </div>
            <div id="validate" style="width: 500px;height: 50px; line-height:50px; border-radius:5px; text-align:center; margin-top:10px ;font-size: 20px; background-color: #1690f3;cursor: pointer; ">完成</div>
        </form>
    </div>
<script type="text/javascript">
$.extend($.fn.validatebox.defaults.rules, {    
    equals: {    
        validator: function(value,param){    
            return value == $(param[0]).val();    
        },    
        message: '密码不一致'   
    }    
});
$("#validate").click(function() {
    //表单校验
    var r = $("#setPassword").form('validate');
    if (r) {
    	$("#setPassword").submit();
    }
});
</script>
</body>
</html>