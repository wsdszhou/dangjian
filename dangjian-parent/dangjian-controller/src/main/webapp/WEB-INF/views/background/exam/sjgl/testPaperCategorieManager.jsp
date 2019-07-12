<%--
  Created by IntelliJ IDEA.
  User: lishidongol
  Date: 2018/11/8
  Time: 5:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>试卷分类管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row">
        <table id="flglTable" lay-filter="flglTable"></table>
    </div>
</div>

</body>

<%--头部工具栏--%>
<script type="text/html" id="toolbarfllb" lay-filter="toolbarfllb">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add">新增分类</button>
        <%--<button class="layui-btn layui-btn-sm" lay-event="refresh">刷新</button>--%>
    </div>
</script>

<%--单元格工具--%>
<script type="text/html" id="rowToolbar">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['layer','table', 'jquery'], function () {
        var layer = layui.layer,
            table = layui.table,
            $ = layui.$;

        table.render({
            elem:'#flglTable',
            url:'${pageContext.request.contextPath }/kszx/sjgl/loadCategories',
            method:'post',
            title:'试卷分类管理',
            page:false,
            toolbar:'#toolbarfllb',
            cols:[[
                {type: 'checkbox'},
                {field: 'id', title: 'ID', width: 80, align: 'center',sort: true},
                {field: 'name', title: '分类名称', width: 200, align: 'center',edit:'text'},
                {fixed: 'right', width: 100, align: 'center', toolbar: '#rowToolbar'}
            ]],
            parseData:function (res) {
                return {'code':0,'data':res,'msg':'','length':res.length};
            }
        });

        //单元格编辑事件监听
        table.on("edit(flglTable)",function (obj) {
            var res = obj.data;
            if(res.id === 1){
                layer.msg("默认分类无法修改");
                return
            }
            $.post("${pageContext.request.contextPath }/kszx/sjgl/modifyCategorie",{id:res.id,name:res.name,parentId:obj.parentId},function (data) {
               layer.msg("修改完成");
            });
        });

        //行内工具
        table.on("tool(flglTable)",function (obj) {
            console.log(obj);
            var res = obj.data;
            if(res.id === 1){
                layer.msg("默认分类无法删除");
                return
            }
            switch(obj.event){
                case 'del':
                    $.post("${pageContext.request.contextPath }/kszx/sjgl/deleteCategorie",{id:res.id},function (data) {
                        layer.msg(res.name+" 已删除");
                        obj.del();
                    });
                    break;
            }

        });
        //头部工具
        table.on("toolbar(flglTable)",function (obj) {
            console.log(obj);
            layer.prompt({title: '输入新分类的名称，并确认', formType: 0}, function(pass, index){
                console.log(pass);
                $.post("${pageContext.request.contextPath }/kszx/sjgl/addCategorie",{name:pass},function (data) {
                    table.reload("flglTable");
                    layer.close(index);
                    layer.msg("添加成功");
                });

            });
        })

    });
</script>
</html>
