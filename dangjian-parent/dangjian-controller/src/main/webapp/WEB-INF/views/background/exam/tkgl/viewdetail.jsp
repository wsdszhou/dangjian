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
<html>
<head>
    <title>查看试题</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row">
        <table class="layui-table">
            <tbody>
            <tr>
                <td>题目：</td>
                <td>${requestScope.questionDetail.stmc}</td>
            </tr>

            <tr>
                <td>录入人：</td>
                <td>${requestScope.questionDetail.stzz}</td>
            </tr>

            <tr>
                <td>分类：</td>
                <td>${requestScope.questionDetail.stfl}</td>
            </tr>

            <tr>
                <td>类型：</td>
                <td>${requestScope.questionDetail.stlx}</td>
            </tr>

            <tr>
                <td>难度：</td>
                <td>
                    <c:if test="${requestScope.questionDetail.stnd == 1}">
                        简单
                    </c:if>

                    <c:if test="${requestScope.questionDetail.stnd == 2}">
                        较难
                    </c:if>

                    <c:if test="${requestScope.questionDetail.stnd == 3}">
                        很难
                    </c:if>
                </td>
            </tr>

            <tr>
                <td>答案：</td>
                <td>${requestScope.questionDetail.stda}</td>
            </tr>

            <tr>
                <td>解析：</td>
                <td>${requestScope.questionDetail.stjx}</td>
            </tr>

            <c:set var="AtoZ" value="ABCDEFGHIJKLMN"/>
            <c:forEach items="${requestScope.questionDetail.kszxStxxList}" var="list" varStatus="vs">
                <tr>
                    <td>选项<c:out value="${AtoZ.charAt(list.xx-1)}"/> </td>
                    <td>${list.xxz}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

</body>
</html>
