<%--
  Created by IntelliJ IDEA.
  User: king
  Date: 2018-12-24
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成绩管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
</head>
<body>
    <div class="layui-fluid">
        <div class="layui-row">
            <table id="cjgl"></table>
        </div>
    </div>
</body>
<script>
    layui.use(['layer', 'form', 'table', 'jquery', 'element'], function () {
        var layer = layui.layer
            , $ = layui.$
            , table = layui.table
            , element = layui.element
            , form = layui.form;

        table.render({
            elem: '#cjgl',
            url: '${pageContext.request.contextPath }/kszx/cjgl/loadStudentScore',
            method: 'post',
            title: '成绩列表',
            page: true,
            //toolbar: '#toolbarstlb',
            cellMinWidth: 80,
            cols: [[
                {type: 'numbers'},
                {field: 'id', title: 'ID', align: "center", hide: true},
                {field: 'testPaperName', title: '试卷', align: "center", width: 250},
                {field: 'userName', title: '用户名', align: "center"},
                {field: 'totalScore',title:'试卷总分',align:'center'},
                {field: 'passScore',title:'及格分数',align:'center'},
                {field: 'studentScore',title:'学生成绩',align:'center'},
                {field: 'startTime',title:'做题时间',align:'center'}
                //{field: 'studentScore',title:'学生成绩',align:'center',width:100}
                //{fixed: 'right', width: 250, align: 'center', title: '操作', toolbar: '#rowbar'}
            ]],
            parseData: function (res) {

                return {"code": 0, "data": res.rows, "count": res.total}
            }
        })
    })
</script>
</html>
