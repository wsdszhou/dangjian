<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/ztree.jsp"%>
<title>用户信息修改</title>
</head>
<body class="easyui-layout" >
     <div id="ff" class="easyui-panel"  style="width:100%;height: 100%;">
        <form  method="post" action="updateUser" style="padding:10px 60px 20px 60px">
            <table cellpadding="5" width="90%">
                 <tr class="title">
                      <td colspan="5">用户信息信息</td>
                      <input type="hidden" id="userId" name="userId"/>
                 </tr>
                 <tr>
                    <td style="width: 150px;">用户名称:</td>
                    <td style="width: 300px;"><input class="easyui-textbox" type="text" name="userMc"  disabled="disabled" style="width: 300px;"></td>
                    
                    <td style="width: 50px;"></td>
                    
                    <td style="width: 150px;">用户微信名:</td>
                    <td style="width: 300px;"><input class="easyui-textbox" type="text" name="userWxm"  disabled="disabled" style="width: 300px;"></td>
                </tr>
                <tr>
                    <td>用户姓名:</td>
                    <td><input class="easyui-textbox" type="text" name="yhxxXm"  disabled="disabled" style="width: 300px;"></td>
                    
                    <td></td>
                    
                    <td>用户创建时间:</td>
                    <td><input id="userCjrq" class="easyui-textbox" type="text" name="userCjrq"  disabled="disabled" style="width: 300px;"></td>
                </tr>
                <tr>
                    <td>用户性别:</td>
                    <td><input class="easyui-textbox" type="text" name="yhxxXb"  disabled="disabled" style="width: 300px;"></td>
                    
                    <td></td>
                    
                    <td>出生年月:</td>
                    <td><input id="yhxxCsrq" class="easyui-textbox" type="text" name="yhxxCsrq"  disabled="disabled" style="width: 300px;"></td>
                </tr>
                <tr>
                    <td>手机号:</td>
                    <td><input class="easyui-validatebox" type="text" name="yhxxSjh"  data-options="required:true,validType:'phone'" style="width: 300px;"></td>
                  
                    <td></td>
                      
                    <td>邮箱:</td>
                    <td><input class="easyui-validatebox" type="text" name="yhxxYx"  data-options="required:true,validType:'email'" style="width: 300px;"></td>
                </tr>
                <tr>
                    <td>身份证:</td>
                    <td><input class="easyui-textbox" type="text" name="yhxxSfzh" disabled="disabled" style="width: 300px;"></td>
                    
                    <td></td>
                    
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>档案:</td>
                    <td><input class="easyui-textbox" type="text" name="yhxxDa"  disabled="disabled" style="width: 300px;"></td>

                    <td></td>
                                        
                    <td>学历:</td>
                    <td><input class="easyui-textbox" type="text" name="xlMc"  disabled="disabled" style="width: 300px;"></td>
                </tr>
                <tr>
                    <td>政治面貌:</td>
                    <td><input class="easyui-textbox" type="text" name="zzmmMc"  disabled="disabled" style="width: 300px;"></td>
                    
                    <td></td>
                    
                    <td>籍贯:</td>
                    <td><input class="easyui-textbox" type="text" name="jgMc"  disabled="disabled" style="width: 300px;"></td>
                </tr>
                <tr>   
                    <td>民族:</td>
                    <td><input class="easyui-textbox" type="text" name="mzMc"  disabled="disabled" style="width: 300px;"></td>
                    
                    <td></td>
                    
                    <td>党内职务:</td>
                    
                    <td><input class="easyui-textbox" type="text" name="dnzwMc"  disabled="disabled" style="width: 300px;"></td>
                </tr>
                <tr>  
                    <td>行政职务:</td>
                    <td><input class="easyui-textbox" type="text" name="xzzwMc"  disabled="disabled" style="width: 300px;"></td>
                    
                    <td></td>
                    
                    <td>部门:</td>
                    <td><input class="easyui-textbox" type="text" name="bmMc"  disabled="disabled" style="width: 300px;"></td>
                </tr>
                <tr>   
                    <td>支部:</td>
                    <td><input class="easyui-textbox" type="text" name="zbMc"  disabled="disabled" style="width: 300px;"></td>
                    
                    <td></td>
                    
                    <td>支部类型:</td>
                    <td><input class="easyui-textbox" type="text" name="zbLxdm"  disabled="disabled" style="width: 300px;"></td>   
                </tr>
               
            </table>
            <div style="text-align:center;padding:20px">
                <input class="easyui-linkbutton" type="submit" value="提交" style="width: 50px;">
            </div>
        </form>
    </div>
    <script>
        $("#userId").next().hide();
	    $(function(){   
	    	$.ajax({
	            type : "POST",
	            url : 'loadUpdateYhxx',
	            dataType : 'json',
	            success : function(date) {
	                console.log(date);
	            	$('#ff').form('load', date); 
	            	$('#yhxxCsrq').val(date.yhxxCsrq);
	            	$('#userCjrq').val(date.userCjrq);
	            	$('#yhxxCsrq').val(date.yhxxCsrq);
	            	$('#userCjrq').val( date.userCjrq );
	            }
	        });
	    });
    </script>

</body>
</html>