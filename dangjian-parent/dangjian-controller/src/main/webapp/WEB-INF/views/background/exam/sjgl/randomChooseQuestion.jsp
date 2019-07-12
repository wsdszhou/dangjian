<%--
  Created by IntelliJ IDEA.
  User: king
  Date: 2018/11/10
  Time: 5:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>随机试题编辑</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-sm12" style="margin-top: 10px">
            <form class="layui-form" id="randomChooseForm" lay-filter="randomChooseForm">
                <div class="layui-input-inline">
                    <select name="stfl" id="stfl" lay-filter="stfl"></select>
                </div>

                <div class="layui-input-inline">
                    <select name="stnd" lay-filter="stnd" id="stnd">
                        <option value="0">任意难度</option>
                        <option value="1">简单</option>
                        <option value="2">较难</option>
                        <option value="3">很难</option>
                    </select>
                </div>

                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="pdtsl" id="pdtsl" placeholder="判断题数量">
                </div>

                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="dxtsl" id="dxtsl" placeholder="单选题数量">
                </div>

                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="dxtssl" id="dxtssl" placeholder="多选题数量">
                </div>

                <div class="layui-input-inline">
                    <button class="layui-btn" lay-submit lay-filter="saveRuleBtn">添加</button>
                </div>

            </form>
        </div>

        <div class="layui-col-sm12">
            <table id="selectedRule" lay-filter="selectedRule"></table>
        </div>
    </div>
</div>

</body>
<%--头部工具栏--%>
<script type="text/html" id="toolbarselectedRule" lay-filter="toolbarselectedRule">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="saveRule">保存规则</button>
    </div>
</script>
<%--行内工具栏--%>
<script type="text/html" id="rowbarselectedRule">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/html" id="stndTemplate">
    {{ d.stnd==0 ? "任意":'' }}
    {{ d.stnd==1 ? "简单":'' }}
    {{ d.stnd==2 ? "较难":'' }}
    {{ d.stnd==3 ? "很难":'' }}
</script>

