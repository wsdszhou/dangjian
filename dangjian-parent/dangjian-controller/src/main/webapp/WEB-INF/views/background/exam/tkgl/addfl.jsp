<%--
  Created by IntelliJ IDEA.
  User: lishidongol
  Date: 2018/9/30
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加分类</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
</head>
<body>

<form class="layui-form layui-form-pane" method="post">
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

</body>
<script>
    layui.use(['form', 'layer', 'jquery'], function () {
        var $ = layui.$,
            layer = layui.layer,
            form = layui.form
        ;

        /*加载目录*/
        $.get("${pageContext.request.contextPath }/kszx/tkgl/loadCategories?format=1"
            , function (data) {
                var node = JSON.parse(data);
                node.shift();//过滤默认分类
                for (var i = 0; i < node.length; i++) {
                    //第一步：先添加根目录
                    $("#fjflSelect").append("<option value=" + node[i].id + ">" + node[i].name + "</option>");
                    //递归二级目录
                    dgFl(node[i].children, "|-->");
                }
                form.render();
            });

        function dgFl(node, separater) {
            var sep = separater+"-->";
            for (var i = 0; i < node.length; i++) {
                $("#fjflSelect").append("<option value=" + node[i].id + ">" + separater + node[i].name + "</option>");
                dgFl(node[i].children, sep);
            }
        }

        form.on('submit(formDemo)', function(data){
            $.post("${pageContext.request.contextPath }/kszx/tkgl/addCategorie",data.field,function (data) {
                if(data.code === 0){
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                }else {
                    layer.msg(data.msg);
                }
            });
            return false;
        });

    })
</script>
</html>
