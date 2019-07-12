<%@ taglib prefix="s" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: lishidongol
  Date: 2018/9/28
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>题库管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <style>
        body .layui-tree-skin-shihuang .layui-tree-branch {
            color: #EDCA50;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space3">
        <%--题库分类--%>
        <div class="layui-col-md2 layui-col-sm3">
            <div class="layui-row" style="margin-top: 10px">
                <button class="layui-btn layui-btn-fluid" id="managerCategroies">管理目录</button>
            </div>
            <div class="layui-row">
                <ul id="stfllb"></ul>
            </div>
        </div>

        <%--题目列表--%>
        <div class="layui-col-md10 layui-sm9">
            <div class="layui-row" style="margin-top: 10px">
                <form class="layui-form" id="searchForm">
                    <div class="layui-form-item">

                        <div class="layui-input-inline">
                            <input class="layui-input" type="text" value="" placeholder="请选择分类" readonly name="tmfl">
                        </div>

                        <div class="layui-input-inline">
                            <select name="stlx" lay-verify="">
                                <option value="">选择题型</option>
                                <option value="判断题">判断题</option>
                                <option value="单选题">单选题</option>
                                <option value="多选题">多选题</option>
                            </select>
                        </div>

                        <div class="layui-input-inline">
                            <select name="stnd" lay-verify="">
                                <option value="">选择难度</option>
                                <option value="1">简单</option>
                                <option value="2">较难</option>
                                <option value="3">很难</option>
                            </select>
                        </div>

                        <div class="layui-input-inline">
                            <input type="text" name="stmc" placeholder="试题名称" autocomplete="off"
                                   class="layui-input">
                        </div>

                        <div class="layui-input-inline" style="width: 80px">
                            <input style="width: 80px" class="layui-btn" lay-submit lay-filter="search" type="submit"
                                   value="搜索">
                        </div>

                        <div class="layui-input-inline" style="width: 80px">
                            <input style="width: 80px" class="layui-btn" lay-submit lay-filter="reset"  value="重置">
                        </div>

                    </div>
                </form>
            </div>
            <div class="layui-row">
                <table id="stlb" lay-filter="stlb"></table>
            </div>
        </div>
    </div>
</div>

</body>
<%--头部工具栏--%>
<script type="text/html" id="toolbarstlb" lay-filter="toolbarstlb">
    <div class="layui-btn-container">
        <s:hasPermission name="exam-questions-add">
            <button class="layui-btn layui-btn-sm" lay-event="addQuestion">新增试题</button>
        </s:hasPermission>
        <s:hasPermission name="exam-questions-delete">
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="batchDeleteQuestion">批量删除</button>
        </s:hasPermission>
        <s:hasPermission name="exam-questions-importTemplate">
            <button class="layui-btn layui-btn-sm" lay-event="importQuestionTemplate">Excel导入模板下载</button>
        </s:hasPermission>
        <s:hasPermission name="exam-questions-import">
            <button class="layui-btn layui-btn-sm" lay-event="importQuestion" type="button" id="uploadExcel">Excel导入</button>
        </s:hasPermission>

    </div>
</script>

<%--行内工具栏--%>
<script type="text/html" id="rowbar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">详细</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <s:hasPermission name="exam-questions-delete">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </s:hasPermission>

</script>

<script type="text/html" id="stndTemplate">
{{ d.stnd==1 ? "简单":'' }}
{{ d.stnd==2 ? "较难":'' }}
{{ d.stnd==3 ? "很难":'' }}
</script>

<script>
    layui.use(['layer', 'form', 'tree', 'table', 'jquery', 'upload'], function () {
        var layer = layui.layer
            , $ = layui.$
            , table = layui.table
            , upload = layui.upload
            , form = layui.form;

        //表单初始化
        form.render();

        var searchStfl = 99999; //默认加载分类
        //搜索表单提交事件监听
        form.on('submit(search)', function (data) {
            //console.log(data.field);
            var field = data.field;
            var postData = {};
            postData.stfl = searchStfl;
            if(field.stlx != ""){
                postData.stlx = field.stlx;
            }
            if (field.stmc != "") {
                postData.stmc = field.stmc;
            }
            if (field.stnd != "") {
                postData.stnd = field.stnd;
            }
            table.reload("stlb", {
                url: "${pageContext.request.contextPath }/kszx/tkgl/loadQuestionList",
                where: postData,
                page: {
                    curr: 1
                }
            });

            return false;
        });

        form.on("submit(reset)",function (data) {
            location.reload();
            return false;
        });

        /*加载目录*/
        $.get("${pageContext.request.contextPath }/kszx/tkgl/loadCategories?format=1"
            , function (data) {
                var node = JSON.parse(data);
                layui.tree({
                    elem: '#stfllb' //传入元素选择器
                    , skin: "shihuang"
                    , nodes: node
                    , click: function (nodes) {
                        searchStfl = nodes.id;
                        $("#searchForm").find("input[name='tmfl']").val(nodes.name);
                        table.reload("stlb", {
                            where: {
                                stfl: searchStfl
                            },
                            page: {
                                curr: 1
                            }
                        });
                    }
                });
            });

        //监听管理目录点击事件
        $(document).on("click", "#managerCategroies", function () {
            layer.open({
                type: 2,
                title: "分类管理",
                shadeClose: true,
                shade: 0.8,
                area: ['70%', "80%"],
                content: '${pageContext.request.contextPath }/kszx/tkgl/flgl'
            })
        });

        //数据表格初始化
        var tableIns = table.render({
            elem: "#stlb"
            , url: '${pageContext.request.contextPath }/kszx/tkgl/loadQuestionList' //数据接口
            , method: 'post'
            , title: "试题列表"
            , page: true //开启分页
            , toolbar: '#toolbarstlb'
            , loading: true
            , cols: [[ //表头
                {type: 'checkbox'}
                , {field: 'id', title: 'ID', width: 100, sort: true, align: 'center'}
                , {field: 'stmc', title: '试题名称'}
                , {field: 'stzz', title: '录入人', width: 120, align: 'center'}
                , {field: 'stfl', title: '分类', width: 120, align: 'center'}
                , {field: 'stlx', title: '类型', width: 80, align: 'center'}
                , {field: 'stnd', title: '难度', width: 80, align: 'center',templet: '#stndTemplate'}
                , {fixed: 'right', width: 178, align: 'center', toolbar: '#rowbar'}
            ]],
            parseData: function (res) {
                return {
                    'code': 0,
                    'count': res.total,
                    'data': res.rows
                }
            }
        });

        //表格工具栏监听事件
        table.on("toolbar(stlb)", function (obj) {
            switch (obj.event) {
                case 'addQuestion':
                    layer.open({
                        type: 2,
                        title: "新增试题",
                        shadeClose: false,
                        shade: 0.8,
                        area: ["50%", "80%"],
                        content: '${pageContext.request.contextPath }/kszx/tkgl/loadAddQuestionView',
                        end: function () {
                            tableIns.reload();
                        }
                    });
                    break;
                case 'batchDeleteQuestion':
                    var checkStatus = table.checkStatus('stlb');
                    var postData = "";
                    for (var i = 0; i < checkStatus.data.length; i++) {
                        postData = postData + "," + checkStatus.data[i].id;
                    }
                    console.log(postData.substring(1));
                    $.post("${pageContext.request.contextPath }/kszx/tkgl/deleteQuestion", {id: postData.substring(1)}, function (data) {
                        tableIns.reload();
                        layer.msg("删除成功");
                    });
                    break;
                case 'importQuestionTemplate':
                    window.open('${pageContext.request.contextPath }/kszx/tkgl/getImportQuestionsTemplate?filename=ImportQuestionsTemplate.xlsx');
                    break;
            }
        });

        upload.render({
            elem: '#uploadExcel' //绑定元素
            , url: '${pageContext.request.contextPath }/kszx/tkgl/uploadQuestionExcel' //上传接口
            , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                layer.load(2);
            }
            , done: function (res, index, upload) {
                //上传完毕回调
                layer.closeAll('loading'); //关闭loading
                //layer.alert("upload success");
            }
            , error: function (index, upload) {
                //请求异常回调
                layer.closeAll('loading'); //关闭loading
                //layer.alert("upload faild");
            }
            , accept: 'file'
            , exts: 'xlsx'
            , auto: true //自动上传
            , field: 'file'
        });

        //监听行工具事件
        table.on("tool(stlb)", function (obj) {
            var row = obj.data;
            switch (obj.event) {
                case 'detail':
                    layer.open({
                        type: 2,
                        title: "查看试题",
                        shadeClose: true,
                        shade: 0.8,
                        area: ["50%", "80%"],
                        content: '${pageContext.request.contextPath }/kszx/tkgl/loadQuestionDetail/' + row.id
                    });
                    break;
                case 'edit':
                    layer.open({
                        type: 2,
                        title: "编辑试题",
                        shadeClose: false,
                        shade: 0.8,
                        area: ["50%", "80%"],
                        content: '${pageContext.request.contextPath }/kszx/tkgl/editQuestion/' + row.id,
                        end: function () {
                            console.log(sessionStorage.getItem("closeFlag") === 1);
                            if(sessionStorage.getItem("closeFlag") == 1){
                                tableIns.reload();
                            }
                        }
                    });
                    break;
                case 'del':
                    $.post("${pageContext.request.contextPath }/kszx/tkgl/deleteQuestion", {id: row.id}, function (data) {
                        obj.del();
                        layer.msg("删除成功");
                    });
                    break;
            }
        })

    });
</script>
</html>