<script>
    layui.use(['table', 'form', 'layer', 'jquery'], function () {
        var table = layui.table,
            form = layui.form,
            layer = layui.layer,
            $ = layui.$;
        //从服务器加载已选择的试题
        var selectedRule = ${requestScope.selectedRule};
        console.log(selectedRule);
        //加载各类试题数量
        var questionCount = ${requestScope.questionCount};
        console.log(questionCount);
        //当前试卷id
        var sjid = ${requestScope.sjid};
        var questionfilter = {stfl:99999,stnd:0,flag:0};
        var question = {pdtsl:0,dxtsl:0,dxtssl:0};

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

        $("#randomChooseForm").on("focus","#pdtsl,#dxtsl,#dxtssl",function () {
            showQuestionTypeNumTip();
        });
        function showQuestionTypeNumTip() {
            var pdtsl = "数量："+question.pdtsl;
            layer.tips(pdtsl, '#pdtsl', {
                tips: [3, '#0FA6D8'] //还可配置颜色
                ,tipsMore: true
                ,time:30000
            });

            var dxtsl = "数量："+question.dxtsl;
            layer.tips(dxtsl, '#dxtsl', {
                tips: [3, '#0FA6D8'] //还可配置颜色
                ,tipsMore: true
                ,time:30000
            });

            var dxtssl = "数量："+question.dxtssl;
            layer.tips(dxtssl, '#dxtssl', {
                tips: [3, '#0FA6D8'] //还可配置颜色
                ,tipsMore: true
                ,time:30000
            });
        }

        //试题分类选择
        form.on('select(stfl)', function(data){
            questionfilter.stfl = data.value;
            question.pdtsl = 0;
            question.dxtsl = 0;
            question.dxtssl = 0;
            var temp = [];
            for(var j=0;j<selectedRule.length;j++){
                if(selectedRule[j].stfl == questionfilter.stfl && selectedRule[j].stnd==questionfilter.stnd){
                    layer.msg("此规则已存在！");
                    for(var i=0;i<questionCount.length;i++){
                        if(questionCount[i].stfl == questionfilter.stfl && questionCount[i].stnd == questionfilter.stnd){
                            temp.push(questionCount[i]);
                        }
                    }
                    for(var k=0;k<temp.length;k++){
                        switch (temp[k].stlx) {
                            case '判断题':
                                question.pdtsl = question.pdtsl + temp[k].number;
                                break;
                            case '单选题':
                                question.dxtsl = question.dxtsl + temp[k].number;
                                break;
                            case '多选题':
                                question.dxtssl = question.dxtssl + temp[k].number;
                                break;
                        }
                    }
                    questionfilter.flag = 1;
                    showQuestionTypeNumTip();
                    return false;
                }
            }

            if(questionfilter.stnd != 0){
                for(var i=0;i<questionCount.length;i++){
                    if(questionCount[i].stfl == questionfilter.stfl && questionCount[i].stnd == questionfilter.stnd){
                        temp.push(questionCount[i]);
                    }
                }
                for(var k=0;k<temp.length;k++){
                    switch (temp[k].stlx) {
                        case '判断题':
                            question.pdtsl = question.pdtsl + temp[k].number;
                            break;
                        case '单选题':
                            question.dxtsl = question.dxtsl + temp[k].number;
                            break;
                        case '多选题':
                            question.dxtssl = question.dxtssl + temp[k].number;
                            break;
                    }
                }
                questionfilter.flag = 0;
            }else {
                for(var i=0;i<questionCount.length;i++){
                    if(questionCount[i].stfl == questionfilter.stfl){
                        temp.push(questionCount[i]);
                    }
                }
                for(var k=0;k<temp.length;k++){
                    switch (temp[k].stlx) {
                        case '判断题':
                            question.pdtsl = question.pdtsl + temp[k].number;
                            break;
                        case '单选题':
                            question.dxtsl = question.dxtsl + temp[k].number;
                            break;
                        case '多选题':
                            question.dxtssl = question.dxtssl + temp[k].number;
                            break;
                    }
                }
                questionfilter.flag = 0;
            }
            showQuestionTypeNumTip();
        });
        form.on('select(stnd)', function(data){
            questionfilter.stnd = data.value;
            question.pdtsl = 0;
            question.dxtsl = 0;
            question.dxtssl = 0;
            var temp = [];
            for(var j=0;j<selectedRule.length;j++){
                if(selectedRule[j].stfl == questionfilter.stfl && selectedRule[j].stnd==questionfilter.stnd){
                    layer.msg("此规则已存在！");
                    for(var i=0;i<questionCount.length;i++){
                        if(questionCount[i].stfl == questionfilter.stfl && questionCount[i].stnd == questionfilter.stnd){
                            temp.push(questionCount[i]);
                        }
                    }
                    for(var k=0;k<temp.length;k++){
                        switch (temp[k].stlx) {
                            case '判断题':
                                question.pdtsl = question.pdtsl + temp[k].number;
                                break;
                            case '单选题':
                                question.dxtsl = question.dxtsl + temp[k].number;
                                break;
                            case '多选题':
                                question.dxtssl = question.dxtssl + temp[k].number;
                                break;
                        }
                    }
                    questionfilter.flag = 1;
                    showQuestionTypeNumTip();
                    return false;
                }
            }

            if(questionfilter.stnd != 0){
                for(var i=0;i<questionCount.length;i++){
                    if(questionCount[i].stfl == questionfilter.stfl && questionCount[i].stnd == questionfilter.stnd){
                        temp.push(questionCount[i]);
                    }
                }
                for(var k=0;k<temp.length;k++){
                    switch (temp[k].stlx) {
                        case '判断题':
                            question.pdtsl = question.pdtsl + temp[k].number;
                            break;
                        case '单选题':
                            question.dxtsl = question.dxtsl + temp[k].number;
                            break;
                        case '多选题':
                            question.dxtssl = question.dxtssl + temp[k].number;
                            break;
                    }
                }

                questionfilter.flag = 0;
            }else {
                for(var i=0;i<questionCount.length;i++){
                    if(questionCount[i].stfl == questionfilter.stfl){
                        temp.push(questionCount[i]);
                    }
                }
                for(var k=0;k<temp.length;k++){
                    switch (temp[k].stlx) {
                        case '判断题':
                            question.pdtsl = question.pdtsl + temp[k].number;
                            break;
                        case '单选题':
                            question.dxtsl = question.dxtsl + temp[k].number;
                            break;
                        case '多选题':
                            question.dxtssl = question.dxtssl + temp[k].number;
                            break;
                    }
                }
                questionfilter.flag = 0;
            }
            showQuestionTypeNumTip();
        });
        form.on("submit(saveRuleBtn)",function (data) {
            console.log(data);
            if(questionfilter.flag == 1){
                layer.msg("此规则已存在，请到已有规则修改！");
                return false;
            }
            var res = data.field;
            for(var i=0;i<selectedRule.length;i++){
                if(selectedRule[i].stfl == questionfilter.stfl){
                    if(res.stnd == 0){
                        layer.msg("任意难度与其它难度不能同时存在！");
                        return false;
                    }
                    if(selectedRule[i].stnd == 0){
                        layer.msg("任意难度与其它难度不能同时存在！");
                        return false;
                    }
                }
            }

            if((res.pdtsl == 0 || res.pdtsl== "") && (res.dxtsl == 0 || res.dxtsl == "") && (res.dxtssl == 0 || res.dxtssl == "")){
                layer.msg("题目数量不合法！");
                return false;
            }

            var tempobj = {};
            tempobj.stfl = res.stfl;
            tempobj.stnd = res.stnd;
            tempobj.sj = sjid;
            tempobj.stflmc = $("#stfl").find("option[value='"+res.stfl+"']").text();
            console.log(tempobj);

            if(res.pdtsl != "" || res.pdtsl != 0){
                tempobj.pdtsl = res.pdtsl;
            }else {
                tempobj.pdtsl = 0;
            }

            if(res.dxtsl != "" || res.dxtsl != 0){
                tempobj.dxtsl = res.dxtsl;
            }else {
                tempobj.dxtsl = 0;
            }

            if(res.dxtssl != "" || res.dxtssl != 0){
                tempobj.dxtssl = res.dxtssl;
            }else {
                tempobj.dxtssl = 0;
            }

            $.post("${pageContext.request.contextPath }/kszx/sjgl/modifyRandomRule/add",{data:JSON.stringify(tempobj)},function (data) {
                var result = JSON.parse(data);
                selectedRule.push(result);
                console.log(selectedRule);
                table.reload("selectedRule",{
                    data:selectedRule
                })
            });

            return false;
        });
        table.render({
            elem: '#selectedRule',
            title: '已有规则列表',
            page: true,
            data:selectedRule,
            toolbar: '#toolbarselectedRule',
            cellMinWidth: 80,
            cols: [[
                {type: 'numbers'},
                {field: 'id', title: 'ID', align: "center", hide: true},
                {field: 'stflmc', title: '分类', align: "center"},
                {field: 'stnd', title: '难度', align: "center",templet: '#stndTemplate'},
                {field: 'pdtsl', title: '判断题', align: "center",edit:'text'},
                {field: 'dxtsl', title: '单选题', align: "center",edit:'text'},
                {field: 'dxtssl', title: '多选题', align: "center",edit:'text'},
                {fixed: 'right', width: 250, align: 'center', title: '操作', toolbar: '#rowbarselectedRule'}
            ]]
        });

        table.on("tool(selectedRule)",function (obj) {
            switch (obj.event) {
                case 'del':
                    $.post("${pageContext.request.contextPath }/kszx/sjgl/modifyRandomRule/del",{data:JSON.stringify(obj.data)},function (data) {
                        for(var i=0;i<selectedRule.length;i++){
                            if(selectedRule[i].id == obj.data.id){
                                selectedRule.splice(i,1);
                                break;
                            }
                        }
                        table.reload("selectedRule",{data:selectedRule});
                    })
            }
        });

        table.on("edit(selectedRule)",function (obj) {
            var data = obj.data;
            $.post("${pageContext.request.contextPath }/kszx/sjgl/modifyRandomRule/update",{data:JSON.stringify(data)},function (data) {
                for(var i=0;i<selectedRule.length;i++){
                    if(selectedRule[i].id == data.id){
                        switch (obj.field) {
                            case 'pdtsl':
                                selectedRule[i].pdtsl = obj.value;
                                break;
                            case 'dxtsl':
                                selectedRule[i].dxtsl = obj.value;
                                break;
                            case 'dxtssl':
                                selectedRule[i].dxtssl = obj.value;
                                break;
                        }
                        break;
                    }
                }
                layer.msg("规则已更新！");
            })
        })


    })
</script>
</html>
