<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript"src="${pageContext.request.contextPath }/jsAndCss/js/jquery.ocupload-1.1.2.js"></script>
<title>用户列表</title>
</head>
<body  class="easyui-layout" style="visibility: hidden;">
    
	<div data-options="region:'center'">
        <table id="grid"></table>
    </div>
    
    <!-- 添加 -->
    <s:hasPermission name="user-add">
	    <div class="easyui-window" title="添加用户" id="addWindow"
	        collapsible="false" minimizable="false" maximizable="false" style="top: 80px; left: 50px">
	        <div style="height: 31px; overflow: hidden;" split="false" border="false">
	            <div class="datagrid-toolbar">
	                <a id="addButton" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
	                <script type="text/javascript">
	                    $(function() {
	                        $("#addButton").click(function() {
	                            //表单校验
	                            var r = $("#saveForm").form('validate');
	                            if(flagUserName == 0){
	                                $.messager.alert("提示信息","用户名已经存在，请重新填写！","warning");
	                                return ;
	                            }
	                            if (r) {
	                            	$.post(
                                       "saveUser", 
                                       $("#saveForm").serializeJson(),
                                       function (date) {
                                           if(date.error == 0){
                                               $("#addWindow").window("close");
                                               $("#grid").datagrid('reload');
                                               $("#saveForm").form('clear');
                                           }else {
                                               $.messager.alert("提示信息","添加失败！","warning");
                                               $("#addWindow").window("close");
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
	            <form id="saveForm" method="post" action="saveUser" >
	                <table class="table-edit" width="90%" align="center">
	                    <tr class="title">
	                        <td colspan="1">用户信息</td>
	                        <td colspan="4" id="msg"></td>
	                        <td colspan="1"><font color="red">密码将被初始化为：123456</font> </td>
	                    </tr>
	                    <tr>
	                        <td style="width: 80px;">用户名:</td>
	                        <td><input id="validateUserName" class="easyui-validatebox"  name="userMc"  style="width: 200px;" data-options="required:true,events:{blur:validateUserName}" >
	                                
	                        </td>
	                        
	                        <td>用户姓名:</td>
	                        <td><input class="easyui-textbox" name="yhxxXm" style="width: 200px;" data-options="required:true"></td>
	                        
	                        <td>用户类型:</td>
	                        <td><input id="userState" class="easyui-combobox"  name="userZtId" style="width: 200px;"  data-options="required:true"></td>
	                    </tr>
	                    <tr>
	                        <td>用户性别:</td>
	                        <td>
	                            <select class="easyui-combobox" name="yhxxXb" style="width: 200px;" data-options="required:true">   
	                                <option value="男">男</option>   
	                                <option value="女">女</option>     
	                            </select>
	                        </td>
	                        
	                        <td>出生年月:</td>
	                        <td><input class="easyui-datebox"  name="yhxxCsrq" style="width: 200px;"  data-options="required:true"></td>
	                        
	                        <td>手机号:</td>
	                        <td><input class="easyui-validatebox"  name="yhxxSjh" style="width: 200px;" data-options="required:true,validType:'phone'"></td>
	                    </tr>
	                    <tr>
	                        <td>电话号码:</td>
	                        <td><input class="easyui-validatebox"  name="yhxxDhhm" style="width: 200px;" data-options="required:true,validType:'telePhone'"></td>
	                        
	                        <td>邮箱:</td>
	                        <td><input class="easyui-validatebox"  name="yhxxYx" style="width: 200px;" data-options="required:true,validType:'email'"></td>
	                        
	                        <td>身份证:</td>
	                        <td><input class="easyui-validatebox"  name="yhxxSfzh" style="width: 200px;" data-options="required:true,validType:'idCardNo'"></td>
	                    </tr>
	                    <tr>
	                        <td>学历:</td>
	                        <td><input id="education" class="easyui-combobox"  name="xlId" style="width: 200px;" data-options="required:true"></td>
	                        
	                        <td>政治面貌:</td>
	                        <td><input id="politicsState" class="easyui-combobox"  name="zzmmId"  style="width: 200px;" data-options="required:true"></td>
	                        
	                        <td>籍贯:</td>
	                        <td><input id="place" class="easyui-combobox"  name="jgId" style="width: 200px;" data-options="required:true"></td>
	                    </tr>
	                    <tr>
                            <td>民族:</td>
                            <td><input id="nation" class="easyui-combobox"  name="mzId" style="width: 200px;" data-options="required:true"></td>
                            
                            <td>党内职务:</td>
                            <td><input id="partyJob" class="easyui-combobox"  name="dnzwId" style="width: 200px;" data-options="required:true"></td>
                            
                            <td>行政职务:</td>
                            <td><input id="administrativeJob" class="easyui-combobox"  name="xzzwId" style="width: 200px;" data-options="required:true"></td>
                        </tr>
                        <tr>                            
                            <td>部门:</td>
                            <td><input id="department" class="easyui-combobox"  name="bmId" style="width: 200px;" data-options="required:true"></td>
                            
                            <td>支部类型:</td>
                            <td><input id="branchType" class="easyui-combobox"  style="width: 200px;" ></td>
                            
                            <td >支部:</td>
                            <td><input id="branch" class="easyui-combobox"  name="zbId" style="width: 200px;" data-options="required:true"></td>
                        </tr>    
                        <tr>     
                            <td >用户描述:</td>
                            <td><input  class="easyui-textbox"  name="userMs" style="width: 200px; height: 50px;"  data-options="required:true"></td>
                         </tr>
	                 </table>
	            </form>
	        </div>
	    </div>
    </s:hasPermission>
    
     <!-- 修改 -->
     <s:hasPermission name="user-update">
	    <div class="easyui-window" title="修改用户" id="updateWindow"
	        collapsible="false" minimizable="false" maximizable="false" style="top: 80px; left: 50px">
	        <div style="height: 31px; overflow: hidden;" split="false" border="false">
	            <div class="datagrid-toolbar">
	                <a id="updateButton" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
	                <script type="text/javascript">
	                    $(function() {
	                        $("#updateButton").click(function() {
	                            //表单校验
	                            var r = $("#updateForm").form('validate');
	                            if (r) {
	                            	$.post(
                                        "updateUser", 
                                        $("#updateForm").serializeJson(),
                                        function (date) {
                                            if(date.error == 0){
                                                $("#updateWindow").window("close");
                                                $("#grid").datagrid('reload');
                                            }else {
                                                $.messager.alert("提示信息","修改失败！","warning");
                                                $("#updateWindow").window("close");
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
	            <form id="updateForm" method="post" action="updateUser" >
	                <table class="table-edit" width="90%" align="center">
	                    <tr class="title">
	                        <td colspan="2">用户信息信息</td>
	                        <input type="hidden" id="userId" name="userId"/>
	                    </tr>
	                    <tr>
	                        <td style="width: 80px;">用户名:</td>
	                        <td><input id="userMc" class="easyui-textbox"  name="userMc"  style="width: 200px;" data-options="required:true,editable:false" ></td>
	                        
	                        <td>用户姓名:</td>
	                        <td><input id="yhxxXm" class="easyui-textbox"  name="yhxxXm" style="width: 200px;" data-options="required:true,editable:false"></td>
	                        
	                        <td>用户类型:</td>
	                        <td><input  class="easyui-combobox userState"  name="userZtId" style="width: 200px;"  data-options="required:true,editable:false"></td>
	                    </tr>
	                    <tr>
	                        <td>用户性别:</td>
	                        <td>
	                            <select class="easyui-combobox" name="yhxxXb" style="width: 200px;" data-options="required:true,editable:false">   
	                                <option value="男">男</option>   
	                                <option value="女">女</option>     
	                            </select>
	                        </td>
	                        
	                        <td>出生年月:</td>
	                        <td><input id="yhxxCsrq" class="easyui-textbox"  name="yhxxCsrq" style="width: 200px;"  data-options="required:true,formatter:getLocalTime,editable:false"> </td>
	                         
	                        <td>手机号:</td>
	                        <td><input id="yhxxSjh" class="easyui-textbox"  name="yhxxSjh" style="width: 200px;" data-options="required:true"></td>
	                    </tr>
	                    <tr>
	                        <td>电话号码:</td>
	                        <td><input id="yhxxDhhm" class="easyui-textbox"  name="yhxxDhhm" style="width: 200px;" data-options="required:true"></td>
	                        
	                        <td>邮箱:</td>
	                        <td><input id="yhxxYx" class="easyui-textbox"  name="yhxxYx" style="width: 200px;" data-options="required:true"></td>
	                        
	                        <td>身份证:</td>
	                        <td><input id="yhxxSfzh" class="easyui-textbox"  name="yhxxSfzh" style="width: 200px;" data-options="required:true"></td>
	                    </tr>
	                    <tr>
	                        <td>学历:</td>
	                        <td><input  class="easyui-combobox education"  name="xlId" style="width: 200px;" data-options="required:true"></td>
	                        
	                        <td>政治面貌:</td>
	                        <td><input  class="easyui-combobox politicsState"  name="zzmmId"  style="width: 200px;" data-options="required:true"></td>
	                        
	                        <td>籍贯:</td>
	                        <td><input  class="easyui-combobox place"  name="jgId" style="width: 200px;" data-options="required:true"></td>
	                    </tr>
	                    <tr>
	                        <td>民族:</td>
	                        <td><input  class="easyui-combobox nation"  name="mzId" style="width: 200px;" data-options="required:true"></td>
	                        
	                        <td>党内职务:</td>
	                        <td><input  class="easyui-combobox partyJob"  name="dnzwId" style="width: 200px;" data-options="required:true"></td>
	                        
	                        <td>行政职务:</td>
	                        <td><input  class="easyui-combobox administrativeJob"  name="xzzwId" style="width: 200px;" data-options="required:true"></td>
	                    </tr>
	                    <tr>                            
	                        <td>部门:</td>
	                        <td><input  class="easyui-combobox department"  name="bmId" style="width: 200px;" data-options="required:true"></td>
	                        
	                        <td>支部类型:</td>
	                        <td><input  class="easyui-combobox branchType"  name="zbLxdm" style="width: 200px;" ></td>
	                        
	                        <td >支部:</td>
	                        <td><input  class="easyui-combobox branch"  name="zbId" style="width: 200px;" data-options="required:true"></td>
	                    </tr>    
	                    <tr>     
	                        <td >用户描述:</td>
	                        <td><input id="userMs"  class="easyui-textbox"  name="userMs" style="width: 200px; height: 50px;"  data-options="required:true"></td>
	                     </tr>   
	                 </table>
	            </form>
	        </div>
	    </div>
    </s:hasPermission>
    
    <!-- 查询 -->
     <s:hasPermission name="user-search">
	    <div class="easyui-window" title="查询窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:50px;left:50px">
	        <div style="overflow:auto;padding:5px;" border="false">
	            <form id="searchForm">
	                <table class="table-edit" width="90%" align="center">
	                    <tr class="title">
	                        <td colspan="6">查询条件</td>
	                    </tr>
	                    <tr>
	                        <td style="width: 80px;">用户名:</td>
	                        <td><input class="easyui-textbox"  name="userMc"  style="width: 200px;"></td>
	                        <td></td>
	                        <td>用户姓名:</td>
	                        <td><input class="easyui-textbox"  name="yhxxXm" style="width: 200px;" ></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td>用户类型:</td>
	                        <td><input id="userState" class="easyui-combobox"  name="userZtId" style="width: 200px;"  ></td>
	                        <td></td>
	                        <td>用户性别:</td>
	                        <td>
	                            <select class="easyui-combobox" name="yhxxXb" style="width: 200px;">   
	                                <option value="男">男</option>   
	                                <option value="女">女</option>     
	                            </select>
	                        </td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td>学历:</td>
	                        <td><input id="education" class="easyui-combobox"  name="xlId" style="width: 200px;" ></td>
	                        <td></td>
	                        <td>政治面貌:</td>
	                        <td><input id="politicsState" class="easyui-combobox"  name="zzmmId"  style="width: 200px;"></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td>民族:</td>
	                        <td><input id="nation" class="easyui-combobox"  name="mzId" style="width: 200px;"></td>
	                        <td></td>
	                        <td>党内职务:</td>
	                        <td><input id="partyJob" class="easyui-combobox"  name="dnzwId" style="width: 200px;"></td>
	                        <td></td>
	                    </tr>
	                    <tr>                            
	                        <td>行政职务:</td>
	                        <td><input id="administrativeJob" class="easyui-combobox"  name="xzzwId" style="width: 200px;" ></td>
	                        <td></td>
	                        <td>部门:</td>
	                        <td><input id="department" class="easyui-combobox"  name="bmId" style="width: 200px;" ></td>
	                        <td></td>
	                    </tr>
	                    <tr>    
	                        <td>支部类型:</td>
	                        <td><input id="branchType" class="easyui-combobox"  name="zbLxdm" style="width: 200px;" ></td>
	                        <td></td>
	                        <td >支部:</td>
	                        <td><input id="branch" class="easyui-combobox"  name="zbId" style="width: 200px;" ></td>
	                        <td></td>
	                    </tr>    
	                    <tr>     
	                        <td >用户描述:</td>
	                        <td><input  class="easyui-textbox"  name="userMs" style="width: 200px; height: 50px;"  ></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td ></td>
	                        <td ></td>
	                        <td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a> </td>
	                    </tr>    
	                </table>
	            </form>
	        </div>
	    </div>  
    </s:hasPermission>
    
    <!--  授权 -->
     <s:hasPermission name="user-authority">
	    <div class="easyui-window" title="用户授权" id="authorityWindow"
	        collapsible="false" minimizable="false" maximizable="false" style="top: 100px; left: 200px">
	        <div style="height: 31px; overflow: hidden;" split="false" border="false">
	            <div class="datagrid-toolbar">
	                <a id="authorityButton" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
	                <script type="text/javascript">
	                    $(function() {
	                        $("#authorityButton").click(function() {
	                            //表单校验
	                            var r = $("#authorityForm").form('validate');
	                            if (r) {
	                            	var postdata = $("#authorityForm").serializeJson();
	                            	console.log(postdata.roleIds.join());

	                            	$.post(
                                        "authorityUser", 
											{
												'userId':postdata.userId,
												'roleIds':postdata.roleIds.join()
											},
                                        function (date) {
                                            if(date.error == 0){
                                                $("#authorityWindow").window("close");
                                                $("#grid").datagrid('reload');
                                            }else {
                                                $.messager.alert("提示信息","修改失败！","warning");
                                                $("#authorityWindow").window("close");
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
	            <form id="authorityForm" method="post" action="authorityUser" >
	                <table class="table-edit" width="90%" align="center">
	                    <tr class="title">
	                        <td >用户信息</td>
	                        <input type="hidden" id="authorityUserId" name="userId"/>
	                    </tr>
	                    <tr>
	                        <td style="width: 80px;">用户名:</td>
	                        <td><input class="easyui-textbox"  name="userMc"  style="width: 200px;" data-options="required:true,editable:false" ></td>
	                     </tr>  
	                      <tr>
	                        <td>用户姓名:</td>
	                        <td><input class="easyui-textbox"  name="yhxxXm" style="width: 200px;" data-options="required:true,editable:false"></td>
	                      </tr> 
	                    <tr>     
	                        <td>选择角色:</td>
	                        <td colspan="5" id="authorityRoleId"></td>
	                     </tr>   
	                 </table>
	            </form>
	        </div>
	    </div>
    </s:hasPermission>
    
<script type="text/javascript">
	// 隐藏id
    $("#userId").next().hide();
    $("#authorityUserId").next().hide();

	//用于格式化日期 
	/*$.fn.datebox.defaults.formatter = function(date){
	    var y = date.getFullYear();
	    var M = date.getMonth()+1;
	    var d = date.getDate();
	    return y+'/'+M+'/'+d;
	};*/
	
	var flagUserName = 1;
	
	function validateUserName(data){
		$('#validateUserName').textbox('setValue', $(this).val());
        var userName = $('#validateUserName').textbox('getValue');
        $.post(
            "validateUserName/" + userName, 
            { userName: userName},
            function(date){
            	if(date == 'error'){
            		$('#msg').empty();
            		$('#msg').append('<font color="red" >'+"用户名已经存在"+'</font>');
            		flagUserName = 0;        		
            	}else{
            		$('#msg').empty();
            	}
            }
        );
	};
	
	//添加
	function doAdd() {
		//页面加载完成后，发送ajax请求，获取所有的角色数据
        $.post('../role/loadRoleList',function(data){
            //在ajax回调函数中，解析json数据，展示为checkbox
            for(var i=0;i<data.length;i++){
                var id = data[i].jsId;
                var name = data[i].jsMc;
                $("#roleId").append('<input id="'+id+'" type="checkbox" name="roleIds" value="'+id+'"><label for="'+id+'">'+name+'</label>');
            }
        });
		 //  打开窗口
	    $('#addWindow').window("open");
		// 加载用户类型
		$('#userState').combobox({    
            url:'../userState/loadUserStateAll',    
            valueField:'ztId',    
            textField:'ztMc'
        });
		// 加载学历
		$('#education').combobox({    
            url:'../education/loadEducationAll',    
            valueField:'xlId',    
            textField:'xlMc'
        });
		// 加载政治面貌
		$('#politicsState').combobox({    
            url:'../politicsState/loadPoliticsStateAll',    
            valueField:'zzmmId',    
            textField:'zzmmMc'
        });
		// 加载籍贯
	    $('#place').combobox({    
            url:'../other/loadBmByListAll',
            valueField:'jgId',
            textField:'name'
        });
		// 加载民族
		$('#nation').combobox({    
            url:'../nation/loadNationAll',    
            valueField:'mzId',    
            textField:'mzMc'
        });
		// 加载党内职务
        $('#partyJob').combobox({    
            url:'../partyJob/loadPartyJobAll',    
            valueField:'dnzwId',    
            textField:'dnzwMc'
        });
        // 加载行政职务
        $('#administrativeJob').combobox({    
            url:'../administrativeJob/loadAdministrativeJobAll',    
            valueField:'xzzwId',    
            textField:'xzzwMc'
        });
		// 加载部门
        $('#department').combobox({    
            url:'../department/loadBm',
            valueField:'bmId',    
            textField:'bmMc',
            onSelect: function(rec){      
                // 加载支部
                $('#branch').combobox({    
                    url:'../branch/loadBranch/' + rec.bmId,    
                    valueField:'zbId',    
                    textField:'zbMc'
                });    
            } 
        });
        // 加载支部类型
        $('#branchType').combobox({    
            url:'../branch/loadBranchTypeList',
            valueField:'zblxId',    
            textField:'zblxMc'
        });
        // 加载支部
        $('#branch').combobox({    
            url:'../branch/loadBranchAllList',
            valueField:'zbId',    
            textField:'zbMc'
        });
		
	};  
	
	// 修改
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
		// 加载用户类型
        $('.userState').combobox({    
            url:'../userState/loadUserStateAll',    
            valueField:'ztId',    
            textField:'ztMc',
            onLoadSuccess:function(){
                $(this).combobox('select',rows[0].userZtId);
            }
        });
        // 加载学历
        $('.education').combobox({    
            url:'../education/loadEducationAll',    
            valueField:'xlId',    
            textField:'xlMc',
            onLoadSuccess:function(){
                $(this).combobox('select',rows[0].xlId);
            }
        });
        // 加载政治面貌
        $('.politicsState').combobox({    
            url:'../politicsState/loadPoliticsStateAll',    
            valueField:'zzmmId',    
            textField:'zzmmMc',
            onLoadSuccess:function(){
                $(this).combobox('select',rows[0].zzmmId);
            }
        });
        // 加载籍贯
        $('.place').combobox({    
            url:'../other/loadBmByListAll',    
            valueField:'jgId',    
            textField:'name',
            onLoadSuccess:function(){
                $(this).combobox('select',rows[0].jgId);
            }
        });
        // 加载民族
        $('.nation').combobox({    
            url:'../nation/loadNationAll',    
            valueField:'mzId',    
            textField:'mzMc',
            onLoadSuccess:function(){
                $(this).combobox('select',rows[0].mzId);
            }
        });
        // 加载党内职务
        $('.partyJob').combobox({    
            url:'../partyJob/loadPartyJobAll',    
            valueField:'dnzwId',    
            textField:'dnzwMc',
            onLoadSuccess:function(){
                $(this).combobox('select',rows[0].dnzwId);
            }
        });
        // 加载行政职务
        $('.administrativeJob').combobox({    
            url:'../administrativeJob/loadAdministrativeJobAll',    
            valueField:'xzzwId',    
            textField:'xzzwMc',
            onLoadSuccess:function(){
                $(this).combobox('select',rows[0].xzzwId);
            }
        });
        // 加载部门
        $('.department').combobox({    
            url:'../department/loadBm',
            valueField:'bmId',    
            textField:'bmMc',
            onLoadSuccess:function(){
                $(this).combobox('select',rows[0].bmId); 
            }
        });
        // 加载支部类型
        $('.branchType').combobox({    
            url:'../branch/loadBranchTypeList',
            valueField:'zblxId',    
            textField:'zblxMc'
        });
        // 加载支部
        $('.branch').combobox({    
            url:'../branch/loadBranchAllList',
            valueField:'zbId',    
            textField:'zbMc',
            onLoadSuccess:function(){
                $(this).combobox('select',rows[0].zbId);
            }
        });
        $("#userMc").textbox('setValue', rows[0].userMc);
        $("#yhxxXm").textbox('setValue', rows[0].yhxxXm);
        $("#yhxxDhhm").textbox('setValue', rows[0].yhxxDhhm);
        $("#yhxxSjh").textbox('setValue', rows[0].yhxxSjh);
        $("#yhxxSfzh").textbox('setValue', rows[0].yhxxSfzh);
        $("#yhxxYx").textbox('setValue', rows[0].yhxxYx);
        $("#yhxxCsrq").textbox('setValue', rows[0].yhxxCsrq);
        $("#userMs").textbox('setValue', rows[0].userMs);
        $("#userId").val(rows[0].userId);
		 //  打开窗口
        $('#updateWindow').window("open");
	}; 

	// 删除
	function doDelete() {
		//获取数据表格中所有选中的行(数据)
        var rows = $("#grid").datagrid("getSelections");
        if(rows.length == 0){
            //没有选中
            $.messager.alert("提示信息","请选择需要删除选项！","warning");
        }else{
            //选中
            $.messager.confirm("删除确认","你确定要删除选中的选项吗？",function(r){
                if(r){
                    //创造一个数组
                    var array = new Array();
                    //通过循环获取id
                    for(var i=0;i<rows.length;i++){
                        //json对象
                        var id = rows[i].userId;
                        //保存在我们的数组里面
                        array.push(id);
                    }
                    var ids = array.join(",");
                    $.post("deleteUser/"+ids);
                    $("#grid").datagrid('load');    // 重新载入当前页面数据  
                }
            });
        } 
	};
	
	// 查询
	function doSearch() {
        //  打开窗口
        $('#searchWindow').window("open");
	};

	// 导入用户
	function doImport(){
		$("#button-import").upload({
			 name: 'file',  // <input name="file" />
		     action: 'uploadUserXls',  // 提交请求action路径
		     enctype: 'multipart/form-data', // 编码格式
		     autoSubmit: true, // 选中文件提交表单
		     onComplete: function(response) {
		        	if(response=="success"){
		        		$.messager.alert("提示信息","数据导入成功！","info");
		        		$("#grid").datagrid("reload");
		        	}else{
		        		$.messager.alert("错误提示",response,"error");
		        	}
		     }// 请求完成时 调用函数
		});
	}
	
	// 导出用户
	function doOutport(){
		location.href ="exportUserExcel";
	}
	
	// 导出用户模板
	function doOutportTemplate(){
		location.href ="exportUserExcelTemplate";
	}
	
	function doAuthority(){
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
		//页面加载完成后，发送ajax请求，获取所有的角色数据
		$.post('../role/loadUserRoleList',function(data){
	        // 清空已存在的数据
			$("#authorityRoleId").empty();
			for(var i=0;i<data.length;i++){
				var id = data[i].jsId;
				var name = data[i].jsMc;
				//在ajax回调函数中，解析json数据，展示为checkbox
				$("#authorityRoleId").append('<input id="'+id+'" type="checkbox" name="roleIds" value="'+id+'"><label for="'+id+'">'+name+'</label>');
			}
			// 将本来原有的角色进行默认
			$.ajax({
				url : '../role/getRoles/' + rows[0].userId,
				type : 'POST',
				dataType : 'json',
				success :function(data){
					$.each(data, function(i, item){
						$('input:checkbox[value='+item.jsId+']').attr('checked','true');
					 });
				},
				error : function(msg){
					alert('默认值填充失败!');
				}
			});
		});
        // 加载默认值
        $("#authorityWindow").form("load", rows[0]);
		$('#authorityWindow').window("open");
		
	}
	
	//工具栏
	var toolbar = [
		<s:hasPermission name="user-add">
			{
		        id : 'button-add',
		        text : "添加用户",
		        iconCls : "icon-add",
		        handler : doAdd
		    } ,
	    </s:hasPermission>
	    <s:hasPermission name="user-import">
	    {
	        id : 'button-import',
	        text : "导入用户",
	        iconCls : "icon-undo",
	        handler : doImport
	    } , 
	    </s:hasPermission>
	    <s:hasPermission name="user-export">
	    {
	        id : 'button-outport',
	        text : "导出用户",
	        iconCls : "icon-redo",
	        handler : doOutport
	    } ,
	    </s:hasPermission>
	    <s:hasPermission name="user-exportTemplate">
	    {
	        id : 'button-outportTemplate',
	        text : "导出用户模块板",
	        iconCls : "icon-redo",
	        handler : doOutportTemplate
	    } , 
	    </s:hasPermission>
	    <s:hasPermission name="user-update">
	    {
	        id : "button-edit",
	        text : "修改用户",
	        iconCls : "icon-edit",
	        handler : doEdit
	    } ,
	    </s:hasPermission>
	    <s:hasPermission name="user-delete">
	    {
	        id : "button-delete",
	        text : "删除用户",
	        iconCls : "icon-cancel",
	        handler : doDelete
	    } ,
        </s:hasPermission>
        <s:hasPermission name="user-search">
        {
            id : 'button-search',
            text : '查询',
            iconCls : 'icon-search',
            handler : doSearch
        } , 
        </s:hasPermission>
        <s:hasPermission name="user-authority">
        {
            id : 'button-authority',
            text : '授权',
            iconCls : 'icon-man',
            handler : doAuthority
        }
        </s:hasPermission>
     ];

	//定义列
	var columns = [[{
	        field : 'userId',
	        checkbox : true,
	    } , {
	        field : 'userMc',
	        title : '用户名',
	        width : 80
	    } , {
	        field : 'yhxxXm',
	        title : '姓名',
	        width : 80
	    } , {
            field : 'dnzwMc',
            title : '党内职务',
            width : 100
        }, {
            field : 'xzzwMc',
            title : '行政职务',
            width : 100
        }, {
            field : 'bmMc',
            title : '部门',
            width : 120
        }
	]];

	$(function(){
		
		// 先将body隐藏，再显示，不会出现页面刷新效果
        $("body").css({
            visibility : "visible"
        });
		
	    // 数据表格属性
		$("#grid").datagrid({
		    iconCls : 'icon-forward',
		    fit : true,
		    border : true,
		    rownumbers : true,
		    striped : true,
		    pageList : [ 5, 10, 15, 20 ],
		    pageSize : 20,
		    pagination : true,
		    toolbar : toolbar,
		    url : "loadUserInfoPageList",
		    idField : 'userId',
		    columns : columns,
		    fitColumns : true
		});
		
		// 添加
	    $('#addWindow').window({
		    title : '添加用户',
		    width : 1000,
		    modal : true,
		    shadow : true,
		    closed : true,
		    height : 800,
		    resizable : false
		});
		
	     // 修改
        $('#updateWindow').window({
            title : '修改用户',
            width : 1000,
            modal : true,
            shadow : true,
            closed : true,
            height : 650,
            resizable : false
        });
		
	     
		// 查询
        $('#searchWindow').window({
            title : '查询用户',
            width : 1000,
            modal : true,
            shadow : true,
            closed : true,
            height : 500,
            resizable : false
        });
		
		// 授权
        $('#authorityWindow').window({
            title : '查询用户',
            width : 500,
            modal : true,
            shadow : true,
            closed : true,
            height : 500,
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