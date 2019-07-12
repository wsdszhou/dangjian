
var onlyOpenTitle="欢迎使用";//不允许关闭的标签的标题

var _menus;

function find(menuid){
	var obj=null;
	$.each(_menus.menus, function(i, n) {
		 $.each(n.menus, function(j, o) {
		 	if(o.menuid==menuid){
				obj = o;
			}
		 });
	});
	return obj;
}

function addTab(subtitle,url,icon){
	if(!$('#tabs').tabs('exists',subtitle)){
		$('#tabs').tabs('add',{
			title:subtitle,
			content:createFrame(url),
			closable:true,
			icon:icon
		});
	}else{
		$('#tabs').tabs('select',subtitle);
		$('#mm-tabupdate').click();
	}
	tabClose();
}

function createFrame(url)
{
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}

function tabClose()
{
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close',subtitle);
	})
	/*为选项卡绑定右键*/
	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});

		var subtitle =$(this).children(".tabs-closable").text();

		$('#mm').data("currtab",subtitle);
		$('#tabs').tabs('select',subtitle);
		return false;
	});
}


//绑定右键菜单事件
function tabCloseEven() {
    $('#mm').menu({
        onClick: function (item) {
            closeTab(item.id);
        }
    });
    return false;
}

function closeTab(action)
{
    var alltabs = $('#tabs').tabs('tabs');
    var currentTab =$('#tabs').tabs('getSelected');
	var allTabtitle = [];
	$.each(alltabs,function(i,n){
		allTabtitle.push($(n).panel('options').title);
	})

    switch (action) {
        case "refresh":
            var iframe = $(currentTab.panel('options').content);
            var src = iframe.attr('src');
            $('#tabs').tabs('update', {
                tab: currentTab,
                options: {
                    content: createFrame(src)
                }
            })
            break;
        case "close":
            var currtab_title = currentTab.panel('options').title;
            $('#tabs').tabs('close', currtab_title);
            break;
        case "closeall":
            $.each(allTabtitle, function (i, n) {
                if (n != onlyOpenTitle){
                    $('#tabs').tabs('close', n);
				}
            });
            break;
        case "closeother":
            var currtab_title = currentTab.panel('options').title;
            $.each(allTabtitle, function (i, n) {
                if (n != currtab_title && n != onlyOpenTitle)
				{
                    $('#tabs').tabs('close', n);
				}
            });
            break;
        case "closeright":
            var tabIndex = $('#tabs').tabs('getTabIndex', currentTab);

            if (tabIndex == alltabs.length - 1){
                alert('亲，后边没有啦 ^@^!!');
                return false;
            }
            $.each(allTabtitle, function (i, n) {
                if (i > tabIndex) {
                    if (n != onlyOpenTitle){
                        $('#tabs').tabs('close', n);
					}
                }
            });

            break;
        case "closeleft":
            var tabIndex = $('#tabs').tabs('getTabIndex', currentTab);
            if (tabIndex == 1) {
                alert('亲，前边那个上头有人，咱惹不起哦。 ^@^!!');
                return false;
            }
            $.each(allTabtitle, function (i, n) {
                if (i < tabIndex) {
                    if (n != onlyOpenTitle){
                        $('#tabs').tabs('close', n);
					}
                }
            });

            break;
        case "exit":
            $('#closeMenu').menu('hide');
            break;
    }
}
function onClick(event, treeId, treeNode, clickFlag) {
    // 判断树菜单节点是否含有 page属性
    if (treeNode.page!=undefined && treeNode.page!= "") {
        var content = '<div style="width:100%;height:100%;overflow:hidden;">'
                + '<iframe src="'
                + treeNode.page
                + '" scrolling="auto" style="width:100%;height:100%;border:0;" ></iframe></div>';
        if ($("#tabs").tabs('exists', treeNode.name)) {// 判断tab是否存在
            $('#tabs').tabs('select', treeNode.name); // 切换tab
            var tab = $('#tabs').tabs('getSelected'); 
            $('#tabs').tabs('update', {
                tab: tab,
                options: {
                    title: treeNode.name,
                    content: content
                }
            });
        } else {
            // 开启一个新的tab页面
            $('#tabs').tabs('add', {
                title : treeNode.name,
                content : content,
                closable : true
            });
        }
    }
}

//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
	$.messager.alert(title, msgString, msgType);
}

/*******顶部特效 *******/
/**
 * 更换EasyUI主题的方法
 * @param themeName
 * 主题名称
 */
changeTheme = function(themeName) {
    var $easyuiTheme = $('#easyuiTheme');
    var url = $easyuiTheme.attr('href');
    var href = url.substring(0, url.indexOf('themes')) + 'themes/'
            + themeName + '/easyui.css';
    $easyuiTheme.attr('href', href);
    var $iframe = $('iframe');
    if ($iframe.length > 0) {
        for ( var i = 0; i < $iframe.length; i++) {
            var ifr = $iframe[i];
            $(ifr).contents().find('#easyuiTheme').attr('href', href);
        }
    }
};

$(function() {
    $('#editpass').click(function() {
        $('#w').window('open');
    });
    $('#btnEp').click(function() {
        serverLogin();
    })
	$('#btnCancel').click(function(){closePwd();})
});

//退出登录
function logoutFun() {
    $.messager
    .confirm('系统提示','您确定要退出本次登录吗?',function(isConfirm) {
        if (isConfirm) {
            location.href = 'logout';
        }
    });
}

 //修改密码
function serverLogin() {
    var $newpass = $('#txtNewPass');
    var $rePass = $('#txtRePass');

    if ($newpass.val() == '') {
        msgShow('系统提示', '请输入密码！', 'warning');
        return false;
    }
    if ($rePass.val() == '') {
        msgShow('系统提示', '请在一次输入密码！', 'warning');
        return false;
    }

    if ($newpass.val() != $rePass.val()) {
        msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
        return false;
    }

    $.post('../back/yh/updatePassword',{password: $newpass.val()}, function(msg) {
        msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
        $('#editPwdWindow').window('close');
    })
    
}

$("#btnCancel").click(function(){
    $('#editPwdWindow').window('close');
});
// 修改密码
function editPassword() {
    $('#editPwdWindow').window('open');
}
// 版权信息
function showAbout(){
    $.messager.alert("党建系统v1.0","管理员邮箱: 123456789@qq.cn");
}


//登录提示
$(function() {
  // 页面加载后 右下角 弹出窗口
  /**************/
  window.setTimeout(function(){
      $.messager.show({
          title:"消息提示",
          msg:'欢迎登录，超级管理员！ <a href="javascript:void" onclick="top.showAbout();">联系管理员</a>',
          timeout:5000
      });
  },3000);
  
  $("#btnCancel").click(function(){
      $('#editPwdWindow').window('close');
  });
});

