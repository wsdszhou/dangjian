<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<title>党务审批</title>
</head>
<body class="easyui-layout">
	<div  style="width:1200px;height: 400px; margin: auto;">
	    <div style="padding:10px 50px 20px 50px">
	        <form id="ff" method="post">
	            <table cellpadding="5">
	                <tr>
	                    <td width="100">用户姓名:</td>
	                    <td><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.yhxxXm }"></td>
	
	                    <td width="100">用户性别:</td>
	                    <td><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.yhxxXb }"></td>
	
	                    <td width="100">出生年月:</td>
	                    <td><input class="easyui-datebox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.yhxxCsrq }"></td>
	                </tr>
	                <tr>
	                    <td>手机号:</td>
	                    <td><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.yhxxSjh }"></td>
	
	                    <td>邮箱:</td>
	                    <td><input class="easyui-textbox" type="text" disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.yhxxYx }"></td>
	
	                    <td>身份证:</td>
	                    <td><input class="easyui-textbox" type="text" disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.yhxxSfzh }"></td>
	                </tr>
	                <tr>
	                    <td>入党时间:</td>
	                    <td><input class="easyui-datebox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.rdsj }"></td>
	
	                    <td>转出地点:</td>
	                    <td colspan="3"><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:600"
	                               value="${viewPartyinfo.zcdd }"></td>
	                </tr>
	                <tr>
	                    <td>政治面貌:</td>
	                    <td><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.zzmmMc }"></td>
	
	                    <td>籍贯:</td>
	                    <td><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.jsSzqxMc }${viewPartyinfo.jgSzsMc }"></td>
	
	                    <td>民族:</td>
	                    <td><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.mzMc }"></td>
	                </tr>
	                <tr>
	                    <td>党内职务:</td>
	                    <td><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.dnzwMc }"></td>
	
	                    <td>行政职务:</td>
	                    <td><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.xzzwMc }"></td>
	
	                    <td>部门:</td>
	                    <td><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.bmMc }"></td>
	                </tr>
	                <tr>
	                    <td>支部:</td>
	                    <td><input class="easyui-textbox" type="text"  disabled="disabled" data-options="width:250"
	                               value="${viewPartyinfo.zbMc }"></td>
	                </tr>
	                <tr>
	                    <td>描述:</td>
	                    <td colspan="5">
	                        <input class="easyui-textbox" value="${viewPartyinfo.ms }" disabled="disabled" data-options="multiline:true,height:50,width:950">
	                    </td>
	                </tr>
	            </table>
	        </form>
	    </div>
	</div>
    <div style="width:1100px; height: 100%; margin: auto;">
        <div style="width: 276px; height: 105px; margin:auto;">
            <span style="width: 100px;height: 50px;  padding:15px; margin-right:5px; border-radius:10px; background-color:red; font-size: 30px;line-height: 50px; cursor: pointer;" onclick="agree()">通过</span>
            <span style="width: 100px;height: 50px;  padding:15px; margin-left:5px;  border-radius:10px; background-color:red; font-size: 30px;line-height: 50px; cursor: pointer;" onclick="disagree()">不通过</span>
        </div>
    </div>
<script type="text/javascript"> 
    
	//同意审批
	var btn = 1;
    // 同意审批
    function agree() {
    	if ( btn ==  1) {
	        $.post(
	            "../../approval/project/agreePartInfo", 
	            { objectId: "${viewPartyinfo.id}" },
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
	            "../../approval/project/disagreePartInfo", 
	            { objectId: "${viewPartyinfo.id}" },
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