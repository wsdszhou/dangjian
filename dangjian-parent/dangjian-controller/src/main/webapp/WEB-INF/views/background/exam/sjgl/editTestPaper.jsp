<%--
  Created by IntelliJ IDEA.
  User: king
  Date: 2018/11/16
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>配置试卷</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
</head>
<body>
<form class="layui-form" id="addTestPaperForm" lay-filter="addTestPaperForm">
    <div class="layui-form-item">
        <label class="layui-form-label">试卷ID：</label>
        <div class="layui-input-inline">
            <input class="layui-input" name="id" id="id" type="text" readonly lay-verify="required"
                   value="${requestScope.kszxSj.id}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">试卷标题：</label>
        <div class="layui-input-block">
            <input class="layui-input" name="sjbt" id="sjbt" type="text" lay-verify="required"
                   value="${requestScope.kszxSj.sjbt}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">试卷分类：</label>
        <div class="layui-input-inline">
            <select name="sjlb" id="sjlb">
                <c:forEach items="${requestScope.sjfls}" var="list">
                    <c:choose>
                        <c:when test="${list.id == requestScope.kszxSj.sjlb}">
                            <option value="${list.id}" selected>${list.name}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${list.id}">${list.name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">自动交卷：</label>
        <div class="layui-input-block">
            <c:choose>
                <c:when test="${requestScope.kszxSj.zdjj == 1}">
                    <input type="checkbox" name="zdjj" id="zdjj" value="1" checked lay-skin="switch"
                           lay-text="开启|关闭">
                </c:when>
                <c:otherwise>
                    <input type="checkbox" name="zdjj" id="zdjj" value="1" lay-skin="switch" lay-text="开启|关闭">
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">及格百分比：</label>
        <div class="layui-input-inline">
            <input type="text" id="jgfs" name="jgfs" class="layui-input" lay-verify="required"
                   value="${requestScope.kszxSj.jgfs}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">判断题：</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" lay-verify="required" placeholder="每题分数" name="pdtfs" value="${requestScope.kszxSj.pdtfs}">
        </div>

        <label class="layui-form-label">单选题：</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" lay-verify="required" placeholder="每题分数" name="dxtfs" value="${requestScope.kszxSj.dxtfs}">
        </div>

        <label class="layui-form-label">多选题：</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" lay-verify="required" placeholder="每题分数" name="dxtsfs" value="${requestScope.kszxSj.dxtsfs}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">答卷时长：</label>
        <div class="layui-input-inline">
            <input type="text" id="djsj" name="djsj" class="layui-input" lay-verify="required" value="100"  value="${requestScope.kszxSj.djsj}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">开始时间：</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" id="kssj" name="kssj" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${requestScope.kszxSj.kssj}"/>">
        </div>

        <label class="layui-form-label">结束时间：</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" id="jssj" name="jssj" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${requestScope.kszxSj.jssj}" />">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">考试说明：</label>
        <div class="layui-input-block">
            <textarea id="kssm" name="kssm" style="display: none;">${requestScope.kszxSj.kssm}</textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit id="saveTestPaperBtn" lay-filter="saveTestPaperBtn">
                保存
            </button>
        </div>
    </div>

</form>

</body>
<script>
    layui.use(['layer', 'form', 'jquery', 'laydate', 'layedit'], function () {
        var layer = layui.layer,
            form = layui.form,
            $ = layui.jquery,
            layedit = layui.layedit,
            laydate = layui.laydate;

        form.render();

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

        form.on("submit(saveTestPaperBtn)", function (data) {
            var postdata = {};
            postdata.id = data.field.id;
            postdata.sjbt = data.field.sjbt;
            postdata.sjlb = data.field.sjlb;
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
            $.post("${pageContext.request.contextPath }/kszx/sjgl/editTestPaperBaseInfo",{data:JSON.stringify(postdata)},function (data) {
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭
            });

            return false;
        });

    })
</script>

</html>
