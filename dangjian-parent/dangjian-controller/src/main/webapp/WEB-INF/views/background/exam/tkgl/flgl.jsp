<%--
  Created by IntelliJ IDEA.
  User: lishidongol
  Date: 2018/9/29
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分类管理</title>
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
<%--修改分类窗口内容（默认不显示）--%>
<div hidden id="updateFlContext">
    <form class="layui-form layui-form-pane" method="post">

        <div class="layui-form-item" style="width: fit-content;margin: 15px auto 15px auto">
            <label class="layui-form-label">分类ID</label>
            <div class="layui-input-inline">
                <input type="text" name="flid" disabled required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="width: fit-content;margin: 15px auto 15px auto">
            <label class="layui-form-label">分类名称</label>
            <div class="layui-input-inline">
                <input type="text" name="flName" required lay-verify="required" placeholder="请输入名称" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="width: fit-content;margin: 15px auto 15px auto">
            <label class="layui-form-label">所属分类</label>
            <div class="layui-input-inline">
                <select name="fjfl" id="fjflSelect">
                    <option value="0">根目录</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item" style="width: fit-content;margin: 15px auto 15px auto">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<%--头部工具栏--%>
<script type="text/html" id="toolbarfllb" lay-filter="toolbarfllb">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add">新增分类</button>
        <button class="layui-btn layui-btn-sm" lay-event="refresh">刷新</button>
    </div>
</script>

<%--单元格工具--%>
<script type="text/html" id="rowToolbar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['layer', 'form', 'table', 'jquery'], function () {
        var table = layui.table
            , $ = layui.$
            , form = layui.form
            , layer = layui.layer;

        var flglTable = table.render({
            elem: "#flglTable"
            , url: '${pageContext.request.contextPath }/kszx/tkgl/loadCategories' //数据接口
            , method: 'post'
            , title: "分类列表"
            , page: false //开启分页
            , toolbar: '#toolbarfllb'
            , loading: true
            , cols: [[ //表头
                {type: 'checkbox'},
                {field: 'id', title: 'ID', width: 80, sort: true}
                , {field: 'flmc', title: '分类名称'}
                , {field: 'flfjid', title: '父类ID'}
                , {
                    field: 'fjmc', title: '所属分类', templet: function (d) {
                        if (d.flfjid === 0) {
                            return "根目录";
                        } else {
                            return d.fjmc;
                        }
                    }
                }
                , {fixed: 'right', width: 150, align: 'center', toolbar: '#rowToolbar'}
            ]]
            , parseData: function (res) {
                var data = [];
                for (var i = 0; i < res.length; i++) {
                    var obj = {};
                    obj.id = res[i].id;
                    obj.flmc = res[i].name;
                    obj.flfjid = res[i].parentId;
                    for (var j = 0; j < res.length; j++) {
                        if (res[i].parentId === res[j].id) {
                            obj.fjmc = res[j].name;
                            break;
                        }
                    }
                    data.push(obj);
                }
                return {"data": data, "code": 0, "count": data.length, "msg": ""};
            }
        });

        //监听行工具条
        table.on('tool(flglTable)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('删除分类将会把此分类的所有子分类都删除，并将与之关联的试题分配到默认分类中，是否要执行此操作？', function (index) {
                    layer.load(2);
                    $.post("${pageContext.request.contextPath }/kszx/tkgl/removeCategorie/" + data.id, function (data) {
                        if (data.code === 0) {
                            layer.closeAll("loading");
                            obj.del();
                        } else {
                            layer.msg(data.msg);
                            layer.closeAll("loading");
                        }
                        layer.close(index);
                    });
                });
            } else if (obj.event === 'edit') {
                /*加载目录*/
                $.get("${pageContext.request.contextPath }/kszx/tkgl/loadCategories?format=1"
                    , function (datas) {
                        var node = JSON.parse(datas);
                        node.shift();//过滤默认分类
                        $("#fjflSelect").empty();
                        $("#fjflSelect").append("<option value=\"0\">根目录</option>");
                        for (var i = 0; i < node.length; i++) {
                            //第一步：先添加根目录
                            if(data.flfjid === node[i].id){
                                $("#fjflSelect").append("<option selected='selected' value=" + node[i].id + ">" + node[i].name + "</option>");
                            }else {
                                $("#fjflSelect").append("<option value=" + node[i].id + ">" + node[i].name + "</option>");
                            }
                            //递归二级目录
                            dgFl(node[i].children, "|-->",data.flfjid);
                        }
                        layer.open({
                            type: 1,
                            shadeClose: true,
                            shade: 0.8,
                            title: '修改分类', //不显示标题
                            area: ["50%", "80%"],
                            content: $('#updateFlContext')
                        });
                        $("#updateFlContext input[name='flName']").val(data.flmc);
                        $("#updateFlContext input[name='flid']").val(data.id);
                        form.render();
                    });

            }
        });

        form.on('submit(formDemo)', function(data){
            $.post("${pageContext.request.contextPath }/kszx/tkgl/updateCategorie",data.field,function (data) {
                if(data.code === 0){
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                }else {
                    layer.msg(data.msg);
                }
            });
            return false;
        });

        //监听头部工具栏
        table.on('toolbar(flglTable)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'add':
                    layer.open({
                        type: 2,
                        title: "添加分类",
                        shadeClose: true,
                        shade: 0.8,
                        area: ["50%", "80%"],
                        content: '${pageContext.request.contextPath }/kszx/tkgl/addfl',
                        end: function () {
                            flglTable.reload();
                        }
                    });
                    break;
                case 'refresh':
                    flglTable.reload();
                    break;
            }
        });

        function dgFl(node, separater,id) {
            var sep = separater + "-->";
            for (var i = 0; i < node.length; i++) {
                if(id === node[i].id){
                    $("#fjflSelect").append("<option selected='selected' value=" + node[i].id + ">" + separater + node[i].name + "</option>")
                }else {
                    $("#fjflSelect").append("<option value=" + node[i].id + ">" + separater + node[i].name + "</option>")
                }
                dgFl(node[i].children, sep,id);
            }
        }
    });
</script>
</html>
