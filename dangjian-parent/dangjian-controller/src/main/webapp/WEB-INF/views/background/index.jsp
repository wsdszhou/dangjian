<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>党建后台管理系统主界面</title>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/ztree.jsp"%>
<script type="text/javascript" src='../jsAndCss/js/index.js'> </script>
<script type="text/javascript">
//初始化ztree菜单
$(function() {
    var setting = {
        data : {
            simpleData : { // 简单数据 
                enable : true
            }
        },
        callback : {
            onClick : onClick
        }
    };
    
    // 基本功能菜单加载
    $.ajax({
        url : '../back/loadMenu',
        type : 'POST',
        dataType : 'text',
        success : function(data) {
            var zNodes = eval("(" + data + ")");
            $.fn.zTree.init($("#treeMenu"), setting, zNodes);
        },
        error : function(msg) {
            alert('菜单加载异常!');
        }
    });
}); 

</script>
<style type="text/css">
#header  {
    height:80px;
    padding:10px;
    background: -webkit-linear-gradient(#5778c5, #e2edff); /* Safari 5.1 - 6.0 */
	background: -o-linear-gradient(#5778c5, #e2edff); /* Opera 11.1 - 12.0 */
	background: -moz-linear-gradient(#5778c5, #e2edff); /* Firefox 3.6 - 15 */
	background: linear-gradient(#5778c5, #e2edff); /* 标准的语法 */
}
#footer {
    height:80px;padding:10px;
    text-align:center;
    background: -webkit-linear-gradient(#e2edff, #5778c5); /* Safari 5.1 - 6.0 */
    background: -o-linear-gradient(#e2edff, #5778c5); /* Opera 11.1 - 12.0 */
    background: -moz-linear-gradient(#e2edff, #5778c5); /* Firefox 3.6 - 15 */
    background: linear-gradient(#e2edff, #5778c5); /* 标准的语法 */
}
</style>
</head>
<body class="easyui-layout">

    <!-- 顶部 e0ecff -->
    <div id="header" data-options="region:'north',border:false" >
       <div id="logo" style="width: 300px;height:91px; position: absolute;left: 30px; top:10px;">
            <img alt="桂林理工大学智慧网站" src="../jsAndCss/images/logo.png" style="height: 60px;">
        </div>
        <div id="sessionInfoDiv" style="position: absolute;right: 30px;top:10px;">
            [<strong>&nbsp; ${yhb.userMc} &nbsp;</strong>]，欢迎你！
        </div>
        <div style="position: absolute; right: 30px; bottom: 10px; ">
            <a href="javascript:void(0);" class="easyui-menubutton"
                data-options="menu:'#layout_north_pfMenu',iconCls:'icon-ok'">更换皮肤</a>
            <a href="javascript:void(0);" class="easyui-menubutton"
                data-options="menu:'#layout_north_kzmbMenu',iconCls:'icon-help'">控制面板</a>
        </div>
        <div id="layout_north_pfMenu" style="width: 120px; display: none;">
            <div onclick="changeTheme('default');">default</div>
            <div onclick="changeTheme('gray');">gray</div>
            <div onclick="changeTheme('black');">black</div>
            <div onclick="changeTheme('bootstrap');">bootstrap</div>
            <div onclick="changeTheme('metro');">metro</div>
        </div>
        <div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
            <div onclick="editPassword();">修改密码</div>
            <div onclick="showAbout();">联系管理员</div>
            <div class="menu-sep"></div>
            <div onclick="logoutFun();">退出系统</div>
        </div>
    </div> 
    
    
    <!-- 左边菜单 -->
    <div data-options="region:'west',split:true,title:'菜单导航'" style="width:200px">
        <!-- <div id="nav">
        </div> -->
        <div title="基本功能" data-options="iconCls:'icon-mini-add'" style="overflow:auto">
            <ul id="treeMenu" class="ztree"></ul>
        </div>
    </div> 
    
    <!-- 中间部分 -->
    <div data-options="region:'center'">
        <div id="tabs" fit="true" class="easyui-tabs" border="false" >
            <div title="消息中心" id="subWarp" style="width:100%;height:100%;">
                 
                <iframe src="information"style="width:100%;height:100%;border:0;"></iframe>
                
            </div>
        </div>
    </div>
    
    <!-- 底部内容 -->
    <div id="footer" data-options="region:'south',border:false" >
        <table style="width: 100%;">
            <tbody>
                <tr>
                    <td style="width: 300px;">
                        <div style="color: #000; font-size: 10pt; text-align: center;line-height: 20px;">
                            <address>版权所有 桂林理工大学 地址:中国广西桂林市建干路12号 邮编:541004</address>
                            <p>技术开发团队：信息科学与工程学院</p>
                        </div>
                    </td>
                    
                </tr>
            </tbody>
        </table>
    </div>
    
    <!--修改密码窗口-->
    <div id="editPwdWindow" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" modal="true" closed="true" resizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 160px; padding: 5px; background: #fafafa">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >确定</a> 
                <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
        </div>
    </div>
</body>
</html>