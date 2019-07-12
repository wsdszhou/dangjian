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

            <div class="layui-form-item">
                <label class="layui-form-label">ID：</label>
                <div class="layui-input-inline">
                    <input type="text" name="stid" value="${requestScope.questionDetail.id}" disabled
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">题目：</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="stmc">${requestScope.questionDetail.stmc}</textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">分类：</label>
                <div class="layui-input-inline">
                    <select name="stfl">
                        <c:forEach items="${requestScope.stfl}" var="list">
                            <c:choose>
                                <c:when test="${requestScope.questionDetail.stfl == list.name}">
                                    <option value="${list.id}" selected="">${list.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${list.id}">${list.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <%--<div class="layui-form-item">
                <label class="layui-form-label">分数：</label>
                <div class="layui-input-inline">
                    <input type="text" name="stfs" value="${requestScope.questionDetail.stfs}" required
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>--%>

            <div class="layui-form-item">
                <label class="layui-form-label">难度：</label>
                <div class="layui-input-block">
                    <c:choose>
                        <c:when test="${requestScope.questionDetail.stnd == 1}">
                            <input type="radio" lay-filter="stnd" name="stnd" value="1" title="简单" checked="">
                        </c:when>
                        <c:otherwise>
                            <input type="radio" lay-filter="stnd" name="stnd" value="1" title="简单">
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${requestScope.questionDetail.stnd == 2}">
                            <input type="radio" lay-filter="stnd" name="stnd" value="2" title="较难" checked="">
                        </c:when>
                        <c:otherwise>
                            <input type="radio" lay-filter="stnd" name="stnd" value="2" title="较难">
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${requestScope.questionDetail.stnd == 3}">
                            <input type="radio" lay-filter="stnd" name="stnd" value="3" title="很难" checked="">
                        </c:when>
                        <c:otherwise>
                            <input type="radio" lay-filter="stnd" name="stnd" value="3" title="很难">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">解析：</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" placeholder="无解析"
                              name="stjx">${requestScope.questionDetail.stjx}</textarea>
                </div>
            </div>

            <div class="layui-form-item" pane="">
                <label class="layui-form-label">类型：</label>
                <div class="layui-input-block">
                    <c:choose>
                        <c:when test="${requestScope.questionDetail.stlx == '判断题'}">
                            <input type="radio" lay-filter="stlx" name="stlx" value="判断题" title="判断题" checked="">
                        </c:when>
                        <c:otherwise>
                            <input type="radio" lay-filter="stlx" name="stlx" value="判断题" title="判断题" disabled>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${requestScope.questionDetail.stlx == '单选题'}">
                            <input type="radio" lay-filter="stlx" name="stlx" value="单选题" title="单选题" checked="">
                        </c:when>
                        <c:otherwise>
                            <input type="radio" lay-filter="stlx" name="stlx" value="单选题" title="单选题" disabled>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${requestScope.questionDetail.stlx == '多选题'}">
                            <input type="radio" lay-filter="stlx" name="stlx" value="多选题" title="多选题" checked="">
                        </c:when>
                        <c:otherwise>
                            <input type="radio" lay-filter="stlx" name="stlx" value="多选题" title="多选题" disabled>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

            <c:set var="AtoZ" value="ABCDEFGHIJKLMN"/>
            <div class="layui-form-item" id="stdaDiv" pane="">
                <label class="layui-form-label">答案：</label>
                <div class="layui-input-block">
                    <c:if test="${requestScope.questionDetail.stlx == '判断题'}">
                        <c:choose>
                            <c:when test="${requestScope.questionDetail.stda == '对'}">
                                <input type="radio" lay-filter="stda" name="stda" value="对" title="对" checked="">
                            </c:when>
                            <c:otherwise>
                                <input type="radio" lay-filter="stda" name="stda" value="对" title="对">
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${requestScope.questionDetail.stda == '错'}">
                                <input type="radio" lay-filter="stda" name="stda" value="错" title="错" checked="">
                            </c:when>
                            <c:otherwise>
                                <input type="radio" lay-filter="stda" name="stda" value="错" title="错">
                            </c:otherwise>
                        </c:choose>
                    </c:if>

                    <c:if test="${requestScope.questionDetail.stlx == '单选题'}">
                        <c:forEach items="${requestScope.questionDetail.kszxStxxList}" var="list">
                            <c:choose>
                                <c:when test="${AtoZ.charAt(list.xx-1).toString() eq requestScope.questionDetail.stda}">
                                    <input type="radio" lay-filter="stda" name="stda" value="${AtoZ.charAt(list.xx-1)}"
                                           title="${AtoZ.charAt(list.xx-1)}" checked="">
                                </c:when>
                                <c:otherwise>
                                    <input type="radio" lay-filter="stda" name="stda" value="${AtoZ.charAt(list.xx-1)}"
                                           title="${AtoZ.charAt(list.xx-1)}">
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>

                    <c:if test="${requestScope.questionDetail.stlx == '多选题'}">
                        <c:forEach items="${requestScope.questionDetail.kszxStxxList}" var="list">
                            <c:choose>
                                <c:when test="${fn:contains(requestScope.questionDetail.stda,AtoZ.charAt(list.xx-1).toString())}">
                                    <input type="checkbox" lay-filter="stda" name="stda[${AtoZ.charAt(list.xx-1)}]"
                                           value="${AtoZ.charAt(list.xx-1)}" title="${AtoZ.charAt(list.xx-1)}"
                                           checked="">
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" lay-filter="stda" name="stda[${AtoZ.charAt(list.xx-1)}]"
                                           value="${AtoZ.charAt(list.xx-1)}" title="${AtoZ.charAt(list.xx-1)}">
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>

                </div>
            </div>


            <c:forEach items="${requestScope.questionDetail.kszxStxxList}" var="list" varStatus="vs">
                <div class="layui-form-item layui-form-text stxx">
                    <label class="layui-form-label">选项${AtoZ.charAt(list.xx-1)}：</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="xx-${AtoZ.charAt(list.xx-1)}">${list.xxz}</textarea>
                            <%--按钮组--%>
                        <div class="layui-btn-group">
                            <div class="layui-btn layui-btn-sm moveup">
                                <i class="layui-icon">&#xe619;</i>
                            </div>
                            <div class="layui-btn layui-btn-sm movedown">
                                <i class="layui-icon">&#xe61a;</i>
                            </div>
                            <div class="layui-btn layui-btn-sm removexx">
                                <i class="layui-icon">&#xe640;</i>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <div class="layui-form-item">
                <c:if test="${requestScope.questionDetail.stlx != '判断题'}">
                    <div class="layui-btn addxx">添加选项</div>
                </c:if>
                <div class="layui-btn layui-btn-danger" lay-submit lay-filter="saveBtn">保存</div>
            </div>

        </form>
    </div>
</div>
</body>
<script>

    var stData = {
        id: '${requestScope.questionDetail.id}',
        stmc: '${requestScope.questionDetail.stmc}',
        stzz: '${requestScope.questionDetail.stzz}',
        stfl: '${requestScope.questionDetail.stfl}',
        stlx: '${requestScope.questionDetail.stlx}',
        stfs: '${requestScope.questionDetail.stfs}',
        stjx: '${requestScope.questionDetail.stjx}',
        stnd: '${requestScope.questionDetail.stnd}',
        stda: '${requestScope.questionDetail.stda}'
    };

    sessionStorage.setItem("closeFlag",0);
    layui.use(['layer', 'form', 'jquery'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        //初始化表单
        form.render();

        form.on('submit(saveBtn)', function (data) {
            sessionStorage.setItem("closeFlag",1);
            //获取表单数据
            var formData = data.field;
            //单独获取答案
            var stda = "";
            var stxx = "";
            if (stData.stlx === "多选题") {
                $("#stdaDiv").find(":checked").each(function () {
                    stda = stda + $(this).val();
                });
            } else {
                stda = $("#stdaDiv").find("input:checked").val();
            }

            $(".stxx .layui-textarea").each(function () {
               stxx = stxx +"-"+$(this).val();
            });

            if(stData.stlx === "判断题"){
                $.post("${pageContext.request.contextPath }/kszx/tkgl/editQuestionData",{
                    stfl:formData.stfl,
                    stfs:formData.stfs,
                    stid:formData.stid,
                    stjx:formData.stjx,
                    stmc:formData.stmc,
                    stnd:formData.stnd,
                    stda:stda
                },function (data) {
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                });
            }else {
                $.post("${pageContext.request.contextPath }/kszx/tkgl/editQuestionData",{
                    stfl:formData.stfl,
                    stfs:formData.stfs,
                    stid:formData.stid,
                    stjx:formData.stjx,
                    stmc:formData.stmc,
                    stnd:formData.stnd,
                    stda:stda,
                    stxx:stxx.substr(1)
                },function (data) {

                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                });
            }
            return false;
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
            /*
            * 1.获取当前item下的同级元素
            * */
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
            var layuiItem = $("<div></div>").addClass("layui-form-item layui-form-text stxx");
            //将当前元素的选项填入,选项经过计算得出
            var t = node.prev().find(".layui-textarea").attr("name").split("-");
            var t1 = AtoZ.charAt(AtoZ.indexOf(t[1]) + 1);
            var layuiLabel = $("<div></div>").addClass("layui-form-label").text("选项" + t1 + ":");
            layuiItem.append(layuiLabel);
            var layuiBlock = $("<div></div>").addClass("layui-input-block");
            var textarea = $("<textarea></textarea>").addClass("layui-textarea").attr("name", "xx-" + t1);
            var groupbtnup = '<div class="layui-btn-group">\n' +
                '                            <div class="layui-btn layui-btn-sm moveup">\n' +
                '                                <i class="layui-icon">&#xe619;</i>\n' +
                '                            </div>\n' +
                '                            <div class="layui-btn layui-btn-sm movedown">\n' +
                '                                <i class="layui-icon">&#xe61a;</i>\n' +
                '                            </div>\n' +
                '                            <div class="layui-btn layui-btn-sm removexx">\n' +
                '                                <i class="layui-icon">&#xe640;</i>\n' +
                '                            </div>\n' +
                '                        </div>';
            layuiBlock.append(textarea);
            layuiBlock.append(groupbtnup);
            layuiItem.append(layuiBlock);
            if (node.siblings(".stxx").length === 0) {
                node.siblings("#stdaDiv").after(layuiItem);
            } else {
                node.siblings(".stxx:last").after(layuiItem);
            }

            if (stData.stlx === "单选题") {
                var xx = $("#stdaDiv").find("input:last").val();
                var input = $("<input>").attr({
                    'name': 'stda',
                    'type': 'radio',
                    'lay-filter': 'stda',
                    'value': AtoZ.charAt(AtoZ.indexOf(xx) + 1),
                    'title': AtoZ.charAt(AtoZ.indexOf(xx) + 1)
                });
                $("#stdaDiv").find("input:last").after(input);
            } else if (stData.stlx === "多选题") {
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
