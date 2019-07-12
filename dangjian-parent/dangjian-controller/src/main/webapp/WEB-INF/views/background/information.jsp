<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/jsAndCss/js/jquery.portal.js"></script>
<title>消息中心</title>
</head>
<body>
    <div id="layout_portal_portal" style="position:relative; ">
        <div></div>
        <div></div>
    </div>
    <s:lacksRole name="admin">
    
    </s:lacksRole>
    
    <script>
    
    $(function() {
        var height = $(window).height()/2;
        panels = [ {
            id : 'p1',
            title : '通知栏',
            height : height,
            collapsible : true,
            href:'commmon'
        }
        <s:lacksRole name="admin">
        , {
            id : 'p2',
            title : '党务审批事宜',
            height : height,
            collapsible : true,
            href:'publicityApproval'
        }
        </s:lacksRole>
        <s:lacksRole name="admin">
        , {
            id : 'p3',
            title : '新闻审批事宜',
            height : height,
            collapsible : true,
            href:'newsApproval'
        }
        </s:lacksRole>
        , {
            id : 'p4',
            title : '系统BUG反馈',
            height : height,
            collapsible : true,
            href:'systemBug'
        }];
         $('#layout_portal_portal').portal({
            border : false,
            fit : true
         });
        var state = state = 'p1,p2:p3,p4';/*冒号代表列，逗号代表行*/

        addPortalPanels(state);
        $('#layout_portal_portal').portal('resize');
    
    });
    
    function getPanelOptions(id) {
        for ( var i = 0; i < panels.length; i++) {
            if (panels[i].id == id) {
                return panels[i];
            }
        }
        return undefined;
    }
    function getPortalState() {
        var aa=[];
        for(var columnIndex=0;columnIndex<2;columnIndex++) {
            var cc=[];
            var panels=$('#layout_portal_portal').portal('getPanels',columnIndex);
            for(var i=0;i<panels.length;i++) {
                cc.push(panels[i].attr('id'));
            }
            aa.push(cc.join(','));
        }
        return aa.join(':');
    }
    function addPortalPanels(portalState) {
        var columns = portalState.split(':');
        for (var columnIndex = 0; columnIndex < columns.length; columnIndex++) {
            var cc = columns[columnIndex].split(',');
            for (var j = 0; j < cc.length; j++) {
                var options = getPanelOptions(cc[j]);
                if (options) {
                    var p = $('<div/>').attr('id', options.id).appendTo('body');
                    p.panel(options);
                    $('#layout_portal_portal').portal('add', {
                        panel : p,
                        columnIndex : columnIndex
                    });
                }
            }
        }
    }
    </script>
</body>
</html>