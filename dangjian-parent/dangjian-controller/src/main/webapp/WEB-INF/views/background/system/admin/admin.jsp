<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户信息显示</title>
    <%@include file="/WEB-INF/views/include/header.jsp" %>
    <%@include file="/WEB-INF/views/include/ztree.jsp" %>
    <script type="text/javascript" src='${pageContext.request.contextPath }/jsAndCss/js/index.js'></script>
</head>
<body class="easyui-layout">
<div class="easyui-panel" style="width:100%;height: 100%;">
    <div style="padding:10px 60px 20px 60px; width: 1000px; margin: 50px auto;" >
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td width="100">用户名称:</td>
                    <td ><input class="easyui-textbox" type="text" name="userMc" disabled="disabled"
                               value="${viewYhxx.userMc }" data-options="width:200"></td>

                    <td>用户微信名:</td>
                    <td><input class="easyui-textbox" type="text" name="userWxm" disabled="disabled"
                               value="${viewYhxx.userWxm }" data-options="width:200"></td>

                    <td>用户创建时间:</td>
                    <td><input class="easyui-datebox" type="text" name="userCjrq" disabled="disabled"
                               value="${viewYhxx.userCjrq }" data-options="width:200"></td>
                </tr>
                <tr>
                    <td>用户姓名:</td>
                    <td><input class="easyui-textbox" type="text" name="yhxxXm" disabled="disabled"
                               value="${viewYhxx.yhxxXm }" data-options="width:200"></td>

                    <td>用户性别:</td>
                    <td><input class="easyui-textbox" type="text" name="yhxxXb" disabled="disabled"
                               value="${viewYhxx.yhxxXb }" data-options="width:200"></td>

                    <td>出生年月:</td>
                    <td><input class="easyui-datebox" type="text" name="yhxxCsrq" disabled="disabled"
                               value="${viewYhxx.yhxxCsrq }" data-options="width:200"></td>
                </tr>
                <tr>
                    <td>手机号:</td>
                    <td><input class="easyui-textbox" type="text" name="yhxxSjh" disabled="disabled"
                               value="${viewYhxx.yhxxSjh }" data-options="width:200"></td>

                    <td>邮箱:</td>
                    <td><input class="easyui-textbox" type="text" name="yhxxYx" disabled="disabled"
                               value="${viewYhxx.yhxxYx }" data-options="width:200"></td>

                    <td>身份证:</td>
                    <td><input class="easyui-textbox" type="text" name="yhxxSfzh" disabled="disabled"
                               value="${viewYhxx.yhxxSfzh }" data-options="width:200"></td>
                </tr>
                <tr>
                    <td>档案:</td>
                    <td><input class="easyui-textbox" type="text" name="yhxxDa" disabled="disabled"
                               value="${viewYhxx.yhxxDa }" data-options="width:200"></td>

                    <td>学历:</td>
                    <td><input class="easyui-textbox" type="text" name="xlMc" disabled="disabled"
                               value="${viewYhxx.xlMc }" data-options="width:200"></td>
                               
                    <td>政治面貌:</td>
                    <td><input class="easyui-textbox" type="text" name="zzmmMc" disabled="disabled"
                               value="${viewYhxx.zzmmMc }" data-options="width:200"></td>
                </tr>
                <tr>
                    <td>籍贯:</td>
                    <td><input class="easyui-textbox" type="text" name="jgMc" disabled="disabled"
                               value="${viewYhxx.jgMc }" data-options="width:200"></td>

                    <td>民族:</td>
                    <td><input class="easyui-textbox" type="text" name="mzMc" disabled="disabled"
                               value="${viewYhxx.mzMc }" data-options="width:200"></td>
                               
                    <td>党内职务:</td>
                    <td><input class="easyui-textbox" type="text" name="dnzwMc" disabled="disabled"
                              value="${viewYhxx.dnzwMc }" data-options="width:200"></td>
                </tr>           
                <tr>
                    <td>行政职务:</td>
                    <td><input class="easyui-textbox" type="text" name="xzzwMc" disabled="disabled"
                               value="${viewYhxx.xzzwMc }" data-options="width:200"></td>

                    <td>部门:</td>
                    <td><input class="easyui-textbox" type="text" name="bmMc" disabled="disabled"
                               value="${viewYhxx.bmMc }" data-options="width:200"></td>
                               
                    <td>支部:</td>
                    <td><input class="easyui-textbox" type="text" name="zbMc" disabled="disabled"
                               value="${viewYhxx.zbMc }" data-options="width:200"></td>
                </tr>
                <tr>

                    <td>支部类型:</td>
                    <td><input class="easyui-textbox" type="text" name="zbLxdm" disabled="disabled"
                               value="${viewYhxx.zbLxdm }" data-options="width:200"></td>
                    <td></td>
                    <td></td>
                    
                    <td></td>
                    <td></td>
                </tr>
                    <td>头像:</td>
                    <td width="150" height="150">
                        <img alt=""  src="${viewYhxx.yhxxTx }" style=" width:150px; height:150px; border: 1px solid #ccc;">
                    </td>
            </table>
        </form>
        <div style="text-align:center;padding:5px" >
            <a href="toUpdateYhxx" class="easyui-linkbutton">修改用户信息</a>
        </div>
    </div>
</div>

</body>
</html>