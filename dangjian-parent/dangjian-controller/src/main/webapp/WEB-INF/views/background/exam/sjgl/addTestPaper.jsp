<%--
  Created by IntelliJ IDEA.
  User: king
  Date: 2018/11/9
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加试卷</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
</head>
<body>
<form class="layui-form" id="addTestPaperForm" lay-filter="addTestPaperForm" style="margin-top: 20px">
    <div class="layui-form-item">
        <label class="layui-form-label">试卷标题：</label>
        <div class="layui-input-block">
            <input class="layui-input" name="sjbt" id="sjbt" type="text" lay-verify="required">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">试卷分类：</label>
        <div class="layui-input-inline">
            <select name="sjlb" id="sjlb">
                <option value="1" selected>默认分类</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">组卷方式：</label>
        <div class="layui-input-block">
            <input type="radio" name="zjfs" value="1" title="固定试题" checked>
            <input type="radio" name="zjfs" value="2" title="随机试题">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">自动交卷：</label>
        <div class="layui-input-block">
            <input type="checkbox" name="zdjj" id="zdjj" value="1" lay-skin="switch" lay-text="开启|关闭" checked="">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">判断题：</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" lay-verify="required" placeholder="每题分数" name="pdtfs">
        </div>

        <label class="layui-form-label">单选题：</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" lay-verify="required" placeholder="每题分数" name="dxtfs">
        </div>

        <label class="layui-form-label">多选题：</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" lay-verify="required" placeholder="每题分数" name="dxtsfs">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">及格百分比：</label>
        <div class="layui-input-inline">
            <input type="text" id="jgfs" name="jgfs" class="layui-input" lay-verify="required" value="60">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">答卷时长：</label>
        <div class="layui-input-inline">
            <input type="text" id="djsj" name="djsj" class="layui-input" lay-verify="required" value="100">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">开始时间：</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" id="kssj" name="kssj" lay-verify="required">
        </div>

        <label class="layui-form-label">结束时间：</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" id="jssj" name="jssj" lay-verify="required">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">考试说明：</label>
        <div class="layui-input-block">
            <textarea id="kssm" name="kssm" style="display: none;"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-primary" lay-submit lay-filter="saveTestPaperBtn">保存并进入下一步</button>
        </div>
    </div>

</form>
</body>

<script>

    layui.use(['layer', 'form', 'table', 'jquery', 'element', 'laydate', 'layedit'], function () {
        var layer = layui.layer,
            form = layui.form,
            $ = layui.$,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //处理试题分类
        $.get("${pageContext.request.contextPath }/kszx/sjgl/loadCategories", function (data) {
            var row = JSON.parse(data);
            var stfl = $("#sjlb");
            stfl.empty();
            for (var i = 0; i < row.length; i++) {
                var option = $("<option></option>");
                option.val(row[i].id);
                option.text(row[i].name);
                stfl.append(option);
            }
            form.render();
        });


        form.on("submit(saveTestPaperBtn)", function (data) {
            var postdata = {};
            postdata.sjbt = data.field.sjbt;
            postdata.sjlb = data.field.sjlb;
            postdata.zjfs = data.field.zjfs;
            postdata.jgfs = data.field.jgfs;
            postdata.djsj = data.field.djsj;
            postdata.kssj = data.field.kssj;
            postdata.jssj = data.field.jssj;
            postdata.zdjj = data.field.zdjj;
            postdata.pdtfs = data.field.pdtfs;
            postdata.dxtfs =data.field.dxtfs;
            postdata.dxtsfs = data.field.dxtsfs;
            postdata.kssm = layedit.getContent(kssmEdit);
            console.log(postdata);
            $.post("${pageContext.request.contextPath }/kszx/sjgl/addTestPaperBaseInfo",{data:JSON.stringify(postdata)},function (data) {
                console.log(data);
                var res = JSON.parse(data);
                layer.confirm("保存成功，是否进入试题编辑？",{btn:["编辑试题","返回试卷列表"]},function() {
                    window.location.href = "${pageContext.request.contextPath }/kszx/sjgl/"+res.url+"/"+res.key;
                },function () {
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                })
            });

            return false;
        });

        var kssmEdit = layedit.build("kssm", {
            height: 180,
            tool: ['left', 'center', 'right', '|', 'strong', 'italic', 'underline']
        });

        laydate.render({
            elem: "#kssj",
            type: "datetime",
            calendar: true,
            min: "2018-01-01 00:00:00",
            max: "2050-12-31 23:59:59"
        });

        laydate.render({
            elem: "#jssj",
            type: "datetime",
            calendar: true,
            min: "2018-01-01 00:00:00",
            max: "2050-12-31 23:59:59"
        });

    });
</script>
</html>
