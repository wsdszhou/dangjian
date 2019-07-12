<%--
  Created by IntelliJ IDEA.
  User: king
  Date: 2018/11/9
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>固定试题选择</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <style>
        .choosed{
            background-color: #ffecb8;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row" style="margin: 20px auto 0 auto">
        <div class="layui-col-sm12">
            <form class="layui-form" id="searchForm">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <select name="stfl" id="stfl" lay-verify=""></select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="stlx" lay-verify="">
                            <option value="">题型</option>
                            <option value="判断题">判断题</option>
                            <option value="单选题">单选题</option>
                            <option value="多选题">多选题</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="stnd" lay-verify="">
                            <option value="">试题难度</option>
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
                        <input style="width: 80px" class="layui-btn" lay-submit lay-filter="refresh" type="submit"
                               value="刷新">
                    </div>
                </div>
            </form>
        </div>

        <div class="layui-col-sm12 stlb">
            <table id="stlb" lay-filter="stlb"></table>
        </div>
    </div>

    <div class="layui-row">
        <div class="layui-col-sm12">
            <table id="selectedQuestion" lay-filter="selectedQuestion"></table>
        </div>
    </div>

</div>

</body>
<script type="text/html" id="stndTemplate">
    {{ d.stnd==1 ? "简单":'' }}
    {{ d.stnd==2 ? "较难":'' }}
    {{ d.stnd==3 ? "很难":'' }}
</script>
<%--头部工具栏--%>
<script type="text/html" id="toolbarselectedQuestion" lay-filter="toolbarselectedQuestion">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="saveQuestion">保存试题</button>
    </div>
</script>
<%--行内工具栏--%>
<script type="text/html" id="stlbrowbar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">详细</a>
</script>

<%--行内工具栏--%>
<script type="text/html" id="selectedQuestionrowbar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
</script>
<script>

    layui.use(['table', 'form', 'layer', 'jquery'], function () {
        var table = layui.table,
            form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        //从服务器加载已选择的试题
        var selectedQuestion = ${requestScope.selectedQuestion};
        //当前试卷id
        var sjid = ${requestScope.sjid};
        //当前试题选择列表试题
        var questionlist = "";

        //处理试题分类
        $.get("${pageContext.request.contextPath }/kszx/tkgl/loadCategories", function (data) {
            var row = JSON.parse(data);
            var stfl = $("#stfl");
            stfl.empty();
            for (var i = 0; i < row.length; i++) {
                var option = $("<option></option>");
                option.val(row[i].id);
                option.text(row[i].name);
                stfl.append(option);
            }
            form.render();
        });

        //筛选试题
        form.on('submit(search)', function (data) {
            var field = data.field;
            var postData = {};
            postData.stlx = field.stlx;
            if (field.stfl !== "") {
                postData.stfl = field.stfl;
            }
            if (field.stmc !== "") {
                postData.stmc = field.stmc;
            }
            if (field.stnd !== "") {
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
        form.on('submit(refresh)',function (data) {
            location.reload();
        });

        table.render({
            elem: "#selectedQuestion"
            , data:selectedQuestion
            , title: "已选试题列表"
            , toolbar: "#toolbarselectedQuestion"
            //, height: 400
            , page: true
            , cols: [[ //表头
                {type: 'numbers'}
                , {field: 'st', title: 'ID', width: 100, sort: true, align: 'center',hide:true}
                , {field: 'question', title: '试题名称'}
                , {field: 'stfl', title: '分类', width: 120, align: 'center'}
                , {field: 'stlx', title: '类型', width: 80, align: 'center'}
                , {field: 'stnd', title: '难度', width: 80, align: 'center',templet: '#stndTemplate'}
                ,{title: '操作',fixed: 'right', width: 100, align: 'center', toolbar: '#selectedQuestionrowbar'}
            ]]
        });

        //监听保存按钮点击事件
        table.on("toolbar(selectedQuestion)",function (obj) {
            switch (obj.event) {
                case 'saveQuestion':
                    $.post("${pageContext.request.contextPath }/kszx/sjgl/updateFixQuestionCount/"+sjid,function (data) {
                        layer.confirm("试卷信息已更新！",{btn:["返回试卷列表","继续选择试题"]},function() {
                            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            parent.layer.close(index); //再执行关闭
                        },function () {

                        })
                    });
                    break;
            }
        });
        //监听行工具事件
        table.on("tool(selectedQuestion)",function (obj) {
            var data = obj.data;
            switch (obj.event) {
                case 'del':
                    for(var j=0;j<questionlist.length;j++){
                        if(questionlist[j].id == data.st){
                            var row = '.stlb .layui-table-body tr[data-index="'+j+'"]';
                            $(row).removeClass("choosed");
                            break;
                        }
                    }
                    console.log("del");
                    for(var i=0;i<selectedQuestion.length;i++){
                        if(data.st == selectedQuestion[i].st){
                            selectedQuestion.splice(i,1);
                            $.post("${pageContext.request.contextPath }/kszx/sjgl/modifyFixQuestion/del",{data:JSON.stringify({"sj":sjid,"st":data.st})},function (data) {
                                layer.msg("已删除");
                            });
                            break;
                        }
                    }
                    table.reload("selectedQuestion",{
                        data:selectedQuestion
                    });

                    break;

            }
        });

        //初始化试题表格
        table.render({
            elem: "#stlb"
            , url: '${pageContext.request.contextPath }/kszx/tkgl/loadQuestionList' //数据接口
            , method: 'post'
            , title: "试题列表"
            , height: 300
            , page: true //开启分页
            , cols: [[ //表头
                {type: 'numbers'}
                , {field: 'id', title: 'ID', width: 100, sort: true, align: 'center',hide:true}
                , {field: 'stmc', title: '试题名称(双击选择试题)'}
                , {field: 'stfl', title: '分类', width: 120, align: 'center'}
                , {field: 'stlx', title: '类型', width: 80, align: 'center'}
                , {field: 'stnd', title: '难度', width: 80, align: 'center',templet: '#stndTemplate'}
                ,{title: '操作',fixed: 'right', width: 100, align: 'center', toolbar: '#stlbrowbar'}
            ]],
            parseData: function (res) {
                return {
                    'code': 0,
                    'count': res.total,
                    'data': res.rows
                }
            },
            done:function (res) {
                questionlist = res.data;
                for(var i=0;i<res.data.length;i++){
                    for(var j=0;j<selectedQuestion.length;j++){
                        if(selectedQuestion[j].st == res.data[i].id ){
                            changerow(i);
                            break;
                        }
                    }
                }
            }
        });

        //将选中的行改变颜色
        function changerow(i){
            var row = '.stlb .layui-table-body tr[data-index="'+i+'"]';
            $(row).addClass("choosed");
        }

        //监听行双击事件
        table.on('rowDouble(stlb)', function (obj) {
            //如果是单选，则判断该题是否已在被选中的题目中
            var data = obj.data;
            var row = obj.tr.selector;
            //检查当前问题是否被选择
            if($(row).hasClass("choosed")){
                $(row).removeClass("choosed");
                for(var i=0;i<selectedQuestion.length;i++){
                    if(data.id == selectedQuestion[i].st){
                        selectedQuestion.splice(i,1);
                        $.post("${pageContext.request.contextPath }/kszx/sjgl/modifyFixQuestion/del",{data:JSON.stringify({"sj":sjid,"st":data.id})},function (data) {
                            layer.msg("已删除");
                        });
                        break;
                    }
                }
            }else {
                $(row).addClass("choosed");
                var tmpobj = {};
                tmpobj.question = data.stmc;
                tmpobj.stfl = data.stfl;
                tmpobj.stlx = data.stlx;
                tmpobj.stnd = data.stnd;
                tmpobj.st = data.id;
                tmpobj.sj = sjid;
                selectedQuestion.push(tmpobj);
                $.post("${pageContext.request.contextPath }/kszx/sjgl/modifyFixQuestion/add",{data:JSON.stringify(tmpobj)},function (data) {
                    layer.msg("已添加");
                });

            }
            table.reload("selectedQuestion",{
                data:selectedQuestion
            })
        });

        table.on('tool(stlb)',function (obj) {
            switch (obj.event) {
                case "detail":
                    layer.open({
                        type: 2,
                        title: "查看试题",
                        shadeClose: true,
                        shade: 0.8,
                        area: ["50%", "80%"],
                        content: '${pageContext.request.contextPath }/kszx/tkgl/loadQuestionDetail/' + obj.data.id
                    });
                    break;
            }
        })

    });

</script>
</html>
