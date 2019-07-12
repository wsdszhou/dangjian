<%--
  Created by IntelliJ IDEA.
  User: lishidongol
  Date: 2018/10/7
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>编辑试题</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form layui-form-pane" id="addXxForm">
            <div style="height: 10px"></div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">题目：</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea"  name="stmc"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">分类：</label>
                <div class="layui-input-inline">
                    <select name="stfl">
                        <c:forEach items="${requestScope.stfl}" var="list">
                            <option value="${list.id}">${list.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <%--<div class="layui-form-item">
                <label class="layui-form-label">分数：</label>
                <div class="layui-input-inline">
                    <input type="text" name="stfs" value="" required
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>--%>

            <div class="layui-form-item">
                <label class="layui-form-label">难度：</label>
                <div class="layui-input-inline">
                    <input type="text" name="stnd" value="" required
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">解析：</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" placeholder="无解析" name="stjx"></textarea>
                </div>
            </div>

            <div class="layui-form-item" id="stlxDiv" pane="">
                <label class="layui-form-label">类型：</label>
                <div class="layui-input-block">
                    <input type="radio" lay-filter="stlx" name="stlx" value="判断题" title="判断题">
                    <input type="radio" lay-filter="stlx" name="stlx" value="单选题" title="单选题">
                    <input type="radio" lay-filter="stlx" name="stlx" value="多选题" title="多选题">
                </div>
            </div>

            <c:set var="AtoZ" value="ABCDEFGHIJKLMN"/>
            <div class="layui-form-item" id="stdaDiv" pane="">
                <label class="layui-form-label">答案：</label>
                <div class="layui-input-block">

                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-btn addxx" style="display: none">添加选项</div>
                <div class="layui-btn layui-btn-danger" lay-submit lay-filter="saveBtn">保存</div>
            </div>

        </form>
    </div>
</div>
</body>
<script>


    layui.use(['layer', 'form', 'jquery'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;
        var AtoZ = "ABCDEFGHIJKLMN";

        function getXxNode(num){
            var layuiItem = $("<div></div>").addClass("layui-form-item layui-form-text stxx");
            //将当前元素的选项填入,选项经过计算得出
            var xx = AtoZ.charAt(num);
            var layuiLabel = $("<div></div>").addClass("layui-form-label").text("选项" + xx + ":");
            layuiItem.append(layuiLabel);
            var layuiBlock = $("<div></div>").addClass("layui-input-block");
            var textarea = $("<textarea></textarea>").addClass("layui-textarea").attr("name", "xx-" + xx);
            var groupbtnup = '<div class="layui-btn-group">\n' +
                '<div class="layui-btn layui-btn-sm moveup">\n' +
                '<i class="layui-icon">&#xe619;</i>\n' +
                '</div>\n' +
                '<div class="layui-btn layui-btn-sm movedown">\n' +
                '<i class="layui-icon">&#xe61a;</i>\n' +
                '</div>\n' +
                '<div class="layui-btn layui-btn-sm removexx">\n' +
                '<i class="layui-icon">&#xe640;</i>\n' +
                '</div>\n' +
                '</div>';
            layuiBlock.append(textarea);
            layuiBlock.append(groupbtnup);
            layuiItem.append(layuiBlock);
            return layuiItem;
        }

        //初始化表单
        form.render();
        form.on('submit(saveBtn)', function (data) {
            //获取表单数据
            var formData = data.field;

            if(formData.stlx === "判断题"){
                $.post("${pageContext.request.contextPath }/kszx/tkgl/addQuestion",{
                    stfl:formData.stfl,
                    stfs:formData.stfs,
                    stid:formData.stid,
                    stjx:formData.stjx,
                    stmc:formData.stmc,
                    stnd:formData.stnd,
                    stda:formData.stda,
                    stlx:formData.stlx
                },function (data) {
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                });

            }else if(formData.stlx === "单选题"){
                var stxx = "";
                $(".stxx .layui-textarea").each(function () {
                    stxx = stxx +"-"+$(this).val();
                });

                $.post("${pageContext.request.contextPath }/kszx/tkgl/addQuestion",{
                    stfl:formData.stfl,
                    stfs:formData.stfs,
                    stid:formData.stid,
                    stjx:formData.stjx,
                    stmc:formData.stmc,
                    stnd:formData.stnd,
                    stda:formData.stda,
                    stlx:formData.stlx,
                    stxx:stxx.substr(1)
                },function (data) {
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                });

            }else if(formData.stlx === "多选题"){

                var stxx = "";
                var stda = "";

                $("#stdaDiv").find(":checked").each(function () {
                    stda = stda + $(this).val().trim();
                });

                $(".stxx .layui-textarea").each(function () {
                    stxx = stxx +"-"+$(this).val().trim();
                });

                $.post("${pageContext.request.contextPath }/kszx/tkgl/addQuestion",{
                    stfl:formData.stfl,
                    stfs:formData.stfs,
                    stid:formData.stid,
                    stjx:formData.stjx,
                    stmc:formData.stmc,
                    stnd:formData.stnd,
                    stda:stda,
                    stlx:formData.stlx,
                    stxx:stxx.substr(1)
                },function (data) {
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                });

            }

            return false;
        });

        form.on('radio(stlx)', function(data){
            $("#stdaDiv").find(".layui-input-block").empty();
            $(".stxx").remove();
            if(data.value === "判断题"){
                $(".addxx").hide();
                var input1 = $("<input>").attr({'name':'stda','type':'radio','lay-filter':'stda','value':'对','title':'对'});
                var input2 = $("<input>").attr({'name':'stda','type':'radio','lay-filter':'stda','value':'错','title':'错'});
                $("#stdaDiv").find(".layui-input-block").append(input1);
                $("#stdaDiv").find(".layui-input-block").append(input2);

            }else if(data.value === "单选题"){
                $(".addxx").show();
                var input1 = $("<input>").attr({'name':'stda','type':'radio','lay-filter':'stda','value':'A','title':'A'});
                var input2 = $("<input>").attr({'name':'stda','type':'radio','lay-filter':'stda','value':'B','title':'B'});
                var input3 = $("<input>").attr({'name':'stda','type':'radio','lay-filter':'stda','value':'C','title':'C'});
                var input4 = $("<input>").attr({'name':'stda','type':'radio','lay-filter':'stda','value':'D','title':'D'});
                $("#stdaDiv").find(".layui-input-block").append(input1);
                $("#stdaDiv").find(".layui-input-block").append(input2);
                $("#stdaDiv").find(".layui-input-block").append(input3);
                $("#stdaDiv").find(".layui-input-block").append(input4);
                var itemA = getXxNode(0);
                var itemB = getXxNode(1);
                var itemC = getXxNode(2);
                var itemD = getXxNode(3);
                $("#stdaDiv").after(itemD);
                $("#stdaDiv").after(itemC);
                $("#stdaDiv").after(itemB);
                $("#stdaDiv").after(itemA);

            }else if(data.value === "多选题"){
                $(".addxx").show();
                var input1 = $("<input>").attr({'name':'stda[A]','type':'checkbox','lay-filter':'stda','value':'A','title':'A'});
                var input2 = $("<input>").attr({'name':'stda[B]','type':'checkbox','lay-filter':'stda','value':'B','title':'B'});
                var input3 = $("<input>").attr({'name':'stda[C]','type':'checkbox','lay-filter':'stda','value':'C','title':'C'});
                var input4 = $("<input>").attr({'name':'stda[D]','type':'checkbox','lay-filter':'stda','value':'D','title':'D'});
                $("#stdaDiv").find(".layui-input-block").append(input1);
                $("#stdaDiv").find(".layui-input-block").append(input2);
                $("#stdaDiv").find(".layui-input-block").append(input3);
                $("#stdaDiv").find(".layui-input-block").append(input4);
                var itemA = getXxNode(0);
                var itemB = getXxNode(1);
                var itemC = getXxNode(2);
                var itemD = getXxNode(3);
                $("#stdaDiv").after(itemD);
                $("#stdaDiv").after(itemC);
                $("#stdaDiv").after(itemB);
                $("#stdaDiv").after(itemA);

            }
            form.render();

        });


        //选项上移
        $("#addXxForm").on("click", ".moveup", function () {
            //当前节点 layui-form-item
            var node = $(this).parent().parent().parent();
            //上一节点
            var prevNode = node.prev(".stxx");
            if (prevNode.length === 0) {
                return false;
            }
            var temp = prevNode.find('textarea').val();
            prevNode.find('textarea').val(node.find('textarea').val());
            node.find('textarea').val(temp);
            return false;
        });

        //选项下移
        $("#addXxForm").on("click", ".movedown", function () {
            //当前节点 layui-form-item
            var node = $(this).parent().parent().parent();
            //下一节点
            var nextNode = node.next(".stxx");
            if (nextNode.length === 0) {
                return false;
            }
            var temp = nextNode.find('textarea').val();
            nextNode.find('textarea').val(node.find('textarea').val());
            node.find('textarea').val(temp);
            return false;
        });

        //选项移除
        $("#addXxForm").on("click", ".removexx", function () {

            var node = $(this).parent().parent().parent();
            var nextNodes = node.nextAll(".stxx");

            if (node.siblings(".stxx").length === 0) {
                layer.msg("至少需要保留一个选项");
                return;
            }

            if (nextNodes.length === 0) {
                node.remove();
            } else {
                for (var i = nextNodes.length - 1; i >= 0; i--) {
                    if (i === 0) {
                        nextNodes.eq(i).find(".layui-form-label").text(node.find(".layui-form-label").text());
                        nextNodes.eq(i).find(".layui-textarea").attr("name", node.find(".layui-textarea").attr("name"));
                    } else {
                        nextNodes.eq(i).find(".layui-form-label").text(nextNodes.eq(i - 1).find(".layui-form-label").text());
                        nextNodes.eq(i).find(".layui-textarea").attr("name", nextNodes.eq(i - 1).find(".layui-textarea").attr("name"));
                    }
                }
                node.remove();
            }

            $("#stdaDiv").children(".layui-input-block").find("input:last").remove();
            $("#stdaDiv").children(".layui-input-block").find(".layui-unselect:last").remove();

            return false;
        });

        //选项添加
        $(".addxx").click(function () {
            var AtoZ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            //当前节点 layui-form-item
            var node = $(this).parent();

            //将当前元素的选项填入,选项经过计算得出
            var t = node.prev().find(".layui-textarea").attr("name").split("-");
            var num = AtoZ.indexOf(t[1]) + 1;
            var layuiItem = getXxNode(num);
            if (node.siblings(".stxx").length === 0) {
                node.siblings("#stdaDiv").after(layuiItem);
            } else {
                node.siblings(".stxx:last").after(layuiItem);
            }

            if ($("#stlxDiv").find("input:radio:checked").val() === "单选题") {
                console.log("------------------");
                var xx = $("#stdaDiv").find("input:last").val();
                var input = $("<input>").attr({
                    'name': 'stda',
                    'type': 'radio',
                    'lay-filter': 'stda',
                    'value': AtoZ.charAt(AtoZ.indexOf(xx) + 1),
                    'title': AtoZ.charAt(AtoZ.indexOf(xx) + 1)
                });
                $("#stdaDiv").find("input:last").after(input);
            } else if ($("#stlxDiv").find("input:radio:checked").val() === "多选题") {
                var xx = $("#stdaDiv").find("input:last").val();
                var input = $("<input>").attr({
                    'name': 'stda',
                    'type': 'checkbox',
                    'lay-filter': 'stda',
                    'value': AtoZ.charAt(AtoZ.indexOf(xx) + 1),
                    'title': AtoZ.charAt(AtoZ.indexOf(xx) + 1)
                });
                $("#stdaDiv").find("input:last").after(input);
            }
            form.render();
            return false;
        });

    });
</script>
</html>
